using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Zavrsni.Models;
using Zavrsni.Services;

namespace Zavrsni.ViewModels
{
    public partial class MessageDisplayViewModel : ViewModelBase
    {
        private readonly MessageService _messageService;

        [ObservableProperty]
        private Message _message;

        public ICommand DeleteMessageCommand;

        public MessageDisplayViewModel(MessageService messageService, Message message)
        {
            _messageService = messageService;
            Message = message;
        }
    }
}
