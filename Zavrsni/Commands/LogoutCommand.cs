using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Services;

namespace Zavrsni.Commands
{
    public class LogoutCommand : AsyncCommandBase
    {
        private readonly UserService _userService;

        public override Task ExecuteAsync(object? parameter)
        {
            throw new NotImplementedException();
        }
    }
}
