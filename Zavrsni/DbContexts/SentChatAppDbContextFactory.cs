using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
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
            //var dbPath = Path.Combine(AppContext.BaseDirectory, "sentchatapp.db");
            //var options = new DbContextOptionsBuilder<SentChatAppDbContext>()
            //    .UseSqlite($"Data Source={dbPath}")
            //    .Options;

            //return new SentChatAppDbContext(options);
        }
    }
}
