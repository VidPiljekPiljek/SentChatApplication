using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zavrsni.ErrorHandling
{
    public class OperationResult
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public Exception Exception { get; set; }

        protected OperationResult()
        {
            Success = true;
        }

        protected OperationResult(string message)
        {
            Success = false;
            Message = message;
        }

        protected OperationResult(Exception exception)
        {
            Success = false;
            Exception = exception;
        }
    }

    public class OperationResult<T> : OperationResult {
        public T? Data { get; set; }

        public OperationResult(T? data) : base()
        {
            Success = true;
            Data = data;
        }

    }
}
