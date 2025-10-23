using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.Commands
{
    public class AsyncCommandBase : CommandBase
    {
        private bool _isExecuting;
        public bool IsExecuting
        {
            get { return _isExecuting; }
            set 
            { 
                _isExecuting = value;
                OnCanExecuteChanged();
            }
        }

        public override bool CanExecute(object? parameter)
        {
            return !IsExecuting && base.CanExecute(parameter);
        }

        public override void Execute(object? parameter)
        {
            throw new NotImplementedException();
        }
    }
}
