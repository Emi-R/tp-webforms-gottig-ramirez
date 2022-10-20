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
        public Carrito carrito;
        public ArticuloNegocio negocio = new ArticuloNegocio();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //funciones al cargar la pagina, para listar articulos y cargar la session
                listarArticulos();
                crearSessionCarrito();
            }

        }
        private void listarArticulos()
        {

            listaArticulos = negocio.ListarArticulos();
            repeaterArticulos.DataSource = listaArticulos;
            repeaterArticulos.DataBind();

        }
        private void crearSessionCarrito()
        {
            if (Session["Carrito"] == null)
            {
                carrito = new Carrito();
                Session.Add("Carrito", carrito);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            //si el carrito está nulo, lo agregi a la Session
            if (Session["Carrito"] == null)
            {
                carrito = new Carrito();
                Session.Add("Carrito", carrito);
            }

            //busco id del Articulo seleccionado
            int idArticuloSeleccionado = Convert.ToInt32(((Button)sender).CommandArgument);

            List<CarritoDetalle> detalleCarritoList = ((Carrito)Session["Carrito"]).CarritoDetalleList;

            //si la session del carrito no está vacia, busco el Articulo y sumo cantidad, si no lo agrego a la lista de la Session
            if (detalleCarritoList != null && detalleCarritoList.Any(x => x.IdArticulo == idArticuloSeleccionado)) detalleCarritoList.Find(x => x.IdArticulo == idArticuloSeleccionado).Cantidad++;
            else
            {
                listaArticulos = negocio.ListarArticulos();
                Articulo articuloSeleccionado = listaArticulos.Find(x => x.Id == idArticuloSeleccionado);
                CarritoDetalle nuevoDetalle = new CarritoDetalle()
                {
                    IdArticulo = articuloSeleccionado.Id,
                    Nombre = articuloSeleccionado.Nombre,
                    Codigo = articuloSeleccionado.Codigo,
                    Descripcion = articuloSeleccionado.Descripcion,
                    Cantidad = 1,
                    PrecioUnitario = articuloSeleccionado.Precio,
                    PrecioTotal = articuloSeleccionado.Precio
                };
                detalleCarritoList.Add(nuevoDetalle);
            }
        }
    }
}