using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.ViewModels
{
    public partial class MainWindowModel : ViewModelBase
    {
        private readonly ViewLocator _viewLocator = new ViewLocator();

        private ViewModelBase _currentViewModel;
    }
}
