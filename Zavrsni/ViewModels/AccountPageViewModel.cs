using Avalonia.Controls;
using Avalonia.Platform.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Zavrsni.Commands;
using Zavrsni.Data;
using Zavrsni.Models;
using Zavrsni.Services;

namespace Zavrsni.ViewModels
{
    public partial class AccountPageViewModel : PageViewModel
    {
        private readonly UserService _userService;

        public AccountPageViewModel(MainWindowViewModel mainWindowViewModel, UserService userService) : base(ApplicationPageNames.Account)
        {
            _userService = userService;
            _userProfile = _userService.GetCurrentUserProfile();
            LogoutCommand = new LogoutCommand(this, mainWindowViewModel, userService);
        }

        public ICommand LogoutCommand { get; }

        [ObservableProperty]
        private UserProfile _userProfile;

        [ObservableProperty]
        private string _errorMessage;

        public async Task SelectProfilePictureAsync(TopLevel topLevel)
        {
            var files = await topLevel.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions
            {
                Title = "Select a profile picture",
                AllowMultiple = false,
                FileTypeFilter = new []
                {
                    new FilePickerFileType("PNG Image") { Patterns = new[] { "*.png" } },
                }
            });

            if (files.Count > 0)
            {
                var path = files[0].Path.LocalPath;
                var bytes = await File.ReadAllBytesAsync(path);

                var uploadResponse = await _userService.UploadProfilePicture(bytes);

                if (uploadResponse.IsSuccess)
                {
                    ErrorMessage = "Profile picture uploaded successfully!";
                }
                else
                {
                    ErrorMessage = uploadResponse.Message;
                }
            }
        }
    }
}
