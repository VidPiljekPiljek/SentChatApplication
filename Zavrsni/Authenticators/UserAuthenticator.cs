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

        public UserAuthenticator(Supabase.Client supabaseClient, UserRepository userRepository)
        {
            _supabaseClient = supabaseClient;
            _userRepository = userRepository;
        }

        public async Task<OperationResult<string>> LoginAsync(string email, string password)
        {
            var signInResult = await _userRepository.SignInAsync(email, password);

            if (!signInResult.IsSuccess)
            {
                return OperationResult<string>.Failure(signInResult.Message);
            }

            return OperationResult<string>.Success(signInResult.Data);
        }

        public async Task<OperationResult<UserProfile>> GetUserProfileAsync(string userId)
        {
            return await _userRepository.GetUserProfileAsync(userId);
        }

        public async Task<OperationResult> LogoutAsync()
        {
            await _supabaseClient.Auth.SignOut();
            
            return OperationResult.Success();
        }
    }
}
