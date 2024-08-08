using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Inventory.Models
{
    public class Product
    {
        public int Product_ID { get; set; }
        public String Product_Name { get; set; }
        public int Product_Qty { get; set; }
    }
}