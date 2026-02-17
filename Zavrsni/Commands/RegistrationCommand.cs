using Sentry;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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

            _viewModel.PropertyChanged += OnViewModelPropertyChanged;
        }

        public override bool CanExecute(object? parameter)
        {
            return !string.IsNullOrEmpty(_viewModel.Username) && !string.IsNullOrEmpty(_viewModel.Email) && !string.IsNullOrEmpty(_viewModel.Password) && base.CanExecute(parameter);
        }

        public override async Task ExecuteAsync(object? parameter)
        {
            SentrySdk.AddBreadcrumb(
                message: "User started registration.",
                category: "Registration",
                level: BreadcrumbLevel.Info
            );

            var userOperationResult = await _userService.RegisterAsync(_viewModel.Email, _viewModel.Password, _viewModel.Username);

            if (userOperationResult.IsSuccess)
            {
                _viewModel.ErrorMessage = "User successfully registered. You can now login!";
            }
            else
            {
                _viewModel.ErrorMessage = userOperationResult.Message;
            }

            //throw new Exception("Breadcrumb test");
        }

        private void OnViewModelPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == nameof(_viewModel.Username) || e.PropertyName == nameof(_viewModel.Email) || e.PropertyName == nameof(_viewModel.Password))
            {
                OnCanExecuteChanged();
            }
        }
    }
}
