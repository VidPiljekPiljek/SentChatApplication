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

        public async Task<OperationResult> LoginAsync(User wantedUser)
        {
            return await _userAuthenticator.AuthenticateUser(wantedUser);
        }

        public async Task<OperationResult> RegisterAsync(User newUser)
        {
            newUser = _userAuthenticator.HashPassword(newUser);

            var userOperationResult = await _userRepository.GetUserByUsernameAsync(newUser.Username);

            if (userOperationResult.IsSuccess && userOperationResult.Data != null)
            {
                SentrySdk.AddBreadcrumb(
                    message: "User registration failed due to a user of the same name already existing.",
                    category: "User registration failure",
                    level: BreadcrumbLevel.Info
                );

                return OperationResult.Failure("User already exists.");
            }
            else
            {
                var userCreationOperationResult = await _userRepository.CreateUserAsync(newUser);

                if (userCreationOperationResult.IsSuccess)
                {
                    UserViewModel currentUser = UserMapper.ToUserViewModel(userCreationOperationResult.Data);
                    _userStore.CurrentUser = currentUser;

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
        }

        public int GetCurrentUserId()
        {
            return _userStore.GetCurrentUserId();
        }

        public async Task<OperationResult<UserViewModel>> GetUserByUsernameAsync(string username)
        {
            var userOperationResult = await _userRepository.GetUserByUsernameAsync(username);

            if (userOperationResult.IsSuccess && userOperationResult.Data != null)
            {
                UserViewModel dbUserViewModel = UserMapper.ToUserViewModel(userOperationResult.Data);
                return OperationResult<UserViewModel>.Success(dbUserViewModel);
            }
            else
            {
                return OperationResult<UserViewModel>.Failure(userOperationResult.Message);
            }
        }

        public UserViewModel GetCurrentUser()
        {
            return _userStore.GetCurrentUser();
        }

        public string GetCurrentUserUsername()
        {
            return _userStore.GetCurrentUserUsername();
        }
    }
}
