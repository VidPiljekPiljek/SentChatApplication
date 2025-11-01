using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.Models
{
    public class Message
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Text { get; set; }
        public int SenderId { get; set; }
        public User Sender { get; set; }
        public int ConversationId { get; set; }
        public Conversation Conversation { get; set; }
        public DateTime SentAt { get; set; }

        public Message()
        {

        }
    }
}
