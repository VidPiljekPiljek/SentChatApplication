using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Conventions;
using Sentry;
using Sentry.Protocol;
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
    public class MessageRepository
    {
        private readonly Supabase.Client _supabaseClient;

        public MessageRepository(Supabase.Client supabaseClient)
        {
            _supabaseClient = supabaseClient;
        }

        public async Task<List<Message>> GetMessagesForConversationAsync(string conversationId)
        {
            SentrySdk.AddBreadcrumb(
                message: "Fetching current user messages.",
                category: "Message fetching",
                level: BreadcrumbLevel.Info
            );
            
            var messageResponse = await _supabaseClient 
                .From<Message>()
                .Select("*, sender:profiles(*)")
                .Filter("conversationid", Constants.Operator.Equals, conversationId)
                .Order("sent_at", Constants.Ordering.Ascending)
                .Get();

            return messageResponse?.Models?.ToList() ?? new List<Message>();
        }

        public async Task<OperationResult<Message>> CreateMessageAsync(Message message)
        {
            SentrySdk.AddBreadcrumb(
                message: "Creating new message in database.",
                category: "Message creation",
                level: BreadcrumbLevel.Info
            );

            var messageResponse = await _supabaseClient.From<Message>().Insert(message);

            if (messageResponse.Models.First() is null) 
                return OperationResult<Message>.Failure("Message creation failed.");

            return OperationResult<Message>.Success(messageResponse.Models.First());
        }

        public async Task<OperationResult> DeleteMessageAsync(string messageId)
        {
            SentrySdk.AddBreadcrumb(
                message: "Deleting message from database.",
                category: "Database message deletion",
                level: BreadcrumbLevel.Info
            );

            await _supabaseClient.From<Message>().Filter("id", Constants.Operator.Equals, messageId).Delete();

            return OperationResult.Success();
        }

        /* Using this method to get the message with the sender reference just like the other get method but this will be used
           mainly for Realtime while listening to Inserts */
        public async Task<OperationResult<Message>> GetMessageWithSenderAsync(string messageId)
        {
            var messageResponse = await _supabaseClient
                .From<Message>()
                .Select("*, sender:profiles(*)")
                .Filter("id", Constants.Operator.Equals, messageId)
                .Get();

            if (messageResponse.Models.First() is null)
            {
                return OperationResult<Message>.Failure("Message not found.");
            }

            return OperationResult<Message>.Success(messageResponse.Model);
        }
    }
}
