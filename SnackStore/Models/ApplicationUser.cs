using Microsoft.AspNetCore.Identity;
using SnackStore.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SnackStore.Models
{
    public class ApplicationUser : IdentityUser
    {
        public List<LikesTrack> LikesTrack { get; set; }
        public List<PurchaseHistory> PurchaseHistory { get; set; }
        public List<PriceProductLog> PriceProductLog { get; set; }
    }
}
