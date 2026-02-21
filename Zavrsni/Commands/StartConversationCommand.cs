using Sentry;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.ErrorHandling;
using Zavrsni.Models;
using Zavrsni.Services;
using Zavrsni.ViewModels.MessagesPageViewModels;

namespace Zavrsni.Commands
{
    public class StartConversationCommand : AsyncCommandBase
    {
        private readonly ConversationSidebarViewModel _conversationSidebarViewModel;
        private readonly ConversationService _conversationService;
        private readonly UserService _userService;

        public StartConversationCommand(ConversationSidebarViewModel conversationSidebarViewModel, ConversationService conversationService, UserService userService)
        {
            _conversationSidebarViewModel = conversationSidebarViewModel;
            _conversationService = conversationService;
            _userService = userService;
        }

        public async override Task ExecuteAsync(object? parameter)
        {
            SentrySdk.AddBreadcrumb(
                message: "User is creating a new conversation.",
                category: "Conversation initialization",
                level: BreadcrumbLevel.Info
                );

            _conversationSidebarViewModel.ErrorMessage = "";

            var conversationOperationResult = await _conversationService.AddConversationAsync(_conversationSidebarViewModel.ConversationSearchName);

            if (!conversationOperationResult.IsSuccess)
            {
                _conversationSidebarViewModel.ErrorMessage = conversationOperationResult.Message;
            }
        }
    }
}
