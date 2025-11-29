using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Mappers;
using Zavrsni.Models;
using Zavrsni.Services;

namespace Zavrsni.ViewModels.MessagesPageViewModels
{
    // Separating the larger view into smaller views for easy maintainability
    public partial class MessagesViewModel : ViewModelBase
    {
        private readonly MessageService _messageService;
        private readonly ConversationService _conversationService;

        [ObservableProperty]
        private ChatInputBoxViewModel _chatInputBoxViewModel;

        [ObservableProperty]
        private string _conversationName;

        [ObservableProperty]
        private ObservableCollection<MessageDisplayViewModel> _messages = new ObservableCollection<MessageDisplayViewModel>();

        public MessagesViewModel(MessageService messageService, ConversationService conversationService, UserService userService)
        {
            _messageService = messageService;
            _conversationService = conversationService;

            _chatInputBoxViewModel = new ChatInputBoxViewModel(conversationService, userService, messageService, this);
        }

        public void LoadMessagesForConversation(int conversationId)
        {
            ObservableCollection<Message> messages = new ObservableCollection<Message>(_messageService.GetMessagesForConversation(conversationId));
            Messages = new ObservableCollection<MessageDisplayViewModel>(MessageDisplayViewModelMapper.ToDisplayViewModels(messages));
        }

        public void GetSelectedConversationTitle()
        {
            ConversationName = _conversationService.GetSelectedConversationTitle();
        }

        public void AddMessage(Message message)
        {
            Messages.Add(MessageDisplayViewModelMapper.ToDisplayViewModel(message));
        }
    }
}
