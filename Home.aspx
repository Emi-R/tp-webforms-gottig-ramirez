<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="tp_webforms_gottig_ramirez.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <div class="row row-cols-1 row-cols-md-2 g-4 justify-content-center">
            <% foreach (var item in listaArticulos)
                { %>
            <div class="col">
                <div class="card m-auto p-2" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-3">
                            <img src="<%: item.ImagenUrl %>" class="img-fluid rounded-start mt-4" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <h5 class="card-title"><%: item.Nombre %></h5>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">

                                        <p class="card-text"><small class="text-muted">Cod: <%: item.Codigo %></small></p>
                                        <p class="card-text"><%: item.Descripcion %></p>
                                        <p class="card-text mt-2">$ <%: item.Precio %></p>
                                    </div>
                                    <div class="col-md-3 m-auto">
                                        <asp:Button ID="btnAgregar" class="btn btn-outline-success" runat="server" Text="Agregar" />
                                        <asp:Button ID="btnFavorito" class="btn btn-outline-danger mt-3" runat="server" Text="Favorito" />
                                    </div>
                                </div>

                            </div>
                        </div>
                        <%--<div class="col-md-3 m-auto">
                        </div>--%>
                    </div>
                </div>
            </div>

            <% } %>
        </div>
    </div>

</asp:Content>
