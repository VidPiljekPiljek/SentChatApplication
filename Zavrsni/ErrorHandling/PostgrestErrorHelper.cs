using Supabase.Postgrest.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace Zavrsni.ErrorHandling
{
    public static class PostgrestErrorHelper
    {
        private class ErrorResponse
        {
            public string? code { get; set; }
            public string? message { get; set; }
        }

        public static string? GetCode(PostgrestException ex)
        {
            try
            {
                var error = JsonSerializer.Deserialize<ErrorResponse>(ex.Message);
                return error?.code;
            }
            catch
            {
                return null;
            }
        }
    }
}
