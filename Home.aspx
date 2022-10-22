<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="tp_webforms_gottig_ramirez.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="text-align: right">
        <button class="btn btn-danger icon-favoritos dropdown-toggle" type="button" data-bs-toggle="dropdown" style="margin-right: 0px; border-radius: 10px 0px 0px 10px !important">
            <i class="uil uil-heart-alt"></i>Mis Favoritos

        </button>

        <ul class=" dropdown-menu" style="max-height: 80%; overflow-y: auto;">

            <asp:Repeater runat="server" ID="repeaterFavoritos">
                <ItemTemplate>
                    <li class="dropdown-item ">
                        <div class="col m-4" style="width: 400px;">
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

        </ul>
    </div>

    <div class="container mt-5">
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



</asp:Content>
