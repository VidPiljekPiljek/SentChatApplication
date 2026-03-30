using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Authenticators;
using Zavrsni.ErrorHandling;
using Zavrsni.Services;
using Zavrsni.Stores;

namespace Zavrsni.Handlers
{
    public class SessionHandler
    {
        private readonly Supabase.Client _supabaseClient;
        private readonly SupabaseRealtimeService _supabaseRealtimeService;
        private readonly SupabaseSessionPersistenceService _supabaseSessionPersistenceService;
        private readonly UserAuthenticator _userAuthenticator;
        private readonly UserStore _userStore;
        private readonly ConversationStore _conversationStore;
        private readonly MessageStore _messageStore;

        public SessionHandler(Supabase.Client supabaseClient, SupabaseRealtimeService supabaseRealtimeService, SupabaseSessionPersistenceService supabaseSessionPersistenceService, UserAuthenticator userAuthenticator, UserStore userStore, ConversationStore conversationStore, MessageStore messageStore)
        {
            _supabaseClient = supabaseClient;
            _supabaseRealtimeService = supabaseRealtimeService;
            _supabaseSessionPersistenceService = supabaseSessionPersistenceService;
            _userAuthenticator = userAuthenticator;
            _userStore = userStore;
            _conversationStore = conversationStore;
            _messageStore = messageStore;
        }

        public async Task<OperationResult> LoginAsync(string email, string password)
        {
            var signInResult = await _userAuthenticator.LoginAsync(email, password);
            return await StartSessionAsync(signInResult.Data);
        }

        public async Task<OperationResult> RestoreSessionAsync()
        {
            var token = _supabaseClient.Auth.CurrentSession?.AccessToken;

            if (token is null)
            {
                return OperationResult.Failure("No session to restore.");
            }

            _supabaseClient.Realtime.SetAuth(token);

            return await StartSessionAsync(_supabaseClient.Auth.CurrentUser.Id);
        }

        private async Task<OperationResult> StartSessionAsync(string userId)
        {
            var profileResult = await _userAuthenticator.GetUserProfileAsync(userId);
            if (!profileResult.IsSuccess)
            {
                return OperationResult.Failure(profileResult.Message);
            }
            _userStore.SetCurrentUserProfile(profileResult.Data);
            await _supabaseClient.Realtime.ConnectAsync();
            await _supabaseRealtimeService.SubscribeToUserConversationsAsync();
            return OperationResult.Success();
        }

        public async Task<OperationResult> LogoutAsync()
        {
            await _supabaseRealtimeService.UnsubscribeFromAllAsync();
            _supabaseClient.Realtime.Disconnect();
            await _userAuthenticator.LogoutAsync();
            _supabaseSessionPersistenceService.DestroySession();
            _userStore.Clear();
            _conversationStore.Clear();
            _messageStore.Clear();
            return OperationResult.Success();
        }
    }
}
