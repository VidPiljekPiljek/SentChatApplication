using Microsoft.EntityFrameworkCore;
using Sentry;
using Supabase.Postgrest;
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
            //using (SentChatAppDbContext dbContext = _dbContextFactory.CreateDbContext())
            //{
            //    SentrySdk.AddBreadcrumb(
            //        message: "Creating new conversation in database.",
            //        category: "Database conversation creation",
            //        level: BreadcrumbLevel.Info
            //    );

            //    var existingConversation = await dbContext.Conversations.Where(c => !c.IsGroupChat)
            //        .Include(c => c.Members)
            //        .FirstOrDefaultAsync(c => c.Members.Any(m => m.UserId == conversation.Members.First().UserId) && c.Members.Any(m => m.UserId == conversation.Members.Last().UserId) && c.Members.Count == 2);

            //    if (existingConversation == null)
            //    {
            //        await dbContext.Conversations.AddAsync(conversation);
            //        await dbContext.SaveChangesAsync();
            //        return OperationResult<Conversation>.Success(conversation);
            //    }
            //    else
            //    {
            //        return OperationResult<Conversation>.Failure("Conversation already exists.");
            //    }
            //}

            return OperationResult<Conversation>.Success(conversation);
        }
    }
}
