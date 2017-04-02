using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LEL.Models
{
	public class Expression
	{
		public long Id { get; set; }
		public string Content { get; set; }
		public virtual ICollection<ExpressionSymbol> ContentSymbols { get; set; }

		public virtual ICollection<NotionExpression> NotionSymbols { get; set; }
		public virtual ICollection<ActionExpression> ActionSymbols { get; set; }
		//public long UserId { get; set; }
		[ForeignKey("Id")]
		public User Author { get; set; }
		
		public Expression()
		{
			NotionSymbols = new HashSet<NotionExpression>();
			ActionSymbols = new HashSet<ActionExpression>();
		}		
	}
}
