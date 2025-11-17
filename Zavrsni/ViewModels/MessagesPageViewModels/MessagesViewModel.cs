using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Services;

namespace Zavrsni.ViewModels.MessagesPageViewModels
{
    // Separating the larger view into smaller views for easy maintainability
    public partial class MessagesViewModel : ViewModelBase
    {
        private readonly MessageService _messageService;

        [ObservableProperty]
        private List<Message> _messages = new List<Message>();

        public MessagesViewModel(MessageService messageService)
        {
            _messageService = messageService;
        }

        public void LoadMessagesForConversation(int conversationId)
        {
            Messages = new List<Message>(_messageService.GetMessagesForConversation(conversationId));
        }
    }
}
