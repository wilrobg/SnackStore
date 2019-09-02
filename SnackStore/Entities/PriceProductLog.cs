using SnackStore.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SnackStore.Entities
{
    public class PriceProductLog
    {
        public int Id { get; set; }

        public int ProductId { get; set; }
        public Product Product { get; set; }

        [Required]
        [Range(0, double.MaxValue)]
        [Column(TypeName = "money")]
        public decimal NewPrice { get; set; }

        [Required]
        [Range(0, double.MaxValue)]
        [Column(TypeName = "money")]
        public decimal OldPrice { get; set; }

        public DateTime UpdateDate { get; set; } = DateTime.Now;

        public string UserId { get; set; }
        public ApplicationUser User { get; set; }
    }
}
