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
    [Supabase.Postgrest.Attributes.Table("conversations")]
    public class Conversation : BaseModel
    {
        [Supabase.Postgrest.Attributes.PrimaryKey("id")]
        public string Id { get; set; }
        [Supabase.Postgrest.Attributes.Column("name")]
        public string Name { get; set; }
        [Supabase.Postgrest.Attributes.Column("isgroupchat")]
        public bool IsGroupChat { get; set; }
        [Supabase.Postgrest.Attributes.Column("createdat")]
        public DateTime CreatedAt { get; set; }

        public Conversation()
        {

        }
    }
}
