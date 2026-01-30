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
        [Supabase.Postgrest.Attributes.PrimaryKey("Id")]
        public int Id { get; set; }
        [Supabase.Postgrest.Attributes.Column("Text")]
        public string Text { get; set; }
        [Supabase.Postgrest.Attributes.Column("SenderId")]
        public int SenderId { get; set; }
        [Supabase.Postgrest.Attributes.Column("ConversationId")]
        public int ConversationId { get; set; }
        [Supabase.Postgrest.Attributes.Column("SentAt")]
        public DateTime SentAt { get; set; }

        public Message()
        {

        }

        public Message(string text, int senderId, int conversationId, DateTime sentAt)
        {
            Text = text;
            SenderId = senderId;
            ConversationId = conversationId;
            SentAt = sentAt;
        }

        public Message(string text, int senderId, User sender, int conversationId, DateTime sentAt)
        {
            Text = text;
            SenderId = senderId;
            Sender = sender;
            ConversationId = conversationId;
            SentAt = sentAt;
        }

        public Message(int id, string text, int senderId, User sender, int conversationId, DateTime sentAt)
        {
            Id = id;
            Text = text;
            SenderId = senderId;
            Sender = sender;
            ConversationId = conversationId;
            SentAt = sentAt;
        }
    }
}
