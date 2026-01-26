using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.Messaging;
using Sentry;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Zavrsni.Commands;
using Zavrsni.Messages;
using Zavrsni.Models;
using Zavrsni.Services;

namespace Zavrsni.ViewModels
{
    public partial class MessageDisplayViewModel : ViewModelBase
    {
        private readonly MessageService _messageService;

        public EventHandler<MessageDisplayViewModel>? MessageDeleted;

        [ObservableProperty]
        private Message _message;

        [ObservableProperty]
        private string _errorMessage;

        public ICommand DeleteMessageCommand { get; }

        public MessageDisplayViewModel(MessageService messageService, Message message, UserService userService)
        {
            _messageService = messageService;
            Message = message;
            
            DeleteMessageCommand = new DeleteMessageCommand(this, _messageService, userService);
        }
    }
}
