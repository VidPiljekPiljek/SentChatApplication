using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Authenticators;
using Zavrsni.Models;

namespace Zavrsni.Services
{
    public class UserService
    {
        private readonly UserAuthenticator _userAuthenticator;

        public UserService(UserAuthenticator userAuthenticator)
        {
            _userAuthenticator = userAuthenticator;
        }

        public async Task<bool> Login(User wantedUser)
        {
            return await _userAuthenticator.AuthenticateUser(wantedUser);
        }
    }
}
