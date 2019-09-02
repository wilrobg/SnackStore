using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SnackStore.Entities
{
    public class Product
    {
        public int Id { get; set; }

        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        [Required]
        [Range(0,double.MaxValue)]
        [Column(TypeName = "money")]
        public decimal Price { get; set; } = 0;

        [Required]
        [Range(0, int.MaxValue)]
        public int Stock { get; set; } = 0;

        [Required]
        public bool Availability { get; set; } = true;

        [Required]
        public int Likes { get; set; } = 0;

        public List<LikesTrack> LikesTrack { get; set; }
        public List<PriceProductLog> PriceProductLog { get; set; }


    }
}
