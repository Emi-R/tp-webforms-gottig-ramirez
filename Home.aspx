<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="tp_webforms_gottig_ramirez.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">
        <div class="row">
            <% foreach (var item in listaArticulos)
                { %>

            <div class="card m-4" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="<%: item.ImagenUrl %>" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-5">
                        <div class="card-body">
                            <h5 class="card-title"><%: item.Nombre %></h5>
                            <p class="card-text"><small class="text-muted"> Cod: <%: item.Codigo %></small></p>
                            <p class="card-text"><%: item.Descripcion %></p>
                            <p class="card-text"> $ <%: item.Precio %></p>
                        </div>
                    </div>
                    <div class="col-md-3 m-auto">
                        <asp:Button ID="btnAgregar" class="btn btn-outline-success" runat="server" Text="Agregar" />
                        <asp:Button ID="btnFavorito" class="btn btn-outline-danger mt-3" runat="server" Text="Favorito" />
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        
    </div>

</asp:Content>
