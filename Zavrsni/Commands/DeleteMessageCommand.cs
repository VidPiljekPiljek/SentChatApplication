using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Services;
using Zavrsni.ViewModels;

namespace Zavrsni.Commands
{
    public class DeleteMessageCommand : AsyncCommandBase
    {
        private readonly MessageDisplayViewModel _messageDisplayViewModel;
        private readonly MessageService _messageService;
        private readonly UserService _userService;

        public DeleteMessageCommand(MessageDisplayViewModel messageDisplayViewModel, MessageService messageService, UserService userService)
        {
            _messageDisplayViewModel = messageDisplayViewModel;
            _messageService = messageService;
            _userService = userService;
        }

        public override bool CanExecute(object? parameter)
        {
            return _messageDisplayViewModel.Message.SenderId == _userService.GetCurrentUserId() && base.CanExecute(parameter);
        }

        public override async Task ExecuteAsync(object? parameter)
        {
            try
            {
                if (await _messageService.DeleteMessageAsync(_messageDisplayViewModel.Message.Id))
                {
                    _messageDisplayViewModel.MessageDeleted.Invoke(_messageDisplayViewModel, _messageDisplayViewModel);
                }
                else
                {
                    _messageDisplayViewModel.ErrorMessage = "Message was unable to be deleted.";
                }
            }
            catch (Exception ex)
            {
                _messageDisplayViewModel.ErrorMessage = $"A fatal error has occured: {ex.Message}";
            }
        }
    }
}
