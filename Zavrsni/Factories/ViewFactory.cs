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
        //public ViewModelBase GetViewModel<T>(Action<T>? afterCreation = null)
        //    where T : ViewModelBase
        //{
        //    var viewModel = factory(typeof(T));

        //    afterCreation?.Invoke((T)viewModel);

        //    return viewModel;
        //}

        public ViewModelBase GetViewModel(ApplicationViewNames viewName) => factory(viewName);
    }
}
