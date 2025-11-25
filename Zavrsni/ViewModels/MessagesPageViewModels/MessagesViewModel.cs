using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
        private ChatInputBoxViewModel _chatInputBoxViewModel;

        [ObservableProperty]
        private ObservableCollection<Message> _messages = new ObservableCollection<Message>();

        public MessagesViewModel(MessageService messageService, ConversationService conversationService, UserService userService)
        {
            _messageService = messageService;

            _chatInputBoxViewModel = new ChatInputBoxViewModel(conversationService, userService, messageService, this);
        }

        public void LoadMessagesForConversation(int conversationId)
        {
            Messages = new ObservableCollection<Message>(_messageService.GetMessagesForConversation(conversationId));
        }

        public void AddMessage(Message message)
        {
            Messages.Add(message);
        }
    }
}
