using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace LEL.Models
{
    public class Comment
    {
		public long Id { get; set; }
		public string Content { get; set; }
		//public long UserId { get; set; }
		[ForeignKey("Id")]
		public User Author { get; set; }
		public ICollection<Comment> Replies { get; set; }

		public Comment() {
			Replies = new HashSet<Comment>();
		}
	}
}
