using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Data;
using Zavrsni.ViewModels;

namespace Zavrsni.Factories
{
    public class PageFactory(Func<ApplicationPageNames, PageViewModel> factory)
    {
        // Using this way of creating page viewmodels because of DI
        public PageViewModel GetPageViewModel(ApplicationPageNames pageName) => factory(pageName);
    }
}
