using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.ViewModels;

namespace Zavrsni.Mappers
{
    public class UserMapper
    {
        // Using static cause of simplicity
        public static UserViewModel ToUserViewModel(User user)
        {
            UserViewModel mappedUser = new UserViewModel
            {
                Id = user.Id,
                Username = user.Username,
                Email = user.Email,
                ProfilePicture = user.ProfilePicture
            };

            return mappedUser;
        }

        public static User ToUser(UserViewModel userViewModel)
        {
            User user = new User
            {
                Id = userViewModel.Id,
                Username = userViewModel.Username,
                Email = userViewModel.Email,
                ProfilePicture = userViewModel.ProfilePicture
            };
            return user;
        }
    }
}
