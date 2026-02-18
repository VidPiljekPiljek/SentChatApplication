using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;

namespace Zavrsni.Stores
{
    public class MessageStore
    {
        public readonly Dictionary<string, List<Message>> _messageCache = new();

        public event EventHandler<string>? MessagesLoadedForConversation;
        public event EventHandler<Message>? MessageAdded;

        public MessageStore() 
        {
        }

        public bool HasMessagesLoaded(string conversationId)
        {
            return _messageCache.ContainsKey(conversationId);
        }

        public void SetUserMessages(string conversationId, List<Message> messages)
        {
            _messageCache[conversationId] = messages;
            MessagesLoadedForConversation?.Invoke(this, conversationId);
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
        }
    }
}
