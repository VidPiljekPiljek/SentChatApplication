using Avalonia.Data.Converters;
using Microsoft.EntityFrameworkCore;
using Sentry;
using Supabase.Gotrue;
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

            var userId = session.User.Id!;

            var response = await _supabaseClient
                .From<UserProfile>()
                .Where(p => p.Id == userId)
                .Single();

            return OperationResult<UserProfile>.Success(response);
        }

        public async Task<OperationResult> CreateUserAsync(string email, string password, string username)
        {
            SentrySdk.AddBreadcrumb(
                message: "Creating new user in database.",
                category: "Database user creation",
                level: BreadcrumbLevel.Info
            );

            var userOperation = await _supabaseClient.Auth.SignUp(email, password);

            if (userOperation?.User is null)
            {
                return OperationResult<UserProfile>.Failure("User creation failed.");
            }

            _supabaseClient.From<UserProfile>().Insert(new UserProfile
            {
                Id = userOperation.User.Id,
                Username = username
            });

            return OperationResult.Success();
        }
    }
}
