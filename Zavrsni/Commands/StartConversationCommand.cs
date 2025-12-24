using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
            try
            {
                var dbUser = await _userService.GetUserByUsernameAsync(_conversationSidebarViewModel.ConversationSearchName);
                if (dbUser is null)
                {
                }
                else
                {
                    List<ConversationMember> conversationMembers = new List<ConversationMember>()
                    {
                        new ConversationMember
                        {
                            UserId = dbUser.Id
                        },
                        new ConversationMember
                        {
                            UserId = _userService.GetCurrentUserId()
                        }
                    };
                    Conversation newConversation = new Conversation($"{dbUser.Username}, {_userService.GetCurrentUserUsername()}", false, DateTime.Now, conversationMembers);

                    var success = await _conversationService.AddConversationAsync(newConversation);
                    if (success)
                    {

                    }
                    else
                    {
                        _conversationSidebarViewModel.ConversationSearchName = "Something went wrong.";
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}
