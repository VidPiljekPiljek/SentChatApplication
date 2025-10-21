using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zavrsni.Models;

namespace Zavrsni.DbContexts
{
    // Currently using local DB with SQLite Entity Framework, planning to move to an actual server with MySQL or MSSQL DB
    public class SentChatAppDbContext : DbContext
    {
        public SentChatAppDbContext(DbContextOptions options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Temporary User for testing
            modelBuilder.Entity<User>().HasData(
                new User(1, "Vid", "Vid123", "vidimage.jpg", new DateTime(2025, 10, 20))
            );

            modelBuilder.Entity<User>()
                .HasMany(e => e.SentMessages)
                .WithOne(e => e.Sender)
                .HasForeignKey(e => e.SenderId)
                .IsRequired();
            modelBuilder.Entity<User>()
                .HasMany(e => e.ReceivedMessages)
                .WithOne(e => e.Receiver)
                .HasForeignKey(e => e.ReceiverId)
                .IsRequired();
            modelBuilder.Entity<User>()
                .HasMany(e => e.Memberships)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.Id)
                .IsRequired();
            modelBuilder.Entity<User>(b =>
            {
                b.HasKey(k => k.Id);
                b.Property(x => x.Id)
                    .IsRequired()
                    .ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<Group>()
                .HasMany(e => e.Messages)
                .WithOne(e => e.Group)
                .HasForeignKey(e => e.GroupId)
                .IsRequired();
            modelBuilder.Entity<Group>()
                .HasMany(e => e.Members)
                .WithOne(e => e.Group)
                .HasForeignKey(e => e.GroupId)
                .IsRequired();
            modelBuilder.Entity<Group>(b =>
            {
                b.HasKey(k => k.Id);
                b.Property(x => x.Id)
                    .IsRequired()
                    .ValueGeneratedOnAdd();
            });
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<Group> Groups { get; set; }
        public DbSet<Member> Members { get; set; }
    }
}
