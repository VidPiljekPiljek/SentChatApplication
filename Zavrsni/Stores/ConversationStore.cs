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

        // For easier Message creation in ChatInputBoxViewModel for now
        public Conversation SelectedConversation { get; set; }

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

        public bool SetSelectedConversation(Conversation conversation)
        {
            SelectedConversation = conversation;
            return true;
        }

        public void Clear()
        {
            _userConversations.Clear();
            SelectedConversation = null;
        }

        public string GetSelectedConversationId()
        {
            return SelectedConversation.Id;
        }

        public List<string> GetConversationIds()
        {
            return UserConversations.Select(c => c.Id).ToList();
        }

        public string GetSelectedConversationTitle()
        {
            return SelectedConversation.Name;
        }

        public void AddConversation(Conversation conversation)
        {
            UserConversations.Add(conversation);
        }
    }
}
