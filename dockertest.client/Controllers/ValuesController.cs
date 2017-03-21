namespace dockertest_client.Controllers
{
    using System;
    using System.Net.Http;
    using System.Threading.Tasks;

    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Routing;
    using Microsoft.Extensions.Options;

    using Newtonsoft.Json;

    [Route("/api/[controller]")]
    public class ValuesController : Controller
    {
        private readonly IOptions<Configuration> config;

        public ValuesController(IOptions<Configuration> config)
        {
            this.config = config;
        }

        [HttpGet]
        public async Task<string> Get()
        {
            using (var client = new HttpClient())
            {
                try
                {
                    client.BaseAddress = new Uri(this.config.Value.ApiBase);
                    return await client.GetStringAsync("/api/values");
                }
                catch (Exception e)
                {
                    return e.ToString();
                }
            }
        }
    }
}