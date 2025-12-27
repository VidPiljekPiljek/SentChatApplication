using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.ViewModels
{
    public partial class UIDialogViewModel : ViewModelBase
    {
        [ObservableProperty]
        private string _message;

        public UIDialogViewModel()
        {
        }

        public void SetMessage(string message)
        {
            Message = message;
        }
    }
}
