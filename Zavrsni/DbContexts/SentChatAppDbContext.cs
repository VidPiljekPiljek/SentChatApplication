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

            modelBuilder.Entity<User>()
                .HasMany(e => e.SentMessages)
                .WithOne(e => e.Sender)
                .HasForeignKey(e => e.SenderId)
                .IsRequired();
            modelBuilder.Entity<User>()
                .HasMany(e => e.Memberships)
                .WithOne(e => e.User)
                .HasForeignKey(e => e.UserId)
                .IsRequired();
            modelBuilder.Entity<User>(b =>
            {
                b.HasKey(k => k.Id);
                b.Property(x => x.Id)
                    .IsRequired()
                    .ValueGeneratedOnAdd();
            });
            modelBuilder.Entity<User>()
                .HasIndex(u => u.Username)
                .IsUnique();

            modelBuilder.Entity<Conversation>()
                .HasMany(e => e.Messages)
                .WithOne(e => e.Conversation)
                .HasForeignKey(e => e.ConversationId)
                .IsRequired();
            modelBuilder.Entity<Conversation>()
                .HasMany(e => e.Members)
                .WithOne(e => e.Conversation)
                .HasForeignKey(e => e.ConversationId)
                .IsRequired();
            modelBuilder.Entity<Conversation>(b =>
            {
                b.HasKey(k => k.Id);
                b.Property(x => x.Id)
                    .IsRequired()
                    .ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<ConversationMember>()
                .HasIndex(cm => new { cm.UserId, cm.ConversationId })
                 .IsUnique();
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<Conversation> Conversations { get; set; }
        public DbSet<ConversationMember> ConversationMembers { get; set; }
    }
}
