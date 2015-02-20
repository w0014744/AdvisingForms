using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CMP494_594.Startup))]
namespace CMP494_594
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
