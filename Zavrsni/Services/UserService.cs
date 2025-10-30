using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Authenticators;
using Zavrsni.Models;
using Zavrsni.Repositories;

namespace Zavrsni.Services
{
    public class UserService
    {
        private readonly UserAuthenticator _userAuthenticator;
        private readonly UserRepository _userRepository;

        public UserService(UserAuthenticator userAuthenticator, UserRepository userRepository)
        {
            _userAuthenticator = userAuthenticator;
            _userRepository = userRepository;
        }

        public async Task<bool> Login(User wantedUser)
        {
            return await _userAuthenticator.AuthenticateUser(wantedUser);
        }

        public async Task<bool> Register(User newUser)
        {
            newUser = _userAuthenticator.HashPassword(newUser);

            if (await _userRepository.GetUserByUsername(newUser.Username) != null)
            {
                return false;
            }

            return await _userRepository.AddUser(newUser);
        }
    }
}
