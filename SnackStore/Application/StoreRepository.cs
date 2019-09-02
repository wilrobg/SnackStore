using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using SnackStore.Context;
using SnackStore.Entities;

namespace SnackStore.Application
{
    public class StoreRepository : IStoreRepository
    {
        IQueryable<Product> products;
        private readonly ApplicationDbContext context;

        public StoreRepository(ApplicationDbContext context)
        {
            this.context = context;
        }

        public IQueryable<Product> GetProductsQuery(HttpRequest request, string sort_by, string name)
        {
            if(String.IsNullOrEmpty(name))
                switch (request.Path.Value.ToUpper())
                {
                    case "/API/PRODUCTS/UNAVIALABLE":
                        products = context.Products.Where(x => x.Availability == false);
                        break;
                    case "/API/PRODUCTS/AVIALABLE":
                    default:
                        products = context.Products.Where(x => x.Availability == true);
                        break;
                }
            else
                switch (request.Path.Value.ToUpper())
                {
                    case "/API/PRODUCTS/UNAVIALABLE":
                        products = context.Products.Where(x => x.Availability == false && x.Name.Contains(name));
                        break;
                    case "/API/PRODUCTS/AVIALABLE":
                    default:
                        products = context.Products.Where(x => x.Availability == true && x.Name.Contains(name));
                        break;
                }

            switch (sort_by)
            {
                case "likes":
                    products = products.OrderByDescending(x => x.Likes).ThenBy(x => x.Name);
                    break;
                case "name":
                default:
                    products = products.OrderBy(x => x.Name);
                    break;
            }
            return products;
        }

        public async Task<Product> GetProductById(int id)
        {
            return await context.Products.FindAsync(id);
        }

        public async Task<IEnumerable<Product>> GetProductByNameAsync(string name)
        {
            return await context.Products.Where(x => x.Name.Contains(name)).ToListAsync();
        }

        public IQueryable<Product> GetAllQProductsuery()
        {
           return context.Products.OrderBy(x => x.Name);
        }

        public async Task<bool> ProductExist(int id)
        {
            var idproduct = await context.Products.Select(x => x.Id).FirstOrDefaultAsync(x => x == id);

            if (idproduct == default(int))
            {
                return true;
            }
            return false;
        }
    }
}
