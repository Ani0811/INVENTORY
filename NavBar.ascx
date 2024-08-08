<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavBar.ascx.cs" Inherits="Inventory.Views.Product.NavBar" %>

<nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/Inventory/Product/DisplayProduct?action=Index&amp;controller=Home">INVENTORY</a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
            <ul class="navbar-nav flex-grow-1">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="productDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Product</a>
                    <ul class="dropdown-menu" aria-labelledby="productDropdown">
                        <li><a class="dropdown-item" href="~/Product/CreateProduct">Create</a></li>
                        <li><a class="dropdown-item" href="~/Product/DisplayProduct">Display</a></li>
                    </ul>
                </li>
                <li><a class="nav-link" href="/Inventory/Product/DisplayProduct?action=About&amp;controller=Home">Purchase</a></li>
                <li><a class="nav-link" href="/Inventory/Product/DisplayProduct?action=Contact&amp;controller=Home">Sales</a></li>
            </ul>
        </div>
    </div>
</nav>
