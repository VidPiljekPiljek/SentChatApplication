using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
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
        [ObservableProperty]
        private MessagesViewModel _messagesViewModel;

        [ObservableProperty]
        private ConversationSidebarViewModel _conversationSidebarViewModel;

        public MessagesPageViewModel(ConversationService conversationService, MessageService messageService, ConversationSidebarViewModel conversationSidebarViewModel, MessagesViewModel messagesViewModel) : base(ApplicationPageNames.Messages)
        {
            _messagesViewModel = messagesViewModel;
            _conversationSidebarViewModel = conversationSidebarViewModel;

            ConversationSidebarViewModel.PropertyChanged += OnConversationChanged;
        }

        private void OnConversationChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == nameof(ConversationSidebarViewModel.SelectedConversation))
            {
                var selectedConversation = ConversationSidebarViewModel.SelectedConversation;
                if (selectedConversation != null)
                {
                    MessagesViewModel.LoadMessagesForConversation(selectedConversation.Id);
                }
            }
        }
    }
}
