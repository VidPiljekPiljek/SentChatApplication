using Microsoft.EntityFrameworkCore;
using Sentry;
using Supabase.Postgrest;
using Supabase.Postgrest.Exceptions;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.DbContexts;
using Zavrsni.ErrorHandling;
using Zavrsni.Models;

namespace Zavrsni.Repositories
{
    public class ConversationRepository
    {
        private readonly Supabase.Client _supabaseClient;

        public ConversationRepository(Supabase.Client supabaseClient)
        {
            _supabaseClient = supabaseClient;
        }

        public async Task<List<Conversation>> GetUserConversationsAsync(string userId)
        {
            SentrySdk.AddBreadcrumb(
                message: "Fetching current user conversations.",
                category: "Conversation fetching",
                level: BreadcrumbLevel.Info
            );

            var memberResponse = await _supabaseClient
                .From<ConversationMember>()
                .Filter("userid", Constants.Operator.Equals, userId)
                .Get();

            if (memberResponse?.Models == null) return new List<Conversation>();

            var conversationIds = memberResponse.Models
                .Select(member => member.ConversationId)
                .Distinct()
                .ToList();

            var conversationResponse = await _supabaseClient
                .From<Conversation>()
                .Filter("id", Constants.Operator.In, conversationIds)
                .Get();

            return conversationResponse?.Models?.ToList() ?? new List<Conversation>();
        }

        public async Task<OperationResult<Conversation>> CreateConversationAsync(Conversation conversation)
        {
            SentrySdk.AddBreadcrumb(
                message: "Creating new conversation in database.",
                category: "Database conversation creation",
                level: BreadcrumbLevel.Info
            );

            try
            {
                var response = await _supabaseClient
                    .From<Conversation>()
                    .Insert(conversation);

                return OperationResult<Conversation>.Success(response?.Models?.FirstOrDefault());
            }
            catch (PostgrestException ex)
            {
                var code = ex.Response.StatusCode;
                return OperationResult<Conversation>.Failure("Failed to create conversation.");
            }
        }
    }
}
