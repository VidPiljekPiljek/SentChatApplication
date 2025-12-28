using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.ErrorHandling;
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
            List<Message> dbUserMessages = await _messageRepository.GetUserMessagesAsync(userConversations);
            return await _messageStore.SetUserMessages(dbUserMessages);
        }

        public ObservableCollection<Message> GetMessagesForConversation(int conversationId)
        {
            return _messageStore.GetMessagesForConversation(conversationId);
        }

        public async Task<OperationResult> SendMessageAsync(Message message)
        {
            var messageOperationResult = await _messageRepository.CreateMessageAsync(message);

            if (messageOperationResult.IsSuccess && messageOperationResult.Data != null)
            {
                _messageStore.AddMessage(messageOperationResult.Data);
                return OperationResult.Success();
            }
            else
            {
                return messageOperationResult;
            }
        }

        public async Task<OperationResult> DeleteMessageAsync(int messageId)
        {
            var messageOperationResult = await _messageRepository.DeleteMessageAsync(messageId);

            if (messageOperationResult.IsSuccess)
            {
                _messageStore.RemoveMessage(messageId);
                return OperationResult.Success();
            }
            else
            {
                return messageOperationResult;
            }
        }
    }
}
