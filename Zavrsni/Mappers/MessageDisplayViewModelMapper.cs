using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.ViewModels;

namespace Zavrsni.Mappers
{
    public static class MessageDisplayViewModelMapper
    {
        public static MessageDisplayViewModel ToDisplayViewModel(Message message)
        {
            return new MessageDisplayViewModel(message);
        }

        public static IEnumerable<MessageDisplayViewModel> ToDisplayViewModels(IEnumerable<Message> messages)
        {
            return messages.Select(m => ToDisplayViewModel(m));
        }
    }
}
