using System;
using System.Collections.Generic;
using System.ComponentModel;
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

            _viewModel.PropertyChanged += OnViewModelPropertyChanged;
        }

        public override bool CanExecute(object? parameter)
        {
            return !string.IsNullOrEmpty(_viewModel.Username) && !string.IsNullOrEmpty(_viewModel.Password) && base.CanExecute(parameter);
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
                    _viewModel.ErrorMessage = "You entered something wrong.";
                }
            }
            catch (Exception ex)
            {
                _viewModel.ErrorMessage = $"A fatal error has occured: {ex.Message}";
            }
        }

        private void OnViewModelPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == nameof(_viewModel.Username) || e.PropertyName == nameof(_viewModel.Password))
            {
                OnCanExecuteChanged();
            }
        }
    }
}
