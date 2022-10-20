using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace tp_webforms_gottig_ramirez
{
    public partial class Home : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos = new List<Articulo>();
        public ArticuloNegocio negocio = new ArticuloNegocio();


        protected void Page_Load(object sender, EventArgs e)
        {
            listaArticulos = negocio.ListarArticulos();

        }
    }
}