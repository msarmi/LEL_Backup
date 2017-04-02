using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LEL.Models
{
    public class LELProject
    {
		public long Id { get; set; }
		public string Name { get; set; }

		//public long UserId { get; set; }
		[ForeignKey("Id")]
		public User Author { get; set; }
		public ICollection<LELProjectAdmin> Admins { get; set; }
		public ICollection<Symbol> Symbols { get; set; }
     }
}
