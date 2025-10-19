using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.DbContexts
{
    public class InMemorySentChatAppDbContextFactory : ISentChatAppDbContextFactory
    {
        private readonly SqliteConnection _connection;

        public InMemorySentChatAppDbContextFactory()
        {
            _connection = new SqliteConnection("DataSource=:memory:");
            _connection.Open();
        }

        public SentChatAppDbContext CreateDbContext()
        {
            DbContextOptions options = new DbContextOptionsBuilder().UseSqlite(_connection).Options;

            return new SentChatAppDbContext(options);
        }
    }
}
