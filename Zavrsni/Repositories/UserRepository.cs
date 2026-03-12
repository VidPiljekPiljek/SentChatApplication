using Avalonia.Data.Converters;
using Microsoft.EntityFrameworkCore;
using Sentry;
using Supabase.Postgrest;
using Supabase.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.DbContexts;
using Zavrsni.ErrorHandling;
using Zavrsni.Models;

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

            return OperationResult<UserProfile>.Success(response);
        }

        public async Task<OperationResult<UserProfile?>> GetUserByUsernameAsync(string username)
        {
            try
            {
                var response = await _supabaseClient
                    .From<UserProfile>()
                    .Filter("username", Constants.Operator.Equals, username)
                    .Single();

                return OperationResult<UserProfile?>.Success(response);
            }
            catch (Exception ex)
            {
                return OperationResult<UserProfile?>.Failure(ex.Message);
            }
        }

        public async Task<OperationResult> CreateUserAsync(string email, string password, string username)
        {
            SentrySdk.AddBreadcrumb(
                message: "Creating new user in database.",
                category: "Database user creation",
                level: BreadcrumbLevel.Info
            );

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
    }
}
