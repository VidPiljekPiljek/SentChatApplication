using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Repositories;

namespace Zavrsni.Authenticators
{
    public class UserAuthenticator
    {
        private readonly UserRepository _userRepository;

        public UserAuthenticator(UserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<bool> AuthenticateUser(User wantedUser)
        {
            var user = await _userRepository.GetUser(wantedUser);

            return user != null;
        }
    }
}
