using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;

namespace Zavrsni.Stores
{
    public class ConversationStore
    {
        private ObservableCollection<Conversation> _userConversations;
        public ObservableCollection<Conversation> UserConversations
        {
            get { return _userConversations; }
            set { _userConversations = value; }
        }

        public ConversationStore()
        {
            _userConversations = new ObservableCollection<Conversation>();
        }

        public async Task<bool> SetUserConversations(List<Conversation> dbConversations)
        {
            _userConversations = new ObservableCollection<Conversation>(dbConversations);
            return true;
        }

        public ObservableCollection<Conversation> GetUserConversations()
        {
            return _userConversations;
        }
    }
}
