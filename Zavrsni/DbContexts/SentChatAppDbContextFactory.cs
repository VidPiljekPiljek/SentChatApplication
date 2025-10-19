using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.DbContexts
{
    public class SentChatAppDbContextFactory : ISentChatAppDbContextFactory
    {
        private readonly string _connectionString;

        public SentChatAppDbContextFactory(string connectionString)
        {
            _connectionString = connectionString;
        }

        public SentChatAppDbContext CreateDbContext()
        {
            DbContextOptions options = new DbContextOptionsBuilder().UseSqlite(_connectionString).Options;

            return new SentChatAppDbContext(options);
        }
    }
}
