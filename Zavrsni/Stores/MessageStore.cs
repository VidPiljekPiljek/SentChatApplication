using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;

namespace Zavrsni.Stores
{
    public class MessageStore
    {
        public ObservableCollection<Message> _userMessages;

        public ObservableCollection<Message> UserMessages
        {
            get { return _userMessages; }
            set { _userMessages = value; }
        }

        public MessageStore() 
        {
            _userMessages = new ObservableCollection<Message>();
        }

        public async Task<bool> SetUserMessages(List<Message> dbMessages)
        {
            _userMessages = new ObservableCollection<Message>(dbMessages);
            return true;
        }

        public ObservableCollection<Message> GetUserMessages()
        {
            return _userMessages;
        }

        public ObservableCollection<Message> GetMessagesForConversation(int conversationId)
        {
            return new ObservableCollection<Message>(UserMessages.Where(m => m.ConversationId == conversationId));
        }

        public bool AddMessage(Message message)
        {
            UserMessages.Add(message);
            return true;
        }
    }
}
