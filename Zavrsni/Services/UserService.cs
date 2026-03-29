using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Sentry;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Authenticators;
using Zavrsni.ErrorHandling;
using Zavrsni.Mappers;
using Zavrsni.Models;
using Zavrsni.Repositories;
using Zavrsni.Stores;
using Zavrsni.ViewModels;

namespace Zavrsni.Services
{
    public class UserService
    {
        private readonly UserAuthenticator _userAuthenticator;
        private readonly UserStore _userStore;
        private readonly UserRepository _userRepository;

        public UserService(UserAuthenticator userAuthenticator, UserStore userStore, UserRepository userRepository)
        {
            _userAuthenticator = userAuthenticator;
            _userStore = userStore;
            _userRepository = userRepository;
        }

        public async Task<OperationResult> LoginAsync(string email, string password)
        {
            return await _userAuthenticator.AuthenticateUser(email, password);
        }

        public async Task<OperationResult> RestoreSessionAsync()
        {
            return await _userAuthenticator.RestoreSessionAsync();
        }

        public async Task<OperationResult> RegisterAsync(string email, string password, string username)
        {
            var userCreationOperationResult = await _userRepository.CreateUserAsync(email, password, username);

            if (userCreationOperationResult.IsSuccess)
            {
                SentrySdk.AddBreadcrumb(
                    message: $"User registration succeeded.",
                    category: "User registration successful",
                    level: BreadcrumbLevel.Info
                );

                return OperationResult.Success();
            }
            else
            {
                SentrySdk.AddBreadcrumb(
                    message: $"User registration failed due to: {userCreationOperationResult.Message}",
                    category: "User registration failure",
                    level: BreadcrumbLevel.Info
                );

                return OperationResult.Failure(userCreationOperationResult.Message);
            }
        }

        public async Task<OperationResult> UploadProfilePicture(byte[] profilePictureBytes)
        {
            var userId = GetCurrentUserId();

            return await _userRepository.UploadProfilePictureAsync(userId, profilePictureBytes);
        }

        public async Task<OperationResult<UserProfile?>> GetUserByUsernameAsync(string username)
        {
            return await _userRepository.GetUserByUsernameAsync(username);
        }

        public string GetCurrentUserUsername()
        {
            return _userStore.GetCurrentUserUsername();
        }

        public string GetCurrentUserId()
        {
            return _userStore.GetCurrentUserId();
        }

        public UserProfile GetCurrentUserProfile()
        {
            return _userStore.GetCurrentUserProfile();
        }
    }
}
