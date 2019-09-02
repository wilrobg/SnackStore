using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SnackStore.Application
{
    public static class Helper
    {
        public static string GetUri(HttpRequest request)
        {
            return string.Concat(
                        request.Scheme,
                        "://",
                        request.Host.ToUriComponent(),
                        request.PathBase.ToUriComponent(),
                        request.Path.ToUriComponent());
        }

        public static string GetUriNextPage(string uri,int page, int per_page,int total, int last)
        {
            int prev = page - 1;
            if (prev < 1)
            {
                prev = 1;
            }
            return string.Concat("<",uri,"?page=",page++.ToString(),"&per_page=",per_page.ToString(),">; rel=\"next\",",
                                 "<",uri,"?page=",last.ToString(), "&per_page=", per_page.ToString(),">; rel=\"last\",",
                                 "<", uri, "?page=1&per_page=", per_page.ToString(), ">; rel=\"first\",",
                                 "<", uri, "?page="+ prev.ToString() + "&per_page=", per_page.ToString(), ">; rel=\"prev\""
                                 );
        }
    }
}
