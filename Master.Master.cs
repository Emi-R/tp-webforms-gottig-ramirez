using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_webforms_gottig_ramirez
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            verificarSessionFavoritos();
            verificarSessionCarrito();

        }

        private void verificarSessionFavoritos()
        {
            if (Session["Favoritos"] != null)
            {
                repeaterFavoritos.DataSource = ((List<Articulo>)Session["Favoritos"]);
                repeaterFavoritos.DataBind();
            }
        }

        private void verificarSessionCarrito()
        {
            if (Session["Carrito"] != null)
            {

                repeaterCarrito.DataSource = ((Carrito)Session["Carrito"]).CarritoDetalleList;
                repeaterCarrito.DataBind();
            }
        }

        protected void btnEliminarFav_Click(object sender, EventArgs e)
        {

        }
    }
}