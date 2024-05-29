using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnoservisApp.Entities;

namespace TechnoservisApp
{
    public static class Statistics
    {
        public static int CountCompletedRequests(List<RepairingRequest> requests)
        {
            return requests.Count(r => r.StatusId == (int)StatusOfRequest.Completed);
        }

        public static int GetAverageExecutionTime(List<RepairingRequest> requests)
        {
            return (int)requests.Where(r => r.StatusId == (int)StatusOfRequest.Completed).Average(r => (DateTime.Now - r.StartDate.Value).TotalHours);
        }
    }
}
