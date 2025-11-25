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
using Zavrsni.ViewModels.MessagesPageViewModels;

namespace Zavrsni.ViewModels
{
    public partial class ChatInputBoxViewModel : ViewModelBase
    {
        private readonly ConversationService _conversationService;
        private readonly UserService _userService;

        [ObservableProperty]
        [NotifyPropertyChangedFor(nameof(CanSendMessage))]
        private string _text;

        partial void OnTextChanged(string value)
        {
            SendMessageParameterCommand.NotifyCanExecuteChanged();
        }

        [ObservableProperty]
        private Message _message;

        public bool CanSendMessage => !string.IsNullOrEmpty(Text);

        public ICommand SendMessageCommand;

        public ChatInputBoxViewModel(ConversationService conversationService, UserService userService, MessageService messageService, MessagesViewModel messagesViewModel)
        {
            _conversationService = conversationService;
            _userService = userService;

            SendMessageCommand = new SendMessageCommand(this, messagesViewModel, messageService);
        }

        [RelayCommand(CanExecute = nameof(CanSendMessage))]
        private void SendMessageParameter()
        {
            Message = new Message(Text, _userService.GetCurrentUserId(), _conversationService.GetSelectedConversationId(), DateTime.Now);

            SendMessageCommand.Execute(Message);
        }
    }
}
