using Avalonia.Controls;
using Avalonia.Controls.Chrome;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.ViewModels
{
    public partial class ErrorDialogViewModel : DialogViewModelBase
    {
        public ErrorDialogViewModel(string message) : base( message)
        {
        }
    }
}
