using CommunityToolkit.Mvvm.ComponentModel;
using Sentry;
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
        private bool _isDialogOpen;

        [ObservableProperty]
        private ViewModelBase _currentView;

        [ObservableProperty]
        private DialogViewModelBase _dialogViewModel;

        public MainWindowViewModel(ViewFactory viewFactory, UserService userService, ConversationService conversationService, MessageService messageService)
        {
            _viewFactory = viewFactory;
            _currentView = new LoginViewModel(this, userService, conversationService, messageService);
        }

        public void CreateErrorDialog(string message)
        {
            // Using this instead of a factory because it's a simple dialog
            DialogViewModel = new ErrorDialogViewModel();
            DialogViewModel.SetMessage(message);
            DialogViewModel.DialogClosed += OnDialogClosed;
            OpenDialog();
        }

        public void CreateConfirmDialog(string message)
        {
            // Using this instead of a factory because it's a simple dialog
            DialogViewModel = new ConfirmDialogViewModel();
            DialogViewModel.SetMessage(message);
            DialogViewModel.DialogClosed += OnDialogClosed;
            OpenDialog();
        }

        public void NavigateToMain() 
        {
            SentrySdk.AddBreadcrumb(
                message: $"Navigating to main view.",
                category: "Navigation",
                level: BreadcrumbLevel.Info
            );

            CurrentView = _viewFactory.GetViewModel(ApplicationViewNames.Main); 
        }
        public void NavigateToRegistration()
        {
            SentrySdk.AddBreadcrumb(
                message: $"Navigating to registration view.",
                category: "Navigation",
                level: BreadcrumbLevel.Info
            );

            CurrentView = _viewFactory.GetViewModel(ApplicationViewNames.Registration);
        }
        public void NavigateToLogin() 
        {
            SentrySdk.AddBreadcrumb(
                message: $"Navigating to login view.",
                category: "Navigation",
                level: BreadcrumbLevel.Info
            );

            CurrentView = _viewFactory.GetViewModel(ApplicationViewNames.Login); 
        }

        public void OpenDialog() => IsDialogOpen = true;

        private void OnDialogClosed(object sender, EventArgs e) => IsDialogOpen = false;
    }
}
