﻿using LEL.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

//using MySQL.Data.EntityFrameworkCore.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LEL.DAL
{
    public class LELContext : DbContext
    {
		public LELContext(DbContextOptions<LELContext> options)
		  :base(options)
		{
			
		}

		public LELContext():base() {
			
		}

		public DbSet<LELProject> LELProjects { get; set; }
		public DbSet<Symbol> Symbols { get; set; }		
		public DbSet<Synonym> Synonyms { get; set; }
		public DbSet<Expression> Expressions { get; set; }

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{			
			modelBuilder.Entity<NotionExpression>()
				.HasKey(t => new { t.SymbolId, t.ExpressionId });
			/*
			modelBuilder.Entity<NotionExpression>()
				.HasOne(pt => pt.Symbol)
				.WithMany(p => p.Notions)
				.HasForeignKey(pt => pt.SymbolId);

			modelBuilder.Entity<NotionExpression>()
				.HasOne(pt => pt.Expression)
				.WithMany(t => t.NotionSymbols)
				.HasForeignKey(pt => pt.ExpressionId);
			*/
			modelBuilder.Entity<ActionExpression>()
				.HasKey(t => new { t.SymbolId, t.ExpressionId });
			/*
			modelBuilder.Entity<ActionExpression>()
				.HasOne(pt => pt.Symbol)
				.WithMany(p => p.Actions)
				.HasForeignKey(pt => pt.SymbolId);

			modelBuilder.Entity<ActionExpression>()
				.HasOne(pt => pt.Expression)
				.WithMany(t => t.ActionSymbols)
				.HasForeignKey(pt => pt.ExpressionId);
			*/
			modelBuilder.Entity<ExpressionSymbol>()
				.HasKey(t => new { t.SymbolId, t.ExpressionId });
			/*
			modelBuilder.Entity<ExpressionSymbol>()
				.HasOne(pt => pt.Expression)
				.WithMany(p => p.ContentSymbols)
				.HasForeignKey(pt => pt.ExpressionId);

			modelBuilder.Entity<LELProjectAdmin>()
				.HasOne(pt => pt.LELProject)
				.WithMany(p => p.Admins)
				.HasForeignKey(pt => pt.LELProjectId);

			modelBuilder.Entity<Symbol>()
				.HasOne(pt => pt.Project)
				.WithMany(p => p.Symbols)
				.HasForeignKey(pt => pt.ProjectId);
			*/
			modelBuilder.Entity<LELProjectAdmin>()
				.HasKey(t => new { t.LELProjectId, t.UserId });
		}
	}
}
