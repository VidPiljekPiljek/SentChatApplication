using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.DbContexts
{
    public class DesignTimeSentChatAppDbContextFactory : IDesignTimeDbContextFactory<SentChatAppDbContext>
    {
        public SentChatAppDbContext CreateDbContext(string[] args)
        {
            // Creating local database for testing
            //var dbPath = Path.Combine(AppContext.BaseDirectory, "sentchatapp.db");
            //var optionsBuilder = new DbContextOptionsBuilder<SentChatAppDbContext>();
            //optionsBuilder.UseSqlite($"Data Source={dbPath}");
            //return new SentChatAppDbContext(optionsBuilder.Options);
            DbContextOptions options = new DbContextOptionsBuilder().UseSqlite("Data source=sentchatapp.db").Options;

            return new SentChatAppDbContext(options);
        }
    }
}
