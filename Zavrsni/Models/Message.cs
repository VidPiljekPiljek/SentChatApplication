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
        public string Id { get; set; }
        [Supabase.Postgrest.Attributes.Column("text")]
        public string Text { get; set; }
        [Supabase.Postgrest.Attributes.Column("senderid")]
        public string SenderId { get; set; }
        [Supabase.Postgrest.Attributes.Column("conversationid")]
        public string ConversationId { get; set; }
        [Supabase.Postgrest.Attributes.Column("sentat")]
        public DateTime SentAt { get; set; }

        public Message()
        {

        }
    }
}
