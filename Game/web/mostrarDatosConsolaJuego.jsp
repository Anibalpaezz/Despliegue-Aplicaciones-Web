<%@ page import="java.sql.*" %>
<%@ page import="gamepackage.Conexion" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Datos de Juegos para Consola</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<%
    try {
        Conexion conexion = new Conexion();
        Connection laConexion = conexion.laConexion;

        // Obtener la consola seleccionada 
        String consolaSeleccionada = request.getParameter("consola");

        String consultaJuegos = "SELECT * FROM juegos WHERE consola=?";
        try (PreparedStatement stmtJuegos = laConexion.prepareStatement(consultaJuegos)) {
            stmtJuegos.setString(1, consolaSeleccionada);
            ResultSet rsJuegos = stmtJuegos.executeQuery();

           
%>
            <h2>Datos de Juegos para la Consola: <%= consolaSeleccionada %></h2>
            
            <table border="1">
                <tr>
                    <th>Nombre del Juego</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Acciones</th>
                </tr>
<%
                // Mostrar TABLA
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
                                    <input type="submit" value="Comprar">
                                <% } else { %>
                                    No hay stock disponible
                                <% } %>
                            </form>
                        </td>
                    </tr>
<%
                }
%>
            </table>
<%
        } 

        // Procesar la compra
        if ("POST".equals(request.getMethod())) {
            String juegoSeleccionado = request.getParameter("juegoNombre");
            String juegoPrecio = request.getParameter("juegoPrecio");
            int juegoStock = Integer.parseInt(request.getParameter("juegoStock"));

            if (juegoSeleccionado != null && !juegoSeleccionado.isEmpty() && juegoStock > 0) {
                // Actualizar el stock del juego seleccionado
                String updateQuery = "UPDATE juegos SET stock = stock - 1 WHERE nombre=?";
                try (PreparedStatement updateStmt = laConexion.prepareStatement(updateQuery)) {
                    updateStmt.setString(1, juegoSeleccionado);
                    updateStmt.executeUpdate();
                }
                
%>
                <script>
                    setTimeout(function() {
                        window.location.href = 'comprado.html';
                    }, 100);
                </script>
<%
            }
        }

        // Cierra la conexión 
        laConexion.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<a href="seleccionarConsolaJuego.jsp">Volver</a>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
