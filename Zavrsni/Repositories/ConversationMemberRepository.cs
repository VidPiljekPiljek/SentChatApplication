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
            try
            {
                var response = await _supabaseClient
                    .From<ConversationMember>()
                    .Insert(conversationMembers);

                return OperationResult<List<ConversationMember>>.Success(response?.Models?.ToList());
            }
            catch (Exception ex)
            {
                return OperationResult<List<ConversationMember>>.Failure("Failed to create conversation members.");
            }
        }

        public async Task<OperationResult<ConversationMember>> CreateConversationMemberAsync(ConversationMember conversationMember)
        {
            try
            {
                var response = await _supabaseClient
                    .From<ConversationMember>()
                    .Insert(conversationMember);

                return OperationResult<ConversationMember>.Success(response?.Models?.FirstOrDefault());
            }
            catch (Exception ex)
            {
                return OperationResult<ConversationMember>.Failure("Failed to create conversation member.");
            }
        }
    }
}
