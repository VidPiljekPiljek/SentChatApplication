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
        private ChatInputBoxViewModel _chatInputBoxViewModel;

        [ObservableProperty]
        private List<Message> _messages = new List<Message>();

        public MessagesViewModel(MessageService messageService, ConversationService conversationService, UserService userService)
        {
            _messageService = messageService;

            _chatInputBoxViewModel = new ChatInputBoxViewModel(conversationService, userService, messageService);
        }

        public void LoadMessagesForConversation(int conversationId)
        {
            Messages = new List<Message>(_messageService.GetMessagesForConversation(conversationId));
        }
    }
}
