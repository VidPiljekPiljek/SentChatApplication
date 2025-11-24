using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Zavrsni.Commands;
using Zavrsni.Models;
using Zavrsni.Services;

namespace Zavrsni.ViewModels
{
    public partial class ChatInputBoxViewModel : ViewModelBase
    {
        private readonly ConversationService _conversationService;
        private readonly UserService _userService;

        [ObservableProperty]
        private string _text;

        [ObservableProperty]
        private Message _message;

        public ICommand SendMessageCommand;

        public ChatInputBoxViewModel(ConversationService conversationService, UserService userService, MessageService messageService)
        {
            _conversationService = conversationService;
            _userService = userService;

            SendMessageCommand = new SendMessageCommand(this, messageService);
        }

        [RelayCommand]
        private void SendMessageParameter()
        {
            Message = new Message(Text, _userService.GetCurrentUserId(), _conversationService.GetSelectedConversationId(), DateTime.Now);

            SendMessageCommand.Execute(Message);
        }
    }
}
