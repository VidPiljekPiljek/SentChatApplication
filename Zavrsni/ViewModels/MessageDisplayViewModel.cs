using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;

namespace Zavrsni.ViewModels
{
    public partial class MessageDisplayViewModel : ViewModelBase
    {
        [ObservableProperty]
        private Message _message;

        public MessageDisplayViewModel(Message message)
        {
            Message = message;
        }
    }
}
