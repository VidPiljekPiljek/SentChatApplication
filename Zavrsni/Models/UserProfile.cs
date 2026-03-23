using Microsoft.EntityFrameworkCore;
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
    [Supabase.Postgrest.Attributes.Table("profiles")]
    public class UserProfile : BaseModel
    {
        [Supabase.Postgrest.Attributes.PrimaryKey("id")]
        public string Id { get; set; }
        [Supabase.Postgrest.Attributes.Column("username")]
        public string Username { get; set; }
        [Supabase.Postgrest.Attributes.Column("profile_picture_url")]
        public string ProfilePictureUrl { get; set; }
        [Supabase.Postgrest.Attributes.Column("created_at")]
        public DateTime CreatedAt { get; set; }

        // Using different constructors for different scenarios (e.g. registration, login, etc.)

        public UserProfile()
        {

        }
    }
}