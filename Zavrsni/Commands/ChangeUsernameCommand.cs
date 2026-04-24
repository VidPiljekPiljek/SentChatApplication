using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.ViewModels;

namespace Zavrsni.Commands
{
    public class ChangeUsernameCommand : AsyncCommandBase
    {
        private readonly AccountPageViewModel _viewModel;

        public override Task ExecuteAsync(object? parameter)
        {
            throw new NotImplementedException();
        }
    }
}
