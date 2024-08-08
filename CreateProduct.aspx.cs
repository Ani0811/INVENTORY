using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Inventory.Models;
using System.Web.UI.WebControls;
using System.Threading;

namespace Inventory.Views.Product
{
    public partial class CreateProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { SuccessHiddenField.Value = string.Empty; }
        }
        protected void btn_CreateNew_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    Inventory.Models.Product newProduct = new Inventory.Models.Product
                    {
                        Product_Name = ProductNameTextBox.Text,
                        Product_Qty = int.Parse(ProductQtyTextBox.Text)
                    };

                    ProductDAL productDAL = new ProductDAL();
                    if (productDAL.InsertProduct(newProduct) > 0)
                    {
                        SuccessHiddenField.Value = "true";
                    }
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "An error occurred while saving the product. Please try again.";
                }
            }
        }

        protected void btn_GetShowProduct_Click(object sender, EventArgs e)
        {
            try 
            {
                Server.TransferRequest("../Product/DisplayProduct");
            }
            catch (ThreadAbortException thAex) {; }
        }
    }
}