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
        private readonly PasswordHasher<UserProfile> _passwordHasher = new();

        public UserAuthenticator(UserRepository userRepository, UserStore userStore)
        {
            _userRepository = userRepository;
            _userStore = userStore;
        }

        public async Task<OperationResult> AuthenticateUser(string email, string password)
        {
            var dbUserOperation = await _userRepository.GetUserAsync(email, password);

            if (!dbUserOperation.IsSuccess)
            {
                return OperationResult.Failure(dbUserOperation.Message);
            }

            _userStore.SetCurrentUserProfile(dbUserOperation.Data);

            return OperationResult.Success();
        }
    }
}
