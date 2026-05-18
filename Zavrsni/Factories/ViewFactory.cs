using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Data;
using Zavrsni.ViewModels;

namespace Zavrsni.Factories
{
    public class ViewFactory(Func<ApplicationViewNames, ViewModelBase> factory)
    {
        // Using this way of creating viewmodels because of DI
        public ViewModelBase GetViewModel(ApplicationViewNames viewName) => factory(viewName);
    }
}
