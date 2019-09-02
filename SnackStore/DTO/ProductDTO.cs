using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SnackStore.DTO
{
    public class ProductDTO
    {
        public int Id { get; set; }

        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        [Required]
        [Range(0, double.MaxValue)]
        [Column(TypeName = "money")]
        public decimal Price { get; set; } = 0;

        [Required]
        [Range(0, int.MaxValue)]
        public int Stock { get; set; } = 0;

        [Required]
        public int Likes { get; set; } = 0;
    }
}
