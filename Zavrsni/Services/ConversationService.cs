using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.ErrorHandling;
using Zavrsni.Models;
using Zavrsni.Repositories;
using Zavrsni.Stores;

namespace Zavrsni.Services
{
    public class ConversationService
    {
        private readonly ConversationRepository _conversationRepository;
        private readonly ConversationStore _conversationStore;
        private readonly UserStore _userStore;

        public ConversationService(ConversationRepository conversationRepository, ConversationStore conversationStore, UserStore userStore)
        {
            _conversationRepository = conversationRepository;
            _conversationStore = conversationStore;
            _userStore = userStore;
        }

        public async Task<bool> LoadUserConversations()
        {
            List<Conversation> dbUserConversations = await _conversationRepository.GetUserConversationsAsync(_userStore.CurrentUser.Id);
            return await _conversationStore.SetUserConversations(dbUserConversations);
        }

        public ObservableCollection<Conversation> GetUserConversations()
        {
            return _conversationStore.GetUserConversations();
        }

        public bool SelectConversation(Conversation conversation)
        {
            return _conversationStore.SetSelectedConversation(conversation);
        }

        public int GetSelectedConversationId()
        {
            return _conversationStore.GetSelectedConversationId();
        }

        public string GetSelectedConversationTitle()
        {
            return _conversationStore.GetSelectedConversationTitle();
        }

        public async Task<OperationResult<Conversation>> AddConversationAsync(Conversation conversation)
        {
            var dbConversationResult = await _conversationRepository.CreateConversationAsync(conversation);

            if (dbConversationResult.IsSuccess && dbConversationResult.Data != null)
            {
                _conversationStore.AddConversation(dbConversationResult.Data);
            }

            return dbConversationResult;
        }
    }
}
