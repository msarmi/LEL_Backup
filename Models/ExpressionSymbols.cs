﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LEL.Models
{
    public class ExpressionSymbol
    {
		public long SymbolId { get; set; }
		public Symbol Symbol { get; set; }

		public long ExpressionId { get; set; }
		public Expression Expression { get; set; }
    }
}
