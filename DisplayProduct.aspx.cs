using Inventory.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Inventory.Views.Product
{
    public partial class DisplayProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { BindGrid(); }
        }

        private void BindGrid() 
        {
            List<ProductViewModel> products = GetProducts();
            ProductsGDView.DataSource = products;
            ProductsGDView.DataBind();
        }

        private List<ProductViewModel> GetProducts()
        {
            ProductDAL productDAL = new ProductDAL();
            List<Inventory.Models.Product> products = productDAL.GetAllProducts();
            List<ProductViewModel> productViewModels = new List<ProductViewModel>();

            foreach (Inventory.Models.Product product in products)
            {
                ProductViewModel productViewModel = new ProductViewModel()
                {
                    Product_ID = product.Product_ID,
                    Product_Name = product.Product_Name,
                    Product_Qty = product.Product_Qty
                };
                productViewModels.Add(productViewModel);
            }

            return productViewModels;
        }
    }
}