using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.ErrorHandling;
using Zavrsni.Models;

namespace Zavrsni.Repositories
{
    public class ConversationMemberRepository
    {
        private readonly Supabase.Client _supabaseClient;

        public ConversationMemberRepository(Supabase.Client supabaseClient)
        {
            _supabaseClient = supabaseClient;
        }

        public async Task<OperationResult<List<ConversationMember>>> CreateConversationMembersAsync(List<ConversationMember> conversationMembers)
        {
            var response = await _supabaseClient
                .From<ConversationMember>()
                .Insert(conversationMembers);

            if (response.Models.Any() is false)
            {
                return OperationResult<List<ConversationMember>>.Failure("Failed to create conversation members.");
            }

            return OperationResult<List<ConversationMember>>.Success(response?.Models?.ToList());
        }

        public async Task<OperationResult<ConversationMember>> CreateConversationMemberAsync(ConversationMember conversationMember)
        {
            var response = await _supabaseClient
                .From<ConversationMember>()
                .Insert(conversationMember);

            if (response.Models.First() is null)
            {
                return OperationResult<ConversationMember>.Failure("Failed to create conversation member.");
            }

            return OperationResult<ConversationMember>.Success(response?.Models?.FirstOrDefault());
        }
    }
}
