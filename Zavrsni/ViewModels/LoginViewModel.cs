using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.ViewModels
{
    public partial class LoginViewModel : ViewModelBase
    {
        private MainWindowViewModel _mainWindowViewModel;

        public LoginViewModel(MainWindowViewModel mainWindowViewModel)
        {
            _mainWindowViewModel = mainWindowViewModel;
        }

        [ObservableProperty]
        private string _username;

        [ObservableProperty]
        private string _password;

        [RelayCommand]
        private void Login() 
        {
            _mainWindowViewModel.NavigateToMain();
        }
    }
}
