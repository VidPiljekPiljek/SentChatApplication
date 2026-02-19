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

        public MessageService(ConversationService conversationService, MessageRepository messageRepository, MessageStore messageStore)
        {
            _conversationService = conversationService;
            _messageRepository = messageRepository;
            _messageStore = messageStore;
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

        public async Task<OperationResult<Message>> SendMessageAsync(Message message)
        {
            var messageOperationResult = await _messageRepository.CreateMessageAsync(message);

            if (messageOperationResult.IsSuccess)
            {
                SentrySdk.AddBreadcrumb(
                    message: "Message sent successfully.",
                    category: "Message sending success",
                    level: BreadcrumbLevel.Info
                );

                _messageStore.AddMessage(messageOperationResult.Data.ConversationId, messageOperationResult.Data);
                return OperationResult<Message>.Success(messageOperationResult.Data);
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

                _messageStore.RemoveMessage(conversationId, messageId);
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
    }
}
