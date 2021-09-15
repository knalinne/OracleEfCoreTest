using Domain.Configurations;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace Domain
{
    public class TestContext : DbContext
    {
        private TestContext(DbContextOptions<TestContext> options): base(options)
        {
        }

        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Model.SetMaxIdentifierLength(30);

            modelBuilder
                .ApplyConfiguration(new UserConfiguration());
        }
        
        public class ApplicationContextDesignFactory : IDesignTimeDbContextFactory<TestContext>
        {
            public TestContext CreateDbContext(string[] args)
            {
                var optionsBuilder =
                    new DbContextOptionsBuilder<TestContext>();
                optionsBuilder.UseOracle("", db =>
                {
                    db.MigrationsHistoryTable("__EF_MIGRATION");
                    db.UseOracleSQLCompatibility("11");
                });
                optionsBuilder.EnableSensitiveDataLogging();
                optionsBuilder.EnableDetailedErrors();
                return new TestContext(optionsBuilder.Options);            }
        }
    }
}
