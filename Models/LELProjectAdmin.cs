using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LEL.Models
{
    public class LELProjectAdmin
    {
		public long LELProjectId { get; set; }
		public LELProject LELProject { get; set; }
		
		public long UserId { get; set; }
		public User Admin { get; set; }
    }
}
