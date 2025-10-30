using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Repositories;

namespace Zavrsni.Authenticators
{
    public class UserAuthenticator
    {
        private readonly UserRepository _userRepository;
        private readonly PasswordHasher<User> _passwordHasher = new();

        public UserAuthenticator(UserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<bool> AuthenticateUser(User wantedUser)
        {
            var user = await _userRepository.GetUser(wantedUser);

            return user != null;
        }

        public User HashPassword(User user)
        {
            user.Password = _passwordHasher.HashPassword(user, user.Password);

            return user;
        }
    }
}
