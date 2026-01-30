using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.Models
{
    [Supabase.Postgrest.Attributes.Table("ConversationMembers")]
    public class ConversationMember
    {
        [Supabase.Postgrest.Attributes.PrimaryKey("Id")]
        public int Id { get; set; }
        [Supabase.Postgrest.Attributes.Column("UserId")]
        public int UserId { get; set; }
        [Supabase.Postgrest.Attributes.Column("ConversationId")]
        public int ConversationId { get; set; }

        public ConversationMember()
        {

        }
    }
}
