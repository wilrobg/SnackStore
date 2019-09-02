using Microsoft.AspNetCore.Http;
using SnackStore.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SnackStore.Application
{
    public interface IStoreRepository
    {

        IQueryable<Product> GetProductsQuery(HttpRequest request, string sort_by, string name);
        Task<Product> GetProductById(int id);
        Task<IEnumerable<Product>> GetProductByNameAsync(string name);
        IQueryable<Product> GetAllQProductsuery();
        Task<bool> ProductExist(int id);
    }
}
