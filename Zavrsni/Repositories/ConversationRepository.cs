using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.DbContexts;
using Zavrsni.Models;

namespace Zavrsni.Repositories
{
    public class ConversationRepository
    {
        private readonly ISentChatAppDbContextFactory _dbContextFactory;

        public ConversationRepository(ISentChatAppDbContextFactory dbContextFactory)
        {
            _dbContextFactory = dbContextFactory;
        }

        public async Task<List<Conversation>> GetUserConversations(int userId)
        {
            using (SentChatAppDbContext dbContext = _dbContextFactory.CreateDbContext())
            {
                return await dbContext.Conversations.Where(c => c.Members.Any(m => m.UserId == userId)).ToListAsync();
            }
        }

        public async Task<Conversation> CreateConversationAsync(Conversation conversation)
        {
            using (SentChatAppDbContext dbContext = _dbContextFactory.CreateDbContext())
            {
                try
                {
                    var existingConversation = await dbContext.Conversations.Where(c => !c.IsGroupChat)
                        .Include(c => c.Members)
                        .FirstOrDefaultAsync(c => c.Members.Any(m => m.UserId == conversation.Members.First().UserId) && c.Members.Any(m => m.UserId == conversation.Members.Last().UserId) && c.Members.Count == 2);

                    if (existingConversation == null)
                    {
                        await dbContext.Conversations.AddAsync(conversation);
                        await dbContext.SaveChangesAsync();
                        return conversation;
                    }
                    else
                    {
                        return null;

                    }
                }
                catch
                {
                    return null;
                }
            }
        }
    }
}
