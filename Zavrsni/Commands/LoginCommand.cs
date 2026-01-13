using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Common;
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
        private readonly ConversationService _conversationService;
        private readonly MessageService _messageService;

        public LoginCommand(LoginViewModel viewModel, UserService userService, ConversationService conversationService, MessageService messageService)
        {
            _viewModel = viewModel;
            _userService = userService;
            _conversationService = conversationService;
            _messageService = messageService;

            _viewModel.PropertyChanged += OnViewModelPropertyChanged;
        }

        public override bool CanExecute(object? parameter)
        {
            return !string.IsNullOrEmpty(_viewModel.Username) && !string.IsNullOrEmpty(_viewModel.Password) && base.CanExecute(parameter);
        }

        public override async Task ExecuteAsync(object? parameter)
        {
            _viewModel.ErrorMessage = "";
            User wantedUser = new User(_viewModel.Username, _viewModel.Password);
            if (await _userService.LoginAsync(wantedUser))
            {
                if (await _conversationService.LoadUserConversations() && await _messageService.LoadUserMessages())
                {
                    _viewModel.NavigateToMain();
                }
                else
                {
                    _viewModel.ErrorMessage = "Error while fetching Conversations or Messages";
                }
            }
            else
            {
                _viewModel.ErrorMessage = "You entered something wrong.";
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
