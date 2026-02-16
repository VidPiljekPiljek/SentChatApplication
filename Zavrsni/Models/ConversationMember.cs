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
    public class ConversationMember
    {
        [Supabase.Postgrest.Attributes.PrimaryKey("id")]
        public int Id { get; set; }
        [Supabase.Postgrest.Attributes.Column("userid")]
        public int UserId { get; set; }
        [Supabase.Postgrest.Attributes.Column("conversationid")]
        public int ConversationId { get; set; }

        public ConversationMember()
        {

        }
    }
}
