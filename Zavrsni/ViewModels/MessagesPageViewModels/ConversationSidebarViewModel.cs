using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Services;

namespace Zavrsni.ViewModels.MessagesPageViewModels
{
    // Separating the larger view into smaller views for easy maintainability
    public partial class ConversationSidebarViewModel : ViewModelBase
    {
        private readonly ConversationService _conversationService;

        [ObservableProperty]
        private ObservableCollection<Conversation> _userConversations = new ObservableCollection<Conversation>();

        // Writing field and property this way allows for the PropertyChanged event to fire easily, fixing the problem of the MessagesPageViewModel method not firing
        private Conversation _selectedConversation;
        public Conversation SelectedConversation
        {
            get { return _selectedConversation; 
            }
            set
            {
                _selectedConversation = value;
                OnPropertyChanged(nameof(SelectedConversation));
            }
        }

        public ConversationSidebarViewModel(ConversationService conversationService) 
        {
            _conversationService = conversationService;

            UserConversations = _conversationService.GetUserConversations();
        }

        [RelayCommand]
        public void ChangeConversation(Conversation conversation)
        {
            if (conversation != null)
            {
                SelectedConversation = conversation;
            }
        }
    }
}
