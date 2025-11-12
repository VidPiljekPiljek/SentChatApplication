using CommunityToolkit.Mvvm.ComponentModel;
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

        public ConversationSidebarViewModel(ConversationService conversationService) 
        {
            _conversationService = conversationService;

            UserConversations = _conversationService.GetUserConversations();
        }
    }
}
