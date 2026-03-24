using Avalonia.Data.Converters;
using Microsoft.EntityFrameworkCore;
using Sentry;
using Supabase.Gotrue.Exceptions;
using Supabase.Interfaces;
using Supabase.Postgrest;
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

        public async Task<OperationResult<UserProfile>> GetUserAsync(string email, string password)
        {
            SentrySdk.AddBreadcrumb(
                message: "Checking if user already exists.",
                category: "Duplicate checking",
                level: BreadcrumbLevel.Info
            );

            try
            {
                var session = await _supabaseClient.Auth.SignIn(email, password);

                if (session?.User is null)
                {
                    return OperationResult<UserProfile>.Failure("User not found. Please try again.");
                }

                Console.WriteLine($"Auth token: {session.AccessToken}");
                Console.WriteLine($"User ID: {session.User.Id}");

                _supabaseClient.Realtime.SetAuth(session.AccessToken);

                var userId = session.User.Id!;

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

                if (userResponse?.User is null)
                {
                    return OperationResult<UserProfile>.Failure("User creation failed.");
                }

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
            await _supabaseClient.Storage
                .From("profile_pictures")
                .Upload(profilePictureBytes, $"{userId}.png");

            var url = _supabaseClient.Storage.From("profile_pictures").GetPublicUrl($"{userId}.png");

            await _supabaseClient.From<UserProfile>()
                .Where(p => p.Id == userId)
                .Set(p => p.ProfilePictureUrl, url)
                .Update();

            return OperationResult.Success();
        } 

        //public async Task<OperationResult<byte[]>> GetProfilePictureAsync(string userId)
        //{
        //}
    }
}
