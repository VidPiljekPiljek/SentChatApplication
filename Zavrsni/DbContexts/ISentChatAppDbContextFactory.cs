using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.DbContexts
{
    public interface ISentChatAppDbContextFactory
    {
        SentChatAppDbContext CreateDbContext();
    }
}
