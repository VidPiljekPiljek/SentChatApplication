using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;

namespace Zavrsni.ViewModels
{
    public partial class MessagePopUpViewModel : ViewModelBase
    {
        [ObservableProperty]
        private Message _message;

        public event EventHandler PopUpClosed;

        public MessagePopUpViewModel(Message message)
        {
            _message = message;
        }

        [RelayCommand]
        public void ClosePopUp()
        {
            PopUpClosed?.Invoke(this, EventArgs.Empty);
        }
    }
}
