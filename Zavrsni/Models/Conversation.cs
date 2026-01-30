using Supabase.Postgrest.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Views;

namespace Zavrsni.Models
{
    [Supabase.Postgrest.Attributes.Table("messages")]
    public class Conversation : BaseModel
    {
        [Supabase.Postgrest.Attributes.PrimaryKey("Id")]
        public int Id { get; set; }
        [Supabase.Postgrest.Attributes.Column("Name")]
        public string Name { get; set; }
        [Supabase.Postgrest.Attributes.Column("IsGroupChat")]
        public bool IsGroupChat { get; set; }
        [Supabase.Postgrest.Attributes.Column("CreatedAt")]
        public DateTime CreatedAt { get; set; }

        public Conversation()
        {

        }

        //public Conversation(string name, bool isGroupChat, DateTime createdAt, ICollection<ConversationMember> members)
        //{
        //    Name = name;
        //    IsGroupChat = isGroupChat;
        //    CreatedAt = createdAt;
        //    Members = members;
        //}
    }
}
