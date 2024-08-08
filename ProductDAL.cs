using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Inventory.Models
{
    public class ProductDAL
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        
        public List<Product> GetAllProducts()
        {
            SqlConnection conn = null;
            List <Product> products = new List<Product>();
            DataTable dt = new DataTable();
            try
            {
                conn = new SqlConnection(connectionString);
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM PRODUCT ORDER BY PRODUCT_ID DESC;", conn);
                adapter.Fill(dt);

                foreach (DataRow row in dt.Rows)
                {
                    Product prod = new Product()
                    {
                        Product_ID = Convert.ToInt32(row["PRODUCT_ID"]),
                        Product_Name = row["PRODUCT_NAME"].ToString(),
                        Product_Qty = Convert.ToInt32(row["PRODUCT_QTY"])
                    };
                    products.Add(prod);
                }
            }
            catch (Exception ex) {; }
            finally { conn.Close(); conn = null; }
            return products;
        }
        public int InsertProduct(Product product)
        {
            SqlConnection conn = null;
            int iRowsAffected = 0;
            try
            {
                conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO PRODUCT(PRODUCT_NAME, PRODUCT_QTY) VALUES (@name, @qty)", conn);
                cmd.Parameters.AddWithValue("@name", product.Product_Name);
                cmd.Parameters.AddWithValue("@qty", product.Product_Qty);
                iRowsAffected = cmd.ExecuteNonQuery();
            }
            catch (Exception ex) {; }
            finally { conn.Close(); conn = null; }
            return iRowsAffected;
        }
    }
}