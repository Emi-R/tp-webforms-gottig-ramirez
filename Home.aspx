<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="tp_webforms_gottig_ramirez.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-2">
        <div class="row pt-4 pb-4 ">
            <div class="col-4 text-center">
                <input class="form-control me-2" style="width:100%" type="search" placeholder="Buscar por nombre" aria-label="Search">
            </div>
            <div class="col-8">
                <asp:Button cssclass="btn btn-info" ID="btnBuscarNom" OnClick="btnBuscarNom_Click" runat="server" Text="Buscar" />
            </div>
        </div>
        <div class="row">
            <div class="col-11">
                <div class="row row-cols-1 row-cols-md-2 g-4 justify-content-center">

                    <asp:Repeater runat="server" ID="repeaterArticulos">
                        <ItemTemplate>
                            <div class="col">
                                <div class="card m-auto p-2" style="max-width: 750px;">
                                    <div class="row g-0">
                                        <div class="col-md-3">
                                            <img src="<%#Eval("ImagenUrl")%>" class="img-fluid rounded-start mt-4" alt="...">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col">
                                                        <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col">

                                                        <p class="card-text"><small class="text-muted">Cod: <%#Eval("Codigo") %></small></p>
                                                        <p class="card-text"><%#Eval("Descripcion")%></p>
                                                        <p class="card-text mt-2">$ <%#Eval("Precio") %></p>
                                                    </div>
                                                    <div class="col-md-3 m-auto">
                                                        <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" CommandArgument='<%#Eval("Id") %>' CommandName="IdArticulo" class="btn btn-outline-success" runat="server" Text="Agregar" />
                                                        <asp:Button ID="btnFavorito" class="btn btn-outline-danger mt-3" OnClick="btnFavorito_Click" CommandArgument='<%#Eval("Id") %>' CommandName="IdArticulo" runat="server" Text="Favorito" />
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
            <div class="col-1">
                <div class="row m-1">
                </div>
            </div>
        </div>
    </div>

    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasCarrito" aria-labelledby="offcanvasCarritoLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasExampleLabel">Su Carrito</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Cerrar"></button>
        </div>
        <div class="offcanvas-body">

            <asp:Repeater runat="server" ID="repeaterCarrito">
                <ItemTemplate>
                    <li class="dropdown-item ">
                        <div class="col m-4" style="width: 85%;">
                            <div class="card m-auto p-2" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-3">
                                        <img src="<%#Eval("UrlImagen")%>" class="img-fluid rounded-start mt-4" alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body" style="word-break: break-all; white-space: normal;">
                                            <div class="row">
                                                <div class="col">
                                                    <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">

                                                    <p class="card-text"><small class="text-muted">Cod: <%#Eval("Codigo") %></small></p>
                                                    <p class="card-text mt-2">$ <%#Eval("PrecioUnitario") %></p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <p class="card-text mt-2">$ <%#Eval("PrecioTotal") %></p>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>

    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasFavoritos" aria-labelledby="offcanvasFavoritosLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasFavoritosLabel">Favoritos</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Cerrar"></button>
        </div>
        <div class="offcanvas-body">
            <asp:Repeater runat="server" ID="repeaterFavoritos">
                <ItemTemplate>
                    <li class="dropdown-item ">
                        <div class="col m-4" style="width: 85%;">
                            <div class="card m-auto p-2" style="max-width: 540px;">
                                <div class="row g-0">
                                    <div class="col-md-3">
                                        <img src="<%#Eval("ImagenUrl")%>" class="img-fluid rounded-start mt-4" alt="...">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body" style="word-break: break-all; white-space: normal;">
                                            <div class="row">
                                                <div class="col">
                                                    <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                                    <p class="card-text"><small class="text-muted">Cod: <%#Eval("Codigo") %></small></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col">
                                                    <p class="card-text mt-2">$ <%#Eval("Precio") %></p>
                                                </div>
                                                <%--                                                <div class="col-md-4 m-auto">
                                                    <asp:Button ID="btnEliminarFav" CssClass="btn-close" OnClick="btnEliminarFav_Click" runat="server" Text="Eliminar" />
                                                </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>


        </div>
    </div>



</asp:Content>
