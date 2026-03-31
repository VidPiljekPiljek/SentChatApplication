using Sentry;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Services;
using Zavrsni.ViewModels;

namespace Zavrsni.Commands
{
    public class LogoutCommand : AsyncCommandBase
    {
        private readonly AccountPageViewModel _accountPageViewModel;
        private readonly MainWindowViewModel _viewModel;
        private readonly UserService _userService;

        public LogoutCommand(AccountPageViewModel accountPageViewModel, MainWindowViewModel viewModel, UserService userService)
        {
            _accountPageViewModel = accountPageViewModel;
            _viewModel = viewModel;
            _userService = userService;
        }

        public override bool CanExecute(object? parameter)
        {
            return true;
        }

        public override async Task ExecuteAsync(object? parameter)
        {
            SentrySdk.AddBreadcrumb(
                message: "User started logout.",
                category: "Login",
                level: BreadcrumbLevel.Info
                );

            var logoutResponse = await _userService.LogoutAsync();

            if (!logoutResponse.IsSuccess)
            {

            }
            else
            {
                _viewModel.NavigateToLogin();
            }
        }
    }
}
