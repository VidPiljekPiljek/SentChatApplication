using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.ErrorHandling
{
    public class OperationResult
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
        public Exception Exception { get; set; }

        protected OperationResult()
        {
            IsSuccess = true;
        }

        protected OperationResult(string message)
        {
            IsSuccess = false;
            Message = message;
        }

        protected OperationResult(Exception exception)
        {
            IsSuccess = false;
            Exception = exception;
        }

        public static OperationResult Success() => new();

        public static OperationResult Failure(string message) => new(message);

        public static OperationResult Failure(Exception exception) => new(exception);
    }

    public class OperationResult<T> : OperationResult {
        public T? Data { get; set; }

        public OperationResult(T? data) : base()
        {
            IsSuccess = true;
            Data = data;
        }

        public static OperationResult<T> Success(T? data) => new(data);
    }
}
