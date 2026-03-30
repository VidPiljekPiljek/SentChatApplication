using Supabase.Realtime;
using Supabase.Realtime.PostgresChanges;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Channels;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Repositories;
using Zavrsni.Stores;

namespace Zavrsni.Services
{
    public class SupabaseRealtimeService
    {
        private readonly Supabase.Client _supabaseClient;
        private readonly MessageRepository _messageRepository;
        private readonly UserStore _userStore;
        private readonly List<RealtimeChannel> _activeChannels = new();

        public event EventHandler<Message>? MessageReceived;
        public event EventHandler<Message>? MessageDeleted;

        public SupabaseRealtimeService(Supabase.Client supabaseClient, MessageRepository messageRepository, UserStore userStore)
        {
            _supabaseClient = supabaseClient;
            _userStore = userStore;
            _messageRepository = messageRepository;
        }

        public async Task SubscribeToUserConversationsAsync()
        {
            var messagesChannel = _supabaseClient.Realtime.Channel("public-messages");

            messagesChannel.Register(new PostgresChangesOptions("public", "messages"));

            await messagesChannel.Subscribe();

            messagesChannel.AddPostgresChangeHandler(PostgresChangesOptions.ListenType.Inserts, async (sender, change) =>
            {
                await HandleMessageInsert(change);
            });
            messagesChannel.AddPostgresChangeHandler(PostgresChangesOptions.ListenType.Deletes, async (sender, change) =>
            {
                await HandleMessageDelete(change);
            });

            _activeChannels.Add(messagesChannel);
        }

        public async Task UnsubscribeFromAllAsync()
        {
            foreach (var channel in _activeChannels)
            {
                channel.Unsubscribe();
            }
            _activeChannels.Clear();
        }

        public async Task HandleMessageInsert(PostgresChangesResponse change)
        {
            var newMessageResponse = change.Model<Message>();
            var fullMessageResponse = await _messageRepository.GetMessageWithSenderAsync(newMessageResponse.Id!);

            if (!fullMessageResponse.IsSuccess)
            {
                return;
            }

            // To be used with the old method of sending messages.
            if (fullMessageResponse.Data.SenderId == _userStore.GetCurrentUserId())
            {
                return;
            }

            OnMessageReceived(fullMessageResponse.Data);
        }

        public async Task HandleMessageDelete(PostgresChangesResponse change)
        {
            var deletedMessageResponse = change.OldModel<Message>();

            if (deletedMessageResponse.SenderId == _userStore.GetCurrentUserId())
            {
                return;
            }

            OnMessageDeleted(deletedMessageResponse);
        }

        private void OnMessageReceived(Message fullMessage)
        {
            MessageReceived?.Invoke(this, fullMessage);
        }

        private void OnMessageDeleted(Message fullMessage)
        {
            MessageDeleted?.Invoke(this, fullMessage);
        }
    }
}
