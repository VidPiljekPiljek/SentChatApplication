using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Data;
using Zavrsni.Models;

namespace Zavrsni.ViewModels
{
    public partial class GroupsPageViewModel : PageViewModel
    {
        [ObservableProperty]
        private User _selectedUser;

        [ObservableProperty]
        private List<Message> _messages = new List<Message>();


        public GroupsPageViewModel() : base(ApplicationPageNames.Groups)
        {
        }
    }
}
