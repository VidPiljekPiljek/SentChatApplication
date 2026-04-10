using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;
using Zavrsni.ViewModels;

namespace Zavrsni.Stores
{
    public class UserStore
    {
        private UserProfile _currentUserProfile;

        public UserProfile? CurrentUserProfile
        {
            get 
            {
                return _currentUserProfile;
            }
            set
            {
                _currentUserProfile = value;
            }
        }

        public UserStore()
        {

        }

        public void Clear()
        {
            CurrentUserProfile = null;
        }

        public string GetCurrentUserId()
        {
            return CurrentUserProfile.Id;
        }

        public string GetCurrentUserProfilePictureUrl()
        {
            return CurrentUserProfile.ProfilePictureUrl;
        }

        public UserProfile GetCurrentUserProfile()
        {
            return CurrentUserProfile;
        }

        public string GetCurrentUserUsername()
        {
            return CurrentUserProfile.Username;
        }

        public void SetCurrentUserProfile(UserProfile userProfile)
        {
            CurrentUserProfile = userProfile;
        }
    }
}
