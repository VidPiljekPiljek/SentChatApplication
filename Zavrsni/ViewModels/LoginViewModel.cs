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
    public partial class LoginViewModel : ViewModelBase
    {
        private MainWindowViewModel _mainWindowViewModel;

        public LoginViewModel(MainWindowViewModel mainWindowViewModel, UserService userService)
        {
            _mainWindowViewModel = mainWindowViewModel;
            LoginCommand = new LoginCommand(this, userService);
        }

        public ICommand LoginCommand { get; }

        [ObservableProperty]
        private string _username;

        [ObservableProperty]
        private string _password;

        [ObservableProperty]
        private string _errorMessage = "";

        //[RelayCommand]
        //private void Login() 
        //{
        //    _mainWindowViewModel.NavigateToMain();
        //}

        [RelayCommand]
        private void NavigateToRegistration()
        {
            _mainWindowViewModel.NavigateToRegistration();
        }

        public void NavigateToMain()
        {
            _mainWindowViewModel.NavigateToMain();
        }
    }
}
