using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Messaging;
using Sentry;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Zavrsni.Authenticators;
using Zavrsni.Data;
using Zavrsni.Factories;
using Zavrsni.Messages;
using Zavrsni.Models;
using Zavrsni.Services;

namespace Zavrsni.ViewModels
{
    public partial class MainWindowViewModel : ViewModelBase
    {
        private readonly ViewFactory _viewFactory;
        private readonly SupabaseRealtimeService _supabaseRealtimeService;
        // Using a cancellation token to cancel the delay timer for pop ups, just to clear some space for the CPU
        private CancellationTokenSource? _popUpCancellation;

        [ObservableProperty]
        private bool _isDialogOpen;

        [ObservableProperty]
        private bool _isPopUpOpen;

        [ObservableProperty]
        private ViewModelBase _currentView;

        [ObservableProperty]
        private DialogViewModelBase _dialogViewModel;

        [ObservableProperty]
        private MessagePopUpViewModel _messagePopUpViewModel;

        public MainWindowViewModel(ViewFactory viewFactory, UserService userService, ConversationService conversationService, MessageService messageService, SupabaseRealtimeService supabaseRealtimeService)
        {
            _viewFactory = viewFactory;
            _currentView = new LoginViewModel(this, userService, conversationService, messageService);
            _supabaseRealtimeService = supabaseRealtimeService;

            _supabaseRealtimeService.MessageReceived += (s, message) => CreateMessagePopUp(message);
        }

        public void CreateErrorDialog(string message)
        {
            // Using this instead of a factory because it's a simple dialog
            DialogViewModel = new ErrorDialogViewModel(message);
            DialogViewModel.SetMessage(message);
            DialogViewModel.DialogClosed += OnDialogClosed;
            OpenDialog();
        }

        public async Task CreateMessagePopUp(Message message)
        {
            _popUpCancellation?.Cancel();
            _popUpCancellation = new CancellationTokenSource();

            MessagePopUpViewModel = new MessagePopUpViewModel(message);
            MessagePopUpViewModel.PopUpClosed += OnPopUpClosed;
            OpenPopUp();

            try
            {
                await Task.Delay(4000, _popUpCancellation.Token);

                if (IsPopUpOpen)
                {
                    IsPopUpOpen = false;
                }
            }
            catch (TaskCanceledException)
            {
                // Do nothing
            }
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

        public void OpenPopUp() => IsPopUpOpen = true;

        private void OnDialogClosed(object sender, EventArgs e) => IsDialogOpen = false;

        private void OnPopUpClosed(object sender, EventArgs e)
        {
            _popUpCancellation?.Cancel();
            IsPopUpOpen = false;
        }
    }
}
