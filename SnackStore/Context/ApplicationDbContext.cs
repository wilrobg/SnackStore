using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using SnackStore.Entities;
using SnackStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SnackStore.Context
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
            
        }
        public DbSet<Product> Products { get; set; }
        public DbSet<LikesTrack> LikesTrack { get; set; }
        public DbSet<PriceProductLog> PriceProductLog { get; set; }
        public DbSet<PurchaseHistory> PurchaseHistory { get; set; }
    }
}
