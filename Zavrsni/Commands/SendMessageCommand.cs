using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Services;
using Zavrsni.ViewModels;
using Zavrsni.ViewModels.MessagesPageViewModels;
using Zavrsni.Views.MessagesPageViews;

namespace Zavrsni.Commands
{
    public class SendMessageCommand : AsyncCommandBase
    {
        private readonly ChatInputBoxViewModel _chatInputBoxViewModel;
        private readonly MessagesViewModel _messagesViewModel;
        private readonly MessageService _messageService;

        public SendMessageCommand(ChatInputBoxViewModel chatInputBoxViewModel, MessagesViewModel messagesViewModel, MessageService messageService)
        {
            _chatInputBoxViewModel = chatInputBoxViewModel;
            _messagesViewModel = messagesViewModel;
            _messageService = messageService;
        }

        public async override Task ExecuteAsync(object? parameter)
        {
            Message displayMessage = (Message)parameter!;

            Message dbMessage = new Message
            {
                Text = displayMessage.Text,
                SenderId = displayMessage.SenderId,
                ConversationId = displayMessage.ConversationId,
                SentAt = displayMessage.SentAt
            };

            var messageOperationResult = await _messageService.SendMessageAsync(dbMessage);

            if (messageOperationResult.IsSuccess)
            {
                displayMessage.Id = dbMessage.Id;
                _messagesViewModel.AddMessage(displayMessage);
            }
            else
            {
                _chatInputBoxViewModel.Text = messageOperationResult.Message;
            }
        }
    }
}
