using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Conventions;
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
        private readonly ISentChatAppDbContextFactory _dbContextFactory;

        public MessageRepository(ISentChatAppDbContextFactory dbContextFactory)
        {
            _dbContextFactory = dbContextFactory;
        }

        public async Task<List<Message>> GetUserMessagesAsync(ObservableCollection<Conversation> userConversations)
        {
            using (SentChatAppDbContext dbContext = _dbContextFactory.CreateDbContext())
            {
                var conversationIds = userConversations.Select(c => c.Id).ToList();

                var messages = await dbContext.Messages
                    .Where(m => conversationIds.Contains(m.ConversationId))
                    .Include(m => m.Sender)
                    .OrderBy(m => m.SentAt)
                    .ToListAsync();

                return messages;
            }
        }

        public async Task<OperationResult<Message>> CreateMessageAsync(Message message)
        {
            using (SentChatAppDbContext dbContext = _dbContextFactory.CreateDbContext())
            {
                await dbContext.Messages.AddAsync(message);
                await dbContext.SaveChangesAsync();
                return OperationResult<Message>.Success(message);
            }
        }

        public async Task<OperationResult> DeleteMessageAsync(int messageId)
        {
            using (SentChatAppDbContext dbContext = _dbContextFactory.CreateDbContext())
            {
                var dbMessage = await dbContext.Messages.FirstOrDefaultAsync(m => m.Id == messageId);
                dbContext.Messages.Remove(dbMessage);
                await dbContext.SaveChangesAsync();

                return OperationResult.Success();
            }
        }
    }
}
