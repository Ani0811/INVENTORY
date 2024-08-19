using Inventory.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Inventory.Controllers
{
    public class ProductController : Controller
    {
        private ProductDAL prod_DAL = new ProductDAL();
        // GET: Product
        public ActionResult Index()
        {
            List<Product> products = prod_DAL.GetAllProducts();   
            return View(products);
        }
        [HttpGet]
        public ActionResult DisplayProduct() 
        {
            return Redirect("~/Product/DisplayProduct");
        }
        [HttpGet]
        public ActionResult CreateProduct()
        {
            return Redirect("~/Product/CreateProduct");
        }
        [HttpPost]
        public ActionResult CreateProduct(ProductViewModel prod)
        {
            if (ModelState.IsValid)
            {
                var product = new Product
                {
                    Product_Name = prod.Product_Name,
                    Product_Qty = prod.Product_Qty
                };
                if (prod_DAL.InsertProduct(product) > 0) {; }
            }
            return Redirect("~/Product/DisplayProduct");
        }
    }
}