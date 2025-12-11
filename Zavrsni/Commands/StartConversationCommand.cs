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
        private readonly ConversationMemberService _conversationMemberService;

        public StartConversationCommand(ConversationSidebarViewModel conversationSidebarViewModel, ConversationService conversationService, UserService userService, ConversationMemberService conversationMemberService)
        {
            _conversationSidebarViewModel = conversationSidebarViewModel;
            _conversationService = conversationService;
            _userService = userService;
            _conversationMemberService = conversationMemberService;
        }

        public async override Task ExecuteAsync(object? parameter)
        {
            try
            {
                var dbUser = await _userService.GetUserByUsername(_conversationSidebarViewModel.ConversationSearchName);
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

                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}
