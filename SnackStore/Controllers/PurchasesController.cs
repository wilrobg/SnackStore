using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SnackStore.Context;
using Microsoft.EntityFrameworkCore;
using AutoMapper;
using SnackStore.DTO;
using SnackStore.Application;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using SnackStore.Models;
using System.Linq;
using SnackStore.Entities;

namespace SnackStore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class PurchasesController : ControllerBase
    {

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ApplicationDbContext context;
        private readonly IMapper mapper;
        public PurchasesController(ApplicationDbContext context, IMapper mapper,
                                  UserManager<ApplicationUser> userManager)
        {
            this.context = context;
            this.mapper = mapper;
            _userManager = userManager;
        }

        /// <summary>
        /// Only admin can Get all purchases history
        /// </summary>
        /// <returns>Get all purchases history</returns>
        [HttpGet]
        [HttpGet("All")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<PurchaseHistoryDTO>>> GetHistoryPurchases()
        {
            var PurchaseHistory = await context.PurchaseHistory.ToListAsync();
            var PurchaseHistoryDTO = mapper.Map<List<PurchaseHistoryDTO>>(PurchaseHistory);
            return PurchaseHistoryDTO;
        }

        /// <summary>
        /// Get purchase history by id. Only admin can get
        /// </summary>
        /// <param name="id">purchase history id</param>
        /// <returns>Get single purchase history</returns>
        [HttpGet("{id:int}", Name = "GetPurchasesById")]
        public async Task<ActionResult<PurchaseHistoryDTO>> GetPurchaseHistoryById(int id)
        {
            var PurchaseHistory = await context.PurchaseHistory.FindAsync(id);
            var PurchaseHistoryDTO = mapper.Map<PurchaseHistoryDTO>(PurchaseHistory);
            return PurchaseHistoryDTO;
        }

        /// <summary>
        /// Get all purchases history of a user. Only admin can get list
        /// </summary>
        /// <param name="email">User</param>
        /// <returns>Get all purchases history of matching user</returns>
        [HttpGet("{user}")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult<IEnumerable<PurchaseHistoryDTO>>> GetPurchaseHistoryByEmail(string user)
        {
            var UserHistory = await context.Users.Include(x => x.PurchaseHistory).FirstOrDefaultAsync(x => x.UserName == user);
            if (UserHistory == null)
            {
                return NotFound();
            }
            var PurchaseHistoryDTO = mapper.Map<List<PurchaseHistoryDTO>>(UserHistory.PurchaseHistory);

            return PurchaseHistoryDTO;
        }

        /// <summary>
        /// Get Logged user purchases history
        /// </summary>
        /// <returns>Get Logged user purchases history</returns>
        [HttpGet("MyPurchasesHistory")]
        public async Task<ActionResult<List<PurchaseHistoryDTO>>> GetPurchaseHistoryByUserLogged()
        {
            var userid = _userManager.GetUserId(User);
            var UserHistory = await context.Users.Include(x => x.PurchaseHistory)
                .FirstOrDefaultAsync(x => x.Id == userid);

            var PurchaseHistoryDTO = mapper.Map<List<PurchaseHistoryDTO>>(UserHistory.PurchaseHistory);

            return PurchaseHistoryDTO;
        }

        /// <summary>
        /// Purchases an available product. 
        /// Reduce stock from product.
        /// </summary>
        /// <param name="pruchaseproducdto">Specified Product Id and Quantity</param>
        /// <returns>Get purchase history</returns>
        [HttpPost]
        public async Task<ActionResult> PurchaseProduct([FromBody] PurchaseProductDTO pruchaseproducdto)
        {
            var product = await context.Products.FirstOrDefaultAsync(x => x.Id == pruchaseproducdto.ProductId && x.Availability == true);

            if (product == null)
            {
                return NotFound();
            }

            if (product.Stock < pruchaseproducdto.Quantity)
            {
                return BadRequest("There is enough stock of " + product.Name);
            }

            var userid = _userManager.GetUserId(User);
            decimal PurchaseTotal = pruchaseproducdto.Quantity * product.Price;
            decimal PurchasePrice = product.Price;
            product.Stock = product.Stock - pruchaseproducdto.Quantity;

            var purchaseHistory = mapper.Map<PurchaseHistory>(pruchaseproducdto);
            purchaseHistory.PurchasePrice = PurchasePrice;
            purchaseHistory.PurchaseTotal = PurchaseTotal;
            purchaseHistory.UserId = userid;
            purchaseHistory.ProductId = product.Id;

            var purchaseHistorydto = mapper.Map<PurchaseHistoryDTO>(purchaseHistory);

            context.Add(purchaseHistory);
            await context.SaveChangesAsync();

            return new CreatedAtRouteResult("GetPurchasesById", new { id = purchaseHistory.Id }, purchaseHistorydto);
        }

        
    }
}