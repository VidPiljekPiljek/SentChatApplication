using Sentry;
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
        private readonly UserStore _userStore;

        public event Action<Message> MessageReceived;
        public event Action<Message> MessageDeleted;

        public MessageService(ConversationService conversationService, MessageRepository messageRepository, MessageStore messageStore, UserStore userStore)
        {
            _conversationService = conversationService;
            _messageRepository = messageRepository;
            _messageStore = messageStore;

            _messageStore.MessageAdded += OnMessageAdded;
            _messageStore.MessageRemoved += OnMessageRemoved;
            _userStore = userStore;
        }

        public async Task<List<Message>> LoadConversationMessagesAsync(string conversationId)
        {
            if (_messageStore.HasMessagesLoaded(conversationId))
            {
                return _messageStore.GetMessagesForConversation(conversationId).ToList();
            }
            else
            {
                var messages = await _messageRepository.GetMessagesForConversationAsync(conversationId);

                _messageStore.SetUserMessages(conversationId, messages);

                return messages;
            }
            
        }

        public async Task<OperationResult> SendMessageAsync(Message message)
        {
            var messageOperationResult = await _messageRepository.CreateMessageAsync(message);

            if (messageOperationResult.IsSuccess)
            {
                SentrySdk.AddBreadcrumb(
                    message: "Message sent successfully.",
                    category: "Message sending success",
                    level: BreadcrumbLevel.Info
                );

                messageOperationResult.Data.Sender = new UserProfile()
                {
                    Id = messageOperationResult.Data.SenderId,
                    Username = _userStore.GetCurrentUserUsername()
                };

                _messageStore.AddMessage(messageOperationResult.Data.ConversationId, messageOperationResult.Data);
                return OperationResult.Success();
            }
            else
            {
                SentrySdk.AddBreadcrumb(
                    message: $"Message sending failed due to: {messageOperationResult.Message}",
                    category: "Message sending failure",
                    level: BreadcrumbLevel.Info
                );

                return messageOperationResult;
            }
        }

        public async Task<OperationResult> DeleteMessageAsync(string conversationId, string messageId)
        {
            var messageOperationResult = await _messageRepository.DeleteMessageAsync(messageId);

            if (messageOperationResult.IsSuccess)
            {
                SentrySdk.AddBreadcrumb(
                    message: "Message deleted successfully.",
                    category: "Message deletion success",
                    level: BreadcrumbLevel.Info
                );

                //_messageStore.RemoveMessage(conversationId, messageId);
                return OperationResult.Success();
            }
            else
            {
                SentrySdk.AddBreadcrumb(
                    message: $"Message deletion failed due to: {messageOperationResult.Message}",
                    category: "Message deletion failure",
                    level: BreadcrumbLevel.Info
                );

                return messageOperationResult;
            }
        }

        public void OnMessageAdded(Message message)
        {
            MessageReceived?.Invoke(message);
        }

        public void OnMessageRemoved(Message message)
        {
            MessageDeleted?.Invoke(message);
        }
    }
}
