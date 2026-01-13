using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Authenticators;
using Zavrsni.Data;
using Zavrsni.Factories;
using Zavrsni.Services;

namespace Zavrsni.ViewModels
{
    public partial class MainWindowViewModel : ViewModelBase
    {
        private readonly ViewFactory _viewFactory;

        [ObservableProperty]
        private UIDialogViewModel _uiDialogViewModel = new UIDialogViewModel();

        [ObservableProperty]
        private bool _isDialogOpen;

        [ObservableProperty]
        private ViewModelBase _currentView;

        public MainWindowViewModel(ViewFactory viewFactory, UserService userService, ConversationService conversationService, MessageService messageService)
        {
            _viewFactory = viewFactory;
            _currentView = new LoginViewModel(this, userService, conversationService, messageService);

            _uiDialogViewModel.DialogClosed += OnDialogClosed;
            //_uiDialogViewModel.PropertyChanged += (s, e) =>
            //{
            //    if (e.PropertyName == nameof(UIDialogViewModel.Message))
            //    {
            //        OpenDialog(); 
            //    }
            //};
        }

        public void NavigateToMain() => CurrentView = _viewFactory.GetViewModel(ApplicationViewNames.Main);
        public void NavigateToRegistration() => CurrentView = _viewFactory.GetViewModel(ApplicationViewNames.Registration);
        public void NavigateToLogin() => CurrentView = _viewFactory.GetViewModel(ApplicationViewNames.Login);

        public void OpenDialog() => IsDialogOpen = true;

        private void OnDialogClosed(object sender, EventArgs e) => IsDialogOpen = false;
    }
}
