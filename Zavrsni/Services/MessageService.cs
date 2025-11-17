using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Repositories;
using Zavrsni.Stores;

namespace Zavrsni.Services
{
    public class MessageService
    {
        private readonly ConversationService _conversationService;
        private readonly MessageRepository _messageRepository;
        private readonly MessageStore _messageStore;

        public MessageService(ConversationService conversationService, MessageRepository messageRepository, MessageStore messageStore)
        {
            _conversationService = conversationService;
            _messageRepository = messageRepository;
            _messageStore = messageStore;
        }

        public async Task<bool> LoadUserMessages()
        {
            ObservableCollection<Conversation> userConversations = _conversationService.GetUserConversations();
            List<Message> dbUserMessages = await _messageRepository.GetUserMessages(userConversations);
            return await _messageStore.SetUserMessages(dbUserMessages);
        }

        public ObservableCollection<Message> GetMessagesForConversation(int conversationId)
        {
            return _messageStore.GetMessagesForConversation(conversationId);
        }
    }
}
