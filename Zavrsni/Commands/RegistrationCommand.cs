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
            try
            {
                User newUser = new User(_viewModel.Username, _viewModel.Password, _viewModel.Email, "picture.jpg", DateTime.Now);
                if (await _userService.Register(newUser))
                {
                    _viewModel.NavigateToMain();
                }
                else
                {
                    _viewModel.ErrorMessage = "User already exists.";
                }
            }
            catch (Exception ex)
            {
                _viewModel.ErrorMessage = $"A fatal error has occured: {ex.Message}";
            }
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
