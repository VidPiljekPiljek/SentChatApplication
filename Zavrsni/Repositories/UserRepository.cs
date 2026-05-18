using Avalonia.Data.Converters;
using Microsoft.EntityFrameworkCore;
using Sentry;
using Supabase.Gotrue.Exceptions;
using Supabase.Interfaces;
using Supabase.Postgrest;
using Supabase.Postgrest.Exceptions;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.DbContexts;
using Zavrsni.ErrorHandling;
using Zavrsni.Models;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Zavrsni.Repositories
{
    public class UserRepository
    {
        private readonly Supabase.Client _supabaseClient;

        public UserRepository(Supabase.Client supabaseClient)
        {
            _supabaseClient = supabaseClient;
        }

        public async Task<OperationResult<string>> SignInAsync(string email, string password)
        {
            try
            {
                var session = await _supabaseClient.Auth.SignIn(email, password);
                if (session?.User is null)
                    return OperationResult<string>.Failure("User not found. Please try again.");

                _supabaseClient.Realtime.SetAuth(session.AccessToken);
                return OperationResult<string>.Success(session.User.Id);
            }
            catch (GotrueException ex) when (ex.StatusCode < 500)
            {
                return ex.StatusCode switch
                {
                    400 => OperationResult<string>.Failure("You entered something wrong, please try again."),
                    _ => OperationResult<string>.Failure("User login failed. Please try again.")
                };
            }
        }

        public async Task<OperationResult> SignOutAsync()
        {
            await _supabaseClient.Auth.SignOut();
            return OperationResult.Success();
        }

        public async Task<OperationResult<UserProfile>> GetUserProfileAsync(string userId)
        {
            SentrySdk.AddBreadcrumb(
                message: "Checking if user already exists.",
                category: "Duplicate checking",
                level: BreadcrumbLevel.Info
            );

            try
            {
                var response = await _supabaseClient
                    .From<UserProfile>()
                    .Where(p => p.Id == userId)
                    .Single();

                if (response is null)
                {
                    return OperationResult<UserProfile>.Failure("User profile not found.");
                }

                return OperationResult<UserProfile>.Success(response);
            }
            catch (GotrueException ex) when (ex.StatusCode < 500)
            {
                return ex.StatusCode switch
                {
                    400 => OperationResult<UserProfile>.Failure("You entered something wrong, please try again."),
                    _ => OperationResult<UserProfile>.Failure("User login failed. Please try again.")
                };
            }
        }

        public async Task<OperationResult<UserProfile>> GetUserByUsernameAsync(string username)
        {
            var response = await _supabaseClient
                .From<UserProfile>()
                .Filter("username", Constants.Operator.Equals, username)
                .Single();

            if (response is null)
            {
                return OperationResult<UserProfile>.Failure("User not found. Please try again.");
            }

            return OperationResult<UserProfile>.Success(response);
        }

        public async Task<OperationResult> CreateUserAsync(string email, string password, string username)
        {
            SentrySdk.AddBreadcrumb(
                message: "Creating new user in database.",
                category: "Database user creation",
                level: BreadcrumbLevel.Info
            );

            try
            {
                var userResponse = await _supabaseClient.Auth.SignUp(email, password);

                await _supabaseClient.Auth.SetSession(
                    userResponse.AccessToken,
                    userResponse.RefreshToken
                );

                System.Diagnostics.Debug.WriteLine($"{_supabaseClient.Auth.CurrentSession?.AccessToken} : {userResponse.RefreshToken}");

                if (userResponse?.User is null)
                {
                    return OperationResult<UserProfile>.Failure("User creation failed.");
                }

                System.Diagnostics.Debug.WriteLine($"{userResponse.User.Id} : {username}");

                await _supabaseClient.From<UserProfile>().Insert(new UserProfile
                {
                    Id = userResponse.User.Id,
                    Username = username
                });

                return OperationResult.Success();
            }
            catch (GotrueException ex) when (ex.StatusCode < 500) {
                return ex.StatusCode switch {
                    409 => OperationResult.Failure("User already exists. Please login or create a different account."),
                    _ => OperationResult.Failure("User creation failed. Please try again.")
                };
            }
        }

        public async Task<OperationResult> UploadProfilePictureAsync(string userId, byte[] profilePictureBytes)
        {
            var fileOptions = new Supabase.Storage.FileOptions
            {
                Upsert = true
            };

            await _supabaseClient.Storage
                .From("profile_pictures")
                .Upload(profilePictureBytes, $"{userId}.png", fileOptions);

            var url = _supabaseClient.Storage.From("profile_pictures").GetPublicUrl($"{userId}.png");

            url = $"{url}?t={DateTimeOffset.UtcNow.ToUnixTimeSeconds()}";

            await _supabaseClient.From<UserProfile>()
                .Where(p => p.Id == userId)
                .Set(p => p.ProfilePictureUrl, url)
                .Update();

            return OperationResult.Success();
        }

        public async Task<OperationResult> UpdateUsernameAsync(string userId, string username)
        {
            await _supabaseClient.From<UserProfile>()
                .Where(p => p.Id == userId)
                .Set(p => p.Username, username)
                .Update();

            return OperationResult.Success();
        }
    }
}
