<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateProduct.aspx.cs" ValidateRequest="false" Inherits="Inventory.Views.Product.CreateProduct" %>
<%@ Register Src="~/Views/Product/NavBar.ascx" TagPrefix="uc" TagName="NavBar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Product</title>
    <link href="~/Content/bootstrap.css" rel="stylesheet" />
    <link href="~/Content/Site.css" rel="stylesheet"/>
    <script src="~/Scripts/jquery-3.6.0.js"></script>
    <script src="~/Scripts/jquery.validate.js"></script>
    <script type="text/javascript">
        function showSuccessMessage(message) {
            alert(message);
        }

        window.onload = function () {
            var successMessage = document.getElementById('<%= SuccessHiddenField.ClientID %>').value;
            if (successMessage === "true") {
                showSuccessMessage("Product successfully added!");
            }
        }
    </script>
</head>
<body>
     <uc:NavBar ID="Navbar_CreateProd" runat="server" />
    <form id="CreateProd" runat="server">
        <div class="container">
            <h2>Create Product</h2>
            <hr />
            <div class="form-horizontal">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />

                <div class="form-group">
                    <label class="control-label col-md-2" for="ProductNameTextBox">Product Name</label>
                    <div class="col-md-10">
                        <asp:TextBox ID="ProductNameTextBox" runat="server" CssClass="form-control" MaxLength="30" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ProductNameTextBox" ErrorMessage="Product Name is required" CssClass="text-danger" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-2" for="ProductQtyTextBox">Product Quantity</label>
                    <div class="col-md-10">
                        <asp:TextBox ID="ProductQtyTextBox" runat="server" CssClass="form-control" MaxLength="5" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ProductQtyTextBox" ErrorMessage="Product Quantity is required" CssClass="text-danger" />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ProductQtyTextBox" MinimumValue="1" MaximumValue="1000" Type="Integer" ErrorMessage="Quantity must be between 1 and 1000" CssClass="text-danger" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button ID="btn_CreateNew" runat="server" Text="Add New Product" CssClass="btn btn-primary" OnClick="btn_CreateNew_Click"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_GetShowProduct" runat="server" Text="View Product List" CssClass="btn btn-primary" OnClick="btn_GetShowProduct_Click"/>
                    </div>
                    <div>
                        <asp:HiddenField ID="SuccessHiddenField" runat="server" />
                    </div>
                </div>
            </div>
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" />
        </div>
    </form>
</body>
</html>
