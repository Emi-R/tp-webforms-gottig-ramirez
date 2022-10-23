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
                crearSessionFavoritos();
                lblImporteTotal.Text = "Total: $ " + ((Carrito)Session["Carrito"]).ImporteTotal.ToString();
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

        private void crearSessionFavoritos()
        {
            if (Session["Favoritos"] == null)
            {
                List<Articulo> articulosFavoritosList = new List<Articulo>();
                Session.Add("Favoritos", articulosFavoritosList);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            //si el carrito está nulo, lo agregi a la Session
            crearSessionCarrito();

            //busco id del Articulo seleccionado
            int idArticuloSeleccionado = Convert.ToInt32(((Button)sender).CommandArgument);

            List<CarritoDetalle> detalleCarritoList = ((Carrito)Session["Carrito"]).CarritoDetalleList;

            //si la session del carrito no está vacia, busco el Articulo y sumo cantidad, si no lo agrego a la lista de la Session
            if (detalleCarritoList != null && detalleCarritoList.Any(x => x.IdArticulo == idArticuloSeleccionado))
            {

                CarritoDetalle aux = new CarritoDetalle();
                aux = detalleCarritoList.Find(x => x.IdArticulo == idArticuloSeleccionado);

                detalleCarritoList.Find(x => x.IdArticulo == idArticuloSeleccionado).Cantidad++;
                aux.PrecioTotal += aux.PrecioUnitario;

            }

            else
            {
                listaArticulos = negocio.ListarArticulos();
                Articulo articuloSeleccionado = listaArticulos.Find(x => x.Id == idArticuloSeleccionado);

                CarritoDetalle nuevoDetalle = new CarritoDetalle()
                {
                    IdArticulo = articuloSeleccionado.Id,
                    Nombre = articuloSeleccionado.Nombre,
                    UrlImagen = articuloSeleccionado.ImagenUrl,
                    Codigo = articuloSeleccionado.Codigo,
                    Descripcion = articuloSeleccionado.Descripcion,
                    Cantidad = 1,
                    PrecioUnitario = articuloSeleccionado.Precio,
                    PrecioTotal = articuloSeleccionado.Precio
                };

                ((Carrito)Session["Carrito"]).ImporteTotal += nuevoDetalle.PrecioUnitario;
                detalleCarritoList.Add(nuevoDetalle);
            }



            repeaterCarrito.DataSource = ((Carrito)Session["Carrito"]).CarritoDetalleList;
            repeaterCarrito.DataBind();

            lblImporteTotal.Text = "Total: $ " + ((Carrito)Session["Carrito"]).ImporteTotal.ToString();
        }

        protected void btnFavorito_Click(object sender, EventArgs e)
        {
            crearSessionFavoritos();

            int idArticuloSeleccionado = Convert.ToInt32(((Button)sender).CommandArgument);
            Articulo articuloSeleccionado = negocio.ListarArticulos().Find(x => x.Id == idArticuloSeleccionado);

            List<Articulo> articulosFavoritosList = ((List<Articulo>)Session["Favoritos"]);

            if (!articulosFavoritosList.Any(x => x.Id == idArticuloSeleccionado))
            {
                articulosFavoritosList.Add(articuloSeleccionado);
            }

            repeaterFavoritos.DataSource = ((List<Articulo>)Session["Favoritos"]);
            repeaterFavoritos.DataBind();

        }

        protected void btnBuscarNom_Click(object sender, EventArgs e)
        {

            string filtroNombre = txtBuscarNom.Text;
            filtroNombre = filtroNombre.ToLower();

            List<Articulo> listaFiltrada = new List<Articulo>();

            listaFiltrada = negocio.ListarArticulos().Where(x => x.Nombre.ToLower().Contains(filtroNombre)).ToList();

            repeaterArticulos.DataSource = null;

            repeaterArticulos.DataSource = listaFiltrada;
            repeaterArticulos.DataBind();
        }
    }
}