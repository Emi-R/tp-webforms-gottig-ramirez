using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Carrito
    {
        public string Usuario { get; set; }
        List<Articulo> ArticuloList { get; set; }
        public float ImporteTotal { get; set; }
    }
}
