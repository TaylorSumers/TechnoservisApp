using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechnoservisApp.Entities
{
    public partial class RepairingRequest
    {
        public string IdStr
        {
            get
            {
                if (Id == 0)
                    return "Не присвоен";
                else
                    return Id.ToString();
            }
        }

        public string StartDateStr
        {
            get
            {
                if (StartDate == null)
                    return "Не начата";
                else
                    return StartDate.Value.ToString("dd.MM.yyyy HH:mm");
            }
        }

        public string CompleteDateStr
        {
            get
            {
                if (CompleteDate == null)
                    return "Не выполнена";
                else
                    return CompleteDate.Value.ToString("dd.MM.yyyy HH:mm");
            }
        }
    }

    public enum StatusOfRequest
    {
        InProgress = 1,
        Completed,
        New
    }
}
