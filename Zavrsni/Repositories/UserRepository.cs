using Avalonia.Data.Converters;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.DbContexts;
using Zavrsni.Models;

namespace Zavrsni.Repositories
{
    public class UserRepository
    {
        private readonly ISentChatAppDbContextFactory _dbContextFactory;

        public UserRepository(ISentChatAppDbContextFactory dbContextFactory)
        {
            _dbContextFactory = dbContextFactory;
        }

        public async Task<User?> GetUserAsync(User wantedUser)
        {
            using (SentChatAppDbContext dbContext = _dbContextFactory.CreateDbContext())
            {
                return await dbContext.Users.FirstOrDefaultAsync(u => u.Username == wantedUser.Username && u.Password == wantedUser.Password);
            }
        }

        public async Task<User?> GetUserByUsernameAsync(string username)
        {
            using (SentChatAppDbContext dbContext = _dbContextFactory.CreateDbContext())
            {
                return await dbContext.Users.FirstOrDefaultAsync(u => u.Username == username);
            }
        }

        public async Task<bool> CreateUserAsync(User newUser)
        {
            using (SentChatAppDbContext dbContext = _dbContextFactory.CreateDbContext())
            {
                try
                {
                    await dbContext.Users.AddAsync(newUser);
                    await dbContext.SaveChangesAsync();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }
    }
}
