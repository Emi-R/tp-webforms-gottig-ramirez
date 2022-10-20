﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Carrito
    {
        public string Usuario { get; set; }
        public List<CarritoDetalle> CarritoDetalleList { get; set; }
        public DateTime FechaCompra { get; set; }
        public float ImporteTotal { get; set; }
    }
}
