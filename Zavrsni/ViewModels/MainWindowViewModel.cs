using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Data;
using Zavrsni.Factories;

namespace Zavrsni.ViewModels
{
    public partial class MainWindowViewModel : ViewModelBase
    {
        private readonly ViewFactory _viewFactory;

        [ObservableProperty]
        private ViewModelBase _currentView;

        public MainWindowViewModel(ViewFactory viewFactory)
        {
            _viewFactory = viewFactory;

            _currentView = new LoginViewModel(this);
        }

        public void NavigateToMain() => CurrentView = _viewFactory.GetViewModel(ApplicationViewNames.Main);
        public void NavigateToRegistration() => CurrentView = _viewFactory.GetViewModel(ApplicationViewNames.Registration);
        public void NavigateToLogin() => CurrentView = _viewFactory.GetViewModel(ApplicationViewNames.Login);
    }
}
