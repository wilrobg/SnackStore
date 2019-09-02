using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SnackStore.DTO
{
    public class PurchaseHistoryDTO
    {
        public int Id { get; set; }

        [Required]
        [Range(0, int.MaxValue)]
        public int Quantity { get; set; }

        [Required]
        [Column(TypeName = "money")]
        public decimal PurchaseTotal { get; set; }

        [Column(TypeName = "money")]
        public decimal PurchasePrice { get; set; }

        public DateTime PurchaseDate { get; set; } = DateTime.Now;

        [Required]
        public int ProductId { get; set; }

    }
}
