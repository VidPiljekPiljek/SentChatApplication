using Microsoft.AspNetCore.Identity;
using Sentry;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.ErrorHandling;
using Zavrsni.Mappers;
using Zavrsni.Models;
using Zavrsni.Repositories;
using Zavrsni.Stores;

namespace Zavrsni.Authenticators
{
    public class UserAuthenticator
    {
        private readonly UserRepository _userRepository;
        private readonly UserStore _userStore;
        private readonly PasswordHasher<User> _passwordHasher = new();

        public UserAuthenticator(UserRepository userRepository, UserStore userStore)
        {
            _userRepository = userRepository;
            _userStore = userStore;
        }

        public async Task<OperationResult> AuthenticateUser(User wantedUser)
        {
            var dbUserOperation = await _userRepository.GetUserByUsernameAsync(wantedUser.Username);

            if (!dbUserOperation.IsSuccess)
            {
                return OperationResult.Failure(dbUserOperation.Message);
            }

            var isPasswordVerified = VerifyPassword(wantedUser, dbUserOperation.Data);

            if (isPasswordVerified.IsSuccess)
            {
                // Using UserMapper for security purposes
                _userStore.CurrentUser = UserMapper.ToUserViewModel(dbUserOperation.Data);
            }

            return isPasswordVerified;
        }

        public User HashPassword(User user)
        {
            user.Password = _passwordHasher.HashPassword(user, user.Password);

            return user;
        }

        public OperationResult VerifyPassword(User wantedUser, User dbUser)
        {
            if (_passwordHasher.VerifyHashedPassword(dbUser, dbUser.Password, wantedUser.Password) == PasswordVerificationResult.Success)
            {
                return OperationResult.Success();
            }

            return OperationResult.Failure("Wrong password entered.");
        }
    }
}
