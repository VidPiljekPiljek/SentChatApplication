using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Services;
using Zavrsni.ViewModels;

namespace Zavrsni.Commands
{
    public class RegistrationCommand : AsyncCommandBase
    {
        private readonly RegistrationViewModel _viewModel;
        private readonly UserService _userService;

        public RegistrationCommand(RegistrationViewModel viewModel, UserService userService)
        {
            _viewModel = viewModel;
            _userService = userService;
        }

        public override async Task ExecuteAsync(object? parameter)
        {
            try
            {
                User newUser = new User(_viewModel.Username, _viewModel.Password, _viewModel.Email, "picture.jpg", DateTime.Now);
                if (await _userService.Register(newUser))
                {
                    _viewModel.NavigateToMain();
                }
                else
                {

                }
            }
            catch
            {
                Console.WriteLine("Unable to create user.");
            }
        }
    }
}
