using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SnackStore.DTO
{
    public class ProductReqDTO
    {
        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        [Range(0, double.MaxValue)]
        [Column(TypeName = "money")]
        public decimal Price { get; set; } = 0;

        [Range(0, int.MaxValue)]
        public int Stock { get; set; } = 0;

        public bool Availability { get; set; }
    }
}
