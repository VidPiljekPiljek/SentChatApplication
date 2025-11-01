using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Data;
using Zavrsni.Models;

namespace Zavrsni.ViewModels
{
    public partial class MessagesPageViewModel : PageViewModel
    {
        [ObservableProperty]
        private User _selectedUser;

        [ObservableProperty]
        private List<Message> _messages = new List<Message>();

        public MessagesPageViewModel() : base(ApplicationPageNames.Messages)
        {
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
    }
}
