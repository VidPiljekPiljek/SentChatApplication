using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.DbContexts
{
    public class DesignTimeSentChatAppDbContextFactory : IDesignTimeDbContextFactory<SentChatAppDbContext>
    {
        public SentChatAppDbContext CreateDbContext(string[] args)
        {
            DbContextOptions options = new DbContextOptionsBuilder().UseSqlite("Data source=sentchatapp.db").Options;

            return new SentChatAppDbContext(options);
        }
    }
}
