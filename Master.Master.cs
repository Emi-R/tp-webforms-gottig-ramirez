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
            verificarSessionCarrito();

        }


        private void verificarSessionCarrito()
        {
            if (Session["Carrito"] != null)
            {

                repeaterCarrito.DataSource = ((Carrito)Session["Carrito"]).CarritoDetalleList;
                repeaterCarrito.DataBind();
            }
        }

    }
}