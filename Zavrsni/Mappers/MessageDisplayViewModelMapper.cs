using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.Services;
using Zavrsni.ViewModels;

namespace Zavrsni.Mappers
{
    public static class MessageDisplayViewModelMapper
    {
        public static MessageDisplayViewModel ToDisplayViewModel(MessageService messageService, Message message)
        {
            return new MessageDisplayViewModel(messageService, message);
        }

        public static IEnumerable<MessageDisplayViewModel> ToDisplayViewModels(MessageService messageService, IEnumerable<Message> messages)
        {
            return messages.Select(message => ToDisplayViewModel(messageService, message));
        }
    }
}
