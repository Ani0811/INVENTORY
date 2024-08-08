<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayProduct.aspx.cs" Inherits="Inventory.Views.Product.DisplayProduct" %>
<%@ Register Src="~/Views/Product/NavBar.ascx" TagPrefix="uc" TagName="Navbar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Display Product</title>
    <link href="~/Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="display" runat="server">
         <uc:NavBar ID="Navbar_DisplayProd" runat="server" />
        <div class="container">
            <h2>Display Product</h2>
            <p>
                <asp:LinkButton ID="createNewLink" runat="server" PostBackUrl="~/Product/CreateProduct" CssClass="btn btn-primary">Create New</asp:LinkButton>
            </p>

            <asp:GridView ID="ProductsGDView" runat="server" AutoGenerateColumns="False" CssClass="table" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
                    <asp:BoundField DataField="Product_Qty" HeaderText="Product Quantity" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="EditLink" runat="server" NavigateUrl='<%# Eval("Product_ID", "Edit.aspx?id={0}") %>' CssClass="btn btn-primary">Edit</asp:HyperLink>
                            &nbsp;|&nbsp;
                            <asp:HyperLink ID="DetailsLink" runat="server" NavigateUrl='<%# Eval("Product_ID", "Details.aspx?id={0}") %>' CssClass="btn btn-success">Details</asp:HyperLink>
                            &nbsp;|&nbsp;
                            <asp:HyperLink ID="DeleteLink" runat="server" NavigateUrl='<%# Eval("Product_ID", "Delete.aspx?id={0}") %>' CssClass="btn btn-danger">Delete</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
