using AtulaTask.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;

namespace AtulaTask.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) {
        
        }


        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Product>()
                .HasMany(p => p.Categories)
                .WithMany(c => c.Products);

            // Seeding data for Categories
            modelBuilder.Entity<Category>().HasData(
                new Category { Id = 1, Name = "Table" },
                new Category { Id = 2, Name = "Chair" },
                new Category { Id = 3, Name = "Sofa" }
            );

            // Seeding data for Products
            modelBuilder.Entity<Product>().HasData(
                new Product { Id = 1, Sku = "SKUA", Name = "Lorem Table" },
                new Product { Id = 2, Sku = "SKUB", Name = "Ipsum Table" },
                new Product { Id = 3, Sku = "SKUC", Name = "Dolor Table" },
                new Product { Id = 4, Sku = "SKUD", Name = "Sit Chair" },
                new Product { Id = 5, Sku = "SKUE", Name = "Amet Chair" },
                new Product { Id = 6, Sku = "SKUF", Name = "Consectetur Chair" },
                new Product { Id = 7, Sku = "SKUG", Name = "Adipiscing Sofa" },
                new Product { Id = 8, Sku = "SKUH", Name = "Elit Sofa" },
                new Product { Id = 9, Sku = "SKUI", Name = "Mauris Sofa" }
            );

        }

    }
}
