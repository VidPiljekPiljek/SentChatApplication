using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.ErrorHandling;
using Zavrsni.Models;
using Zavrsni.Repositories;

namespace Zavrsni.Services
{
    public class ConversationMemberService
    {
        private readonly ConversationMemberRepository _conversationMemberRepository;

        public ConversationMemberService(ConversationMemberRepository conversationMemberRepository)
        {
            _conversationMemberRepository = conversationMemberRepository;
        }

        public async Task<OperationResult> AddConversationMembersAsync(List<ConversationMember> conversationMembers)
        {
            return await _conversationMemberRepository.CreateConversationMembersAsync(conversationMembers);
        }
    }
}
