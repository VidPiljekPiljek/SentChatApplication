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
            var dbUser = await _userRepository.GetUserByUsername(wantedUser.Username);

            if (dbUser == null)
            {
                return false;
            }

            bool isPasswordVerified = VerifyPassword(wantedUser, dbUser);

            return isPasswordVerified;
        }

        public User HashPassword(User user)
        {
            user.Password = _passwordHasher.HashPassword(user, user.Password);

            return user;
        }

        public bool VerifyPassword(User wantedUser, User dbUser)
        {
            return _passwordHasher.VerifyHashedPassword(dbUser, dbUser.Password, wantedUser.Password) == PasswordVerificationResult.Success;
        }
    }
}
