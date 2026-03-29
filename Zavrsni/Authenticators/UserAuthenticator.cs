using Microsoft.AspNetCore.Identity;
using Sentry;
using Supabase.Gotrue;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.ErrorHandling;
using Zavrsni.Mappers;
using Zavrsni.Models;
using Zavrsni.Repositories;
using Zavrsni.Services;
using Zavrsni.Stores;

namespace Zavrsni.Authenticators
{
    public class UserAuthenticator
    {
        private readonly Supabase.Client _supabaseClient;
        private readonly UserRepository _userRepository;
        private readonly UserStore _userStore;
        private readonly PasswordHasher<UserProfile> _passwordHasher = new();
        private readonly SupabaseRealtimeService _supabaseRealtimeService;

        public UserAuthenticator(Supabase.Client supabaseClient, UserRepository userRepository, UserStore userStore, SupabaseRealtimeService supabaseRealtimeService)
        {
            _supabaseClient = supabaseClient;
            _userRepository = userRepository;
            _userStore = userStore;
            _supabaseRealtimeService = supabaseRealtimeService;
        }

        public async Task<OperationResult> AuthenticateUser(string email, string password)
        {
            var signInResult = await _userRepository.SignInAsync(email, password);

            if (!signInResult.IsSuccess)
            {
                return OperationResult.Failure(signInResult.Message);
            }

            return await CompleteAuthentication(signInResult.Data);
        }

        public async Task<OperationResult> RestoreSessionAsync()
        {
            var token = _supabaseClient.Auth.CurrentSession?.AccessToken;

            if (token is null)
            {
                return OperationResult.Failure("No session to restore.");
            }

            _supabaseClient.Realtime.SetAuth(token);

            return await CompleteAuthentication(_supabaseClient.Auth.CurrentUser.Id);
        }

        private async Task<OperationResult> CompleteAuthentication(string userId)
        {
            var userProfileResult = await _userRepository.GetUserProfileAsync(userId);

            if (!userProfileResult.IsSuccess)
            {
                return OperationResult<UserProfile>.Failure(userProfileResult.Message);
            }

            _userStore.SetCurrentUserProfile(userProfileResult.Data);

            await _supabaseClient.Realtime.ConnectAsync();

            await _supabaseRealtimeService.SubscribeToUserConversationsAsync();

            return OperationResult.Success();
        }
    }
}
