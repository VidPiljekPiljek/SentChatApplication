using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Services;
using Zavrsni.ViewModels;
using Zavrsni.Views;

namespace Zavrsni.Commands
{
    public class LoginCommand : AsyncCommandBase
    {
        private readonly LoginViewModel _viewModel;
        private readonly UserService _userService;

        public LoginCommand(LoginViewModel viewModel, UserService userService)
        {
            _viewModel = viewModel;
            _userService = userService;
        }

        public override async Task ExecuteAsync(object? parameter)
        {
            try
            {
                User wantedUser = new User(_viewModel.Username, _viewModel.Password);
                if (await _userService.Login(wantedUser))
                {
                    _viewModel.NavigateToMain();
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}
