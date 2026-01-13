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
            _conversationSidebarViewModel.ErrorMessage = "";
            var userOperationResult = await _userService.GetUserByUsernameAsync(_conversationSidebarViewModel.ConversationSearchName);
            if (!userOperationResult.IsSuccess)
            {
                _conversationSidebarViewModel.ErrorMessage = userOperationResult.Message;
            }
            else
            {
                List<ConversationMember> conversationMembers = new List<ConversationMember>()
                {
                    new ConversationMember
                    {
                        UserId = userOperationResult.Data.Id
                    },
                    new ConversationMember
                    {
                        UserId = _userService.GetCurrentUserId()
                    }
                };
                Conversation newConversation = new Conversation($"{userOperationResult.Data.Username}, {_userService.GetCurrentUserUsername()}", false, DateTime.Now, conversationMembers);

                var conversationOperationResult = await _conversationService.AddConversationAsync(newConversation);
                if (!conversationOperationResult.IsSuccess)
                {
                    _conversationSidebarViewModel.ErrorMessage = conversationOperationResult.Message;
                }
            }
        }
    }
}
