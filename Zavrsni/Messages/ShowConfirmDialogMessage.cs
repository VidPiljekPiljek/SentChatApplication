using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Zavrsni.Commands;

namespace Zavrsni.Messages
{
    public record ShowConfirmDialogMessage(
        string Title,
        string Message,
        ICommand ConfirmCommand
    );
}
