using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.ViewModels
{
    public partial class RegistrationViewModel : ViewModelBase
    {
        private MainWindowViewModel _mainWindowViewModel;

        public RegistrationViewModel(MainWindowViewModel mainWindowViewModel)
        {
            _mainWindowViewModel = mainWindowViewModel;
        }

        [ObservableProperty]
        private string _username;

        [ObservableProperty]
        private string _email;

        [ObservableProperty]
        private string _password;

        [RelayCommand]
        private void Registrate()
        {
            _mainWindowViewModel.NavigateToMain();
        }

        [RelayCommand]
        private void NavigateToLogin()
        {
            _mainWindowViewModel.NavigateToLogin();
        }
    }
}
