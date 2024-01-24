<%@ page import="java.sql.*" %>
<%@ page import="gamepackage.Conexion" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            Conexion conexion = new Conexion();
            Connection laConexion = conexion.laConexion;

            // Procesar la compra de consolas
            if (request.getParameter("comprarConsola") != null) {
                String consolaNombre = request.getParameter("consolaNombre");
                String updateConsolaQuery = "UPDATE consolas SET stock = stock - 1 WHERE nombre = ?";
                try (PreparedStatement pstmt = laConexion.prepareStatement(updateConsolaQuery)) {
                    pstmt.setString(1, consolaNombre);
                    pstmt.executeUpdate();
                }
            }

            // Procesar la compra de juegos
            if (request.getParameter("comprarJuego") != null) {
                String juegoNombre = request.getParameter("juegoNombre");
                String updateJuegoQuery = "UPDATE juegos SET stock = stock - 1 WHERE nombre = ?";
                try (PreparedStatement pstmt = laConexion.prepareStatement(updateJuegoQuery)) {
                    pstmt.setString(1, juegoNombre);
                    pstmt.executeUpdate();
                }
            }

            laConexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<html>
<head>
    <title>Catalogo de Consolas y Juegos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <ul class="nav nav-tabs" id="myTabs">
        <li class="nav-item">
            <a class="nav-link active" id="consolas-tab" data-toggle="tab" href="#consolas">Consolas</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="juegos-tab" data-toggle="tab" href="#juegos">Juegos</a>
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane fade show active" id="consolas">
            <h2>Datos de Todas las Consolas</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>CPU</th>
                        <th>GPU</th>
                        <th>Compañía</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Conexion conexion = new Conexion();
                            Connection laConexion = conexion.laConexion;

                            String consultaDetalleConsolas = "SELECT * FROM consolas";
                            try (Statement stmt = laConexion.createStatement();
                                 ResultSet rs = stmt.executeQuery(consultaDetalleConsolas)) {

                                while (rs.next()) {
                                    String consolaNombre = rs.getString("nombre");
                                    String consolaPrecio = rs.getString("precio");
                                    int consolaStock = rs.getInt("stock");
                                %>
                                    <tr>
                                        <td><%= consolaNombre %></td>
                                        <td><%= rs.getString("cpu") %></td>
                                        <td><%= rs.getString("gpu") %></td>
                                        <td><%= rs.getString("compania") %></td>
                                        <td><%= consolaPrecio %></td>
                                        <td><%= consolaStock %></td>
                                        <td>
                                            <form method="post" action="">
                                                <input type="hidden" name="consolaNombre" value="<%= consolaNombre %>">
                                                <input type="hidden" name="consolaPrecio" value="<%= consolaPrecio %>">
                                                <input type="hidden" name="consolaStock" value="<%= consolaStock %>">
                                                <% if (consolaStock > 0) { %>
                                                    <input type="submit" name="comprarConsola" value="Comprar">
                                                <% } else { %>
                                                    No hay stock disponible
                                                <% } %>
                                            </form>
                                        </td>
                                    </tr>
                                <%
                                }
                            }
                            laConexion.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>

        <div class="tab-pane fade" id="juegos">
            <h2>Datos de Todos los Juegos</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nombre del Juego</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Conexion conexion = new Conexion();
                            Connection laConexion = conexion.laConexion;

                            String consultaJuegos = "SELECT * FROM juegos";
                            try (Statement stmtJuegos = laConexion.createStatement();
                                 ResultSet rsJuegos = stmtJuegos.executeQuery(consultaJuegos)) {

                                while (rsJuegos.next()) {
                                    String juegoNombre = rsJuegos.getString("nombre");
                                    String juegoPrecio = rsJuegos.getString("precio");
                                    int juegoStock = rsJuegos.getInt("stock");
                                %>
                                    <tr>
                                        <td><%= juegoNombre %></td>
                                        <td><%= juegoPrecio %></td>
                                        <td><%= juegoStock %></td>
                                        <td>
                                            <form method="post" action="">
                                                <input type="hidden" name="juegoNombre" value="<%= juegoNombre %>">
                                                <input type="hidden" name="juegoPrecio" value="<%= juegoPrecio %>">
                                                <input type="hidden" name="juegoStock" value="<%= juegoStock %>">
                                                <% if (juegoStock > 0) { %>
                                                    <input type="submit" name="comprarJuego" value="Comprar">
                                                <% } else { %>
                                                    No hay stock disponible
                                                <% } %>
                                            </form>
                                        </td>
                                    </tr>
                                <%
                                }
                            }
                            laConexion.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<a href="index.html">Volver</a>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
