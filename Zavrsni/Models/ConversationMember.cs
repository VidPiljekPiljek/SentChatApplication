using Supabase.Postgrest.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.Models
{
    [Supabase.Postgrest.Attributes.Table("conversationmembers")]
    public class ConversationMember : BaseModel
    {
        [Supabase.Postgrest.Attributes.PrimaryKey("id")]
        public string Id { get; set; }
        [Supabase.Postgrest.Attributes.Column("userid")]
        public string UserId { get; set; }
        [Supabase.Postgrest.Attributes.Column("conversationid")]
        public string ConversationId { get; set; }

        public ConversationMember()
        {

        }
    }
}
