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
using Zavrsni.ViewModels.MessagesPageViewModels;

namespace Zavrsni.Services
{
    public class ConversationService
    {
        private readonly ConversationRepository _conversationRepository;
        private readonly ConversationStore _conversationStore;
        private readonly ConversationMemberRepository _conversationMemberRepository;
        private readonly UserRepository _userRepository;
        private readonly UserStore _userStore;

        public ConversationService(ConversationRepository conversationRepository, ConversationStore conversationStore, ConversationMemberRepository conversationMemberRepository, UserRepository userRepository, UserStore userStore)
        {
            _conversationRepository = conversationRepository;
            _conversationStore = conversationStore;
            _conversationMemberRepository = conversationMemberRepository;
            _userRepository = userRepository;
            _userStore = userStore;
        }

        public async Task<bool> LoadUserConversations()
        {
            List<Conversation> dbUserConversations = await _conversationRepository.GetUserConversationsAsync(_userStore.CurrentUserProfile.Id);
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
        
        public List<string> GetConversationIds()
        {
            return _conversationStore.GetConversationIds();
        }

        public string GetSelectedConversationId()
        {
            return _conversationStore.GetSelectedConversationId();
        }

        public string GetSelectedConversationTitle()
        {
            return _conversationStore.GetSelectedConversationTitle();
        }

        public async Task<OperationResult> AddConversationAsync(string conversationSearchName)
        {
            var userOperationResult = await _userRepository.GetUserByUsernameAsync(conversationSearchName);
            if (userOperationResult.IsSuccess && userOperationResult.Data != null)
            {
                var conversation = new Conversation
                {
                    Name = $"{_userStore.GetCurrentUserUsername()}, {userOperationResult.Data.Username}",
                    IsGroupChat = false,
                    CreatedAt = DateTime.Now
                };

                var dbConversationResult = await _conversationRepository.CreateConversationAsync(conversation);

                if (dbConversationResult.IsSuccess && dbConversationResult.Data != null)
                {
                    _conversationStore.AddConversation(dbConversationResult.Data);

                    List<ConversationMember> conversationMembers = new List<ConversationMember>()
                    {
                        new ConversationMember
                        {
                            UserId = userOperationResult.Data.Id,
                            ConversationId = dbConversationResult.Data.Id
                        },
                        new ConversationMember
                        {
                            UserId = _userStore.GetCurrentUserId(),
                            ConversationId = dbConversationResult.Data.Id
                        }
                    };

                    var conversationMemberOperationResult = await _conversationMemberRepository.CreateConversationMembersAsync(conversationMembers);

                    if (conversationMemberOperationResult.IsSuccess)
                    {
                        return OperationResult.Success();
                    }
                    else
                    {
                        return OperationResult.Failure(conversationMemberOperationResult.Message);
                    }
                }
                else
                {
                    return OperationResult.Failure(dbConversationResult.Message);
                }
            }
            else
            {
                return OperationResult.Failure(userOperationResult.Message);
            }
        }
    }
}
