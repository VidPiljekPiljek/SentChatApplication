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
    public class Group
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime GroupCreated { get; set; }
        public ICollection<Member> Members { get; set; }
        public ICollection<Message> Messages { get; set; }

        public Group()
        {
            
        }
    }
}
