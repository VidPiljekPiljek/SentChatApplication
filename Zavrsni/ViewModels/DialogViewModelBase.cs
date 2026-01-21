using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.ViewModels
{
    public partial class DialogViewModelBase : ViewModelBase
    {
        public event EventHandler? DialogClosed;

        [ObservableProperty]
        private string _message;

        //public DialogViewModelBase(string message) => (Message) = (message);

        public DialogViewModelBase() { }

        public void SetMessage(string message) => Message = message;

        [RelayCommand]
        private void CloseDialog() => DialogClosed?.Invoke(this, EventArgs.Empty);
    }
}
