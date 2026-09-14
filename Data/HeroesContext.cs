using System;
using System.Collections.Generic;
using HeroesWeb.Models;
using Microsoft.EntityFrameworkCore;

namespace HeroesWeb.Data;

public partial class HeroesContext : DbContext
{
    public HeroesContext(DbContextOptions<HeroesContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Heroes> Heroes { get; set; }

    public virtual DbSet<SuperPoderes> SuperPoderes { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Heroes>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Heroes__3214EC070C736DF2");
        });

        modelBuilder.Entity<SuperPoderes>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__SuperPod__3214EC07263B8DE8");

            entity.HasOne(d => d.Heroe).WithMany(p => p.SuperPoderes).HasConstraintName("FK_SuperPoderes_Heroes");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
