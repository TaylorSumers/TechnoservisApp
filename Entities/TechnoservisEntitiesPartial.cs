using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechnoservisApp.Entities
{
    public partial class TechnoservisEntities : DbContext
    {
        private static TechnoservisEntities _context;

        public static TechnoservisEntities GetContext()
        {
            if (_context == null)
                _context = new TechnoservisEntities();

            return _context;
        }
    }
}
