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
        [ObservableProperty]
        private MessagesViewModel _messagesViewModel;

        [ObservableProperty]
        private ConversationSidebarViewModel _conversationSidebarViewModel;


        public MessagesPageViewModel(ConversationService conversationService) : base(ApplicationPageNames.Messages)
        {
            _messagesViewModel = new MessagesViewModel();
            _conversationSidebarViewModel = new ConversationSidebarViewModel(conversationService);
        }
    }
}
