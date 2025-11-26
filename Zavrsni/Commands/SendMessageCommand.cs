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
            try
            {
                Message message = (Message)parameter!;

                _messagesViewModel.AddMessage(message);

                if (await _messageService.SendMessageAsync(message))
                {
                    _chatInputBoxViewModel.Text = "Sent!";
                }
                else
                {
                    _chatInputBoxViewModel.Text = "Error!";
                }
            }
            catch (Exception ex)
            {
                _chatInputBoxViewModel.Text = $"A fatal error has occured: {ex.Message}";
            }
        }
    }
}
