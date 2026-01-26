using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Data;
using Zavrsni.ViewModels;

namespace Zavrsni.Commands
{
    internal class CreateConfirmDialogCommand : CommandBase
    {
        private readonly ViewModelBase _viewModel;
        private ConfirmDialogTypes _confirmDialogType;

        public CreateConfirmDialogCommand(ViewModelBase viewModel, ConfirmDialogTypes confirmDialogType)
        {
            _viewModel = viewModel;
            _confirmDialogType = confirmDialogType;
        }

        public override void Execute(object? parameter)
        {
            throw new NotImplementedException();
        }
    }
}
