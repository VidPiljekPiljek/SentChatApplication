using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Data;
using Zavrsni.Models;
using Zavrsni.Services;
using Zavrsni.ViewModels.MessagesPageViewModels;

namespace Zavrsni.ViewModels
{
    public partial class MessagesPageViewModel : PageViewModel
    {
        private readonly ConversationService _conversationService;

        [ObservableProperty]
        private MessagesViewModel _messagesViewModel;

        [ObservableProperty]
        private ConversationSidebarViewModel _conversationSidebarViewModel;

        [ObservableProperty]
        private User _selectedUser;

        [ObservableProperty]
        private List<Message> _messages = new List<Message>();

        [ObservableProperty]
        private ObservableCollection<Conversation> _userConversations = new ObservableCollection<Conversation>();

        public MessagesPageViewModel(ConversationService conversationService) : base(ApplicationPageNames.Messages)
        {
            _conversationService = conversationService;

            IsLoaded = false;
            _selectedUser = new User { Id = 1, Username = "David Košanski", Password = "blabla", ProfilePicture = "David" };

            _messages.Add(new Message
            {
                Id = 2,
                Text = "Hello",
                SenderId = 1,
                ConversationId = 2
            });

            for (int i = 0; i < 15; i++)
            {
                _messages.Add(new Message
                {
                    Id = 3,
                    Text = "Yay!",
                    SenderId = 1,
                    ConversationId = 2
                });
            }
        }

        public override bool LoadViewModel()
        {
            UserConversations = _conversationService.GetUserConversations();
            IsLoaded = true;
            return true;
        }
    }
}
