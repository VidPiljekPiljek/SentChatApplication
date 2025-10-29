using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.Models
{
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string ProfilePicture { get; set; }
        public DateTime AccountCreated { get; set; }
        public ICollection<Message> SentMessages { get; set; }
        public ICollection<Message> ReceivedMessages { get; set; }
        public ICollection<Member> Memberships { get; set; }

        public User()
        {
            
        }

        public User(int id, string username, string password, string email, string profilePicture, DateTime accountCreated)
        {
            Id = id;
            Username = username;
            Password = password;
            Email = email;
            ProfilePicture = profilePicture;
            AccountCreated = accountCreated;
        }

        public User(string username, string password)
        {
            Username = username;
            Password = password;
        }

        public User(string username, string password, string email, string profilePicture, DateTime accountCreated)
        {
            Username = username;
            Password = password;
            Email = email;
            ProfilePicture = profilePicture;
            AccountCreated = accountCreated;
        }
    }
}
