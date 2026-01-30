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
    [Table("users")]
    public class User : BaseModel
    {
        [PrimaryKey("Id")]
        public int Id { get; set; }
        [Column("Username")]
        public string Username { get; set; }
        [Column("Password")]
        public string Password { get; set; }
        [Column("Email")]
        public string Email { get; set; }
        [Column("ProfilePicture")]
        public string ProfilePicture { get; set; }
        [Column("CreatedAt")]
        public DateTime CreatedAt { get; set; }
        public ICollection<Message> SentMessages { get; set; }
        public ICollection<ConversationMember> Memberships { get; set; }

        // Using different constructors for different scenarios (e.g. registration, login, etc.)

        public User()
        {

        }

        public User(int id, string username, string password, string email, string profilePicture, DateTime createdAt)
        {
            Id = id;
            Username = username;
            Password = password;
            Email = email;
            ProfilePicture = profilePicture;
            CreatedAt = createdAt;
        }

        public User(string username, string password)
        {
            Username = username;
            Password = password;
        }

        public User(string username, string password, string email)
        {
            Username = username;
            Password = password;
            Email = email;
        }

        public User(string username, string password, string email, string profilePicture, DateTime createdAt)
        {
            Username = username;
            Password = password;
            Email = email;
            ProfilePicture = profilePicture;
            CreatedAt = createdAt;
        }
    }
}