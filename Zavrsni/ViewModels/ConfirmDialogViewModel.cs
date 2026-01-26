using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Zavrsni.ViewModels
{
    public partial class ConfirmDialogViewModel : DialogViewModelBase
    {
        public event Action? Confirmed;
        public event Action? Cancelled;

        public ICommand ConfirmCommand { get; }

        public ConfirmDialogViewModel(string message, ICommand confirmCommand) : base(message)
        {
            ConfirmCommand = confirmCommand;
        }

        //[RelayCommand]
        //private void Confirm() => Confirmed?.Invoke();

        //[RelayCommand]
        //private void Cancel() => Cancelled?.Invoke();
    }
}
