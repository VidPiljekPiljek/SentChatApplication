using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Zavrsni.Commands;
using Zavrsni.Services;

namespace Zavrsni.ViewModels
{
    public partial class RegistrationViewModel : ViewModelBase
    {
        private MainWindowViewModel _mainWindowViewModel;

        public RegistrationViewModel(MainWindowViewModel mainWindowViewModel, UserService userService)
        {
            _mainWindowViewModel = mainWindowViewModel;
            RegistrationCommand = new RegistrationCommand(this, userService);
        }

        public ICommand RegistrationCommand { get; }

        [ObservableProperty]
        private string _username;

        [ObservableProperty]
        private string _email;

        [ObservableProperty]
        private string _password;

        //[RelayCommand]
        //private void Registrate()
        //{
        //    _mainWindowViewModel.NavigateToMain();
        //}

        [RelayCommand]
        private void NavigateToLogin()
        {
            _mainWindowViewModel.NavigateToLogin();
        }

        public void NavigateToMain() {
            _mainWindowViewModel.NavigateToMain();
        }
    }
}
