using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LEL.Models
{
    public class Synonym
    {
		public Synonym() { }

		public int Id { get; set; }
		public string Name { get; set; }
		public string Description { get; set; }

		//public int SymbolId { get; set; }
		public Symbol Symbol { get; set; }
	}
}
