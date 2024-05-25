using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechnoservisApp.Entities
{
    public partial class User
    {
        public string FullName
        {
            get
            {
                return string.Join(" ", Surname, Name, Patronymic);
            }
        }
    }
}
