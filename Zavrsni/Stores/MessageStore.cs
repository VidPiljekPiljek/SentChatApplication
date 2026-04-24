using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Services;

namespace Zavrsni.Stores
{
    public class MessageStore
    {
        private readonly SupabaseRealtimeService _supabaseRealtimeService;
        public readonly Dictionary<string, List<Message>> _messageCache = new();

        public event EventHandler<string>? MessagesLoadedForConversation;
        public event Action<Message>? MessageAdded;
        public event Action<Message>? MessageRemoved;

        public MessageStore(SupabaseRealtimeService supabaseRealtimeService) 
        {
            _supabaseRealtimeService = supabaseRealtimeService;

            _supabaseRealtimeService.MessageReceived += (sender, message) =>
            {
                AddMessage(message.ConversationId, message);
            };

            _supabaseRealtimeService.MessageDeleted += (sender, message) =>
            {
                RemoveMessageById(message.Id);
            };
        }

        public bool HasMessagesLoaded(string conversationId)
        {
            return _messageCache.ContainsKey(conversationId);
        }

        public void SetMessagesForConversation(string conversationId, List<Message> messages)
        {
            _messageCache[conversationId] = messages;
            MessagesLoadedForConversation?.Invoke(this, conversationId);
        }

        public void SetMessagesForConversations(Dictionary<string, List<Message>> messagesByConversation)
        {
            _messageCache.Clear();

            foreach (var kvp in messagesByConversation)
            {
                _messageCache[kvp.Key] = kvp.Value;
                MessagesLoadedForConversation?.Invoke(this, kvp.Key);
            }
        }

        public List<Message> GetMessagesForConversation(string conversationId)
        {
            if (_messageCache.TryGetValue(conversationId, out var messages))
            {
                return messages;
            }

            return null;
        }

        public void AddMessage(string conversationId, Message message)
        {
            _messageCache[conversationId].Add(message);
            MessageAdded?.Invoke(message);
        }

        public void AddConversation(string conversationId)
        {
            _messageCache[conversationId] = new List<Message>();
        }

        public void RemoveMessage(string conversationId, string messageId)
        {
            if (_messageCache.TryGetValue(conversationId, out var messages))
            {
                var messageToRemove = messages.FirstOrDefault(m => m.Id == messageId);
                MessageRemoved?.Invoke(messageToRemove);

                if (messageToRemove != null)
                {
                    messages.Remove(messageToRemove);
                }
            }
        }

        public void RemoveMessageById(string messageId)
        {
            foreach (var kvp in _messageCache)
            {
                var messages = kvp.Value;
                var messageToRemove = messages.FirstOrDefault(m => m.Id == messageId);

                if (messageToRemove != null)
                {
                    messages.Remove(messageToRemove);
                    MessageRemoved?.Invoke(messageToRemove);
                    return;
                }
            }
        }

        public void Clear()
        {
            _messageCache.Clear();
            MessagesLoadedForConversation = null;
        }
    }
}
