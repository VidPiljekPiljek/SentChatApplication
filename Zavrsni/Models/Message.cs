using Microsoft.EntityFrameworkCore;
using Supabase.Postgrest.Attributes;
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
    [Supabase.Postgrest.Attributes.Table("messages")]
    public class Message : BaseModel
    {
        [Supabase.Postgrest.Attributes.PrimaryKey("id")]
        public int Id { get; set; }
        [Supabase.Postgrest.Attributes.Column("text")]
        public string Text { get; set; }
        [Supabase.Postgrest.Attributes.Column("senderid")]
        public int SenderId { get; set; }
        [Supabase.Postgrest.Attributes.Column("conversationid")]
        public int ConversationId { get; set; }
        [Supabase.Postgrest.Attributes.Column("sentat")]
        public DateTime SentAt { get; set; }

        public Message()
        {

        }
    }
}
