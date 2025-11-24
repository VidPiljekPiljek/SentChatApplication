using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.ViewModels;

namespace Zavrsni.Stores
{
    public class UserStore
    {
        private UserViewModel _currentUser;

        public UserViewModel? CurrentUser
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

        public int GetCurrentUserId()
        {
            return CurrentUser.Id;
        }
    }
}
