using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LEL.Models
{
    public class Symbol
    {
		public long Id { get; set; }
		public string Name { get; set; }
				
		[ForeignKey("Id")]
		public User Author { get; set; }

		public Category Category { get; set; }

		//public long ProjectId { get; set; }
		public LELProject LELProject { get; set; }

		public virtual ICollection<Synonym> Synonyms { get; set; }
		public virtual ICollection<NotionExpression> Notions { get; set; } 
		public virtual ICollection<ActionExpression> Actions { get; set; }
				
		public Symbol() {
			Synonyms = new HashSet<Synonym>();
			Notions = new HashSet<NotionExpression>();
			Actions = new HashSet<ActionExpression>();
		}

		public Symbol merge(Symbol anotherSymbol)
		{
			return null;
		}
	}
}
