using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SnackStore.Context;
using SnackStore.Entities;
using Microsoft.EntityFrameworkCore;
using AutoMapper;
using SnackStore.DTO;
using Microsoft.AspNetCore.JsonPatch;
using SnackStore.Application;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using SnackStore.Models;

namespace SnackStore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ApplicationDbContext context;
        private readonly IMapper mapper;
        private readonly IStoreRepository storeRepository;

        public ProductsController(ApplicationDbContext context, IMapper mapper,
                                  UserManager<ApplicationUser> userManager,
                                  IStoreRepository storeRepository)
        {
            this.context = context;
            this.mapper = mapper;
            _userManager = userManager;
            this.storeRepository = storeRepository;
        }

        /// <summary>
        /// Get a list of products Avialable(when Avialable true) or Unavialable(when Avialavility false) 
        /// </summary>
        /// <param name="search">search by name</param>
        /// <param name="sort_by">Order by likes or name</param>
        /// <param name="page">Page Number. 1 as default</param>
        /// <param name="per_page">Products per page. 5 as default</param>
        /// <returns>Get a list of matching products</returns>
        [HttpGet]
        [HttpGet("Avialable")]
        [HttpGet("Unavialable")]
        public async Task<ActionResult<PagedResult<ProductDTO>>> GetProducts(string search,string sort_by, int page = 1, int per_page = 5)
        {
            var products = storeRepository.GetProductsQuery(Request, sort_by, search);

            var dataPage = await products.GetPaged(page, per_page);

            //Get ready pagination link
            var uri = Helper.GetUri(Request);
            var uri_pagination = Helper.GetUriNextPage(uri, page, per_page, dataPage.RowCount, dataPage.PageSize);
            Response.Headers.Add("Link", uri_pagination);

            var dataPageProductdto = mapper.Map<PagedResult<ProductDTO>> (dataPage);

            return dataPageProductdto;
        }

        /// <summary>
        /// Get all products storage in DB.
        /// Only can be accessed by admin role.
        /// </summary>
        /// <param name="page">Page Number</param>
        /// <param name="per_page">Quantity of Products per page. 5 as default</param>
        /// <returns>Get all products list</returns>
        [HttpGet("GetAllProducts")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult<PagedResult<ProductDTO>>> Get(int page = 1, int per_page = 5)
        {
            var products = storeRepository.GetAllQProductsuery();
         
            var dataPage = await products.GetPaged(page, per_page);

            //Get ready pagination link
            var uri = Helper.GetUri(Request);
            var uri_pagination = Helper.GetUriNextPage(uri, page, per_page, dataPage.RowCount, dataPage.PageSize);
            Response.Headers.Add("Link", uri_pagination);

            var dataPageProductdto = mapper.Map<PagedResult<ProductDTO>>(dataPage);

            return dataPageProductdto;
        }

        /// <summary>
        /// Get a single product  by ID.
        /// </summary>
        /// <param name="id">product Id</param>
        /// <returns>Single progudct</returns>
        [HttpGet("{id:int}", Name = "GetProduct")]
        public async Task<ActionResult<ProductDTO>> Get(int id)
        {
            var product = await storeRepository.GetProductById(id);

            if (product == null)
            {
                return NotFound();
            }

            var productdto = mapper.Map<ProductDTO>(product);

            return productdto;
        }

        /// <summary>
        /// Insert product
        /// </summary>
        /// <param name="productCreate">Set Name,Stock,Price and availability of Product </param>
        /// <returns>Product created. Header location to product.</returns>
        [HttpPost]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult> CreateProduct([FromBody]ProductReqDTO productCreate)
        {
            var product = mapper.Map<Product>(productCreate);
            context.Add(product);
            var productdto = mapper.Map<ProductDTO>(product);
            await context.SaveChangesAsync();

            return new CreatedAtRouteResult("GetProduct", new { id = product.Id }, productdto);
        }

        /// <summary>
        /// Delete a product
        /// </summary>
        /// <param name="id">Product Id</param>
        /// <returns></returns>
        [HttpDelete("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult<Product>> DeleteProduct(int id)
        {
            if (await storeRepository.ProductExist(id))
            {
                return NotFound();
            }

            context.Products.Remove(new Product { Id = id });
            context.SaveChanges();

            return NoContent();
        }

        /// <summary>
        /// Partial update a product. Save a log of price if price is updated.
        /// </summary>
        /// <param name="id">Produ id</param>
        /// <param name="patchDocument">JsonPatchDocument object. May update Stock,Price and availability</param>
        /// <returns>Updated product</returns>
        [HttpPatch("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult<ProductDTO>> PatchProduct(int id, [FromBody] JsonPatchDocument<ProductReqDTO> patchDocument)
        {
            if (patchDocument == null)
            {
                return BadRequest();
            }

            var product = await storeRepository.GetProductById(id);

            if (product == null)
            {
                return NotFound();
            }

            var productdto = mapper.Map<ProductReqDTO>(product);

            patchDocument.ApplyTo(productdto, ModelState);
            
            if (productdto.Price != product.Price)
            {
                var userid = _userManager.GetUserId(User);
                var priceProductLog = mapper.Map<PriceProductLog>(product);
                priceProductLog.UserId = userid;
                priceProductLog.NewPrice = productdto.Price;
                context.Add(priceProductLog);
            }
            

            mapper.Map(productdto, product);

            var isValid = TryValidateModel(product);

            if (!isValid)
            {
                return BadRequest(ModelState);
            }

            await context.SaveChangesAsync();

            var user_productdto = mapper.Map<ProductDTO>(product);

            return user_productdto;
        }

        /// <summary>
        /// Like a product. Products can be liked once by user
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Product</returns>
        [HttpGet("{id}/LikeProduct")]
        [HttpGet("{id}/Like")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<ProductDTO>> LikeProduct(int id)
        {
            var product = await storeRepository.GetProductById(id);

            if (product == null)
            {
                return NotFound();
            }
            var userid = _userManager.GetUserId(User);
            var LikesTrack = await context.LikesTrack.FirstOrDefaultAsync(x => x.ProductId == id  && x.UserId == userid);

            if (LikesTrack == null)
            {
                product.Likes++;

                var addlike = new LikesTrack { 
                    ProductId = id,
                    UserId = userid,
                    Product = product
                };
                var isValid = TryValidateModel(addlike);

                if (!isValid)
                {
                    return BadRequest(ModelState);
                }
                context.Add(addlike);
                await context.SaveChangesAsync();
            }

            var productdto = mapper.Map<ProductDTO>(product);

            return productdto;
        }

    }
}