using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Services;
using Zavrsni.ViewModels;

namespace Zavrsni.Commands
{
    public class SendMessageCommand : AsyncCommandBase
    {
        private readonly ChatInputBoxViewModel _chatInputBoxViewModel;
        private readonly MessageService _messageService;

        public SendMessageCommand(ChatInputBoxViewModel chatInputBoxViewModel, MessageService messageService)
        {
            _chatInputBoxViewModel = chatInputBoxViewModel;
            _messageService = messageService;
        }

        public async override Task ExecuteAsync(object? parameter)
        {
            try
            {
                Message message = (Message)parameter!;

                if (await _messageService.SendMessage(message))
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
