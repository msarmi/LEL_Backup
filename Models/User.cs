using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LEL.Models
{
    public class User
    {
		public long Id { get; set; }
		public string Name { get; set; }
		public string Lastname { get; set; }
		public string Alias { get; set; }
		public Role Role { get; set; }
    }
}
