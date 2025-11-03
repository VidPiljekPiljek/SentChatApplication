using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;

namespace Zavrsni.Stores
{
    public class UserStore
    {
        private User _currentUser;

        public User? CurrentUser
        {
            get 
            {
                return _currentUser;
            }
            set
            {
                _currentUser = value;
            }
        }

        public UserStore()
        {

        }
    }
}
