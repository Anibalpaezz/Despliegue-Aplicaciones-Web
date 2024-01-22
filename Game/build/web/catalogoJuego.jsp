<%@ page import="java.sql.*" %>
<%@ page import="gamepackage.Conexion" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mostrar Datos de Todas los Juegos</title>
</head>
<body>

<%
   
    try {
        Conexion conexion = new Conexion();
        Connection laConexion = conexion.laConexion;

        
        String consultaDetalleJuegos = "SELECT * FROM juegos";
        try (Statement stmt = laConexion.createStatement();
             ResultSet rs = stmt.executeQuery(consultaDetalleJuegos)) {

            // Mostrar tabla
%>
            <h2>Datos de Todas los Juegos</h2>
            <table border="1">
                <tr>
                    <th>Nombre</th>
                    <th>Consola</th>
                    <th>Compañía</th>
                    <th>Genero</th>
                    <th>Puntuacion</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Acciones</th>
                </tr>
<%
                
                while (rs.next()) {
                    String juegoNombre = rs.getString("nombre");
                    String juegoPrecio = rs.getString("precio");
                    int juegoStock = rs.getInt("stock");
%>
                    <tr>
                        <td><%= juegoNombre %></td>
                        <td><%= rs.getString("consola") %></td>
                        <td><%= rs.getString("compañia") %></td>
                        <td><%= rs.getString("genero") %></td>
                        <td><%= rs.getString("puntuacion") %></td>
                        <td><%= juegoPrecio %></td>
                        <td><%= juegoStock %></td>
                        <td>
                            <form method="post" action="">
                                <input type="hidden" name="juegoNombre" value="<%= juegoNombre %>">
                                <input type="hidden" name="juegoPrecio" value="<%= juegoPrecio %>">
                                <% if (juegoStock > 0) { %>
                                    <input type="submit" value="Comprar">
                                <% } else { %>
                                    No hay stock disponible
                                <% } %>
                            </form>
                        </td>
                    </tr>
<%
                    //procesar la compra
                    if ("POST".equals(request.getMethod())) {
                        String juegoSeleccionado = request.getParameter("juegoNombre");
                        if (juegoSeleccionado != null && juegoSeleccionado.equals(juegoNombre)) {
                            if (juegoStock > 0) {
                                String updateQuery = "UPDATE juegos SET stock = stock - 1 WHERE nombre=?";
                                try (PreparedStatement updateStmt = laConexion.prepareStatement(updateQuery)) {
                                    updateStmt.setString(1, juegoNombre);
                                    updateStmt.executeUpdate();
                                }
                                // Recargar la página
                                response.sendRedirect(request.getRequestURI());
                            }
                        }
                    }
                }
%>
            </table>
<%
            // Cierra la conexión 
            laConexion.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<a href="juegos.html">Volver</a>
</body>
</html>
