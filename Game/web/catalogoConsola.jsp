<%@ page import="java.sql.*" %>
<%@ page import="gamepackage.Conexion" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mostrar Datos de Todas las Consolas</title>
</head>
<body>

<%
    try {
        Conexion conexion = new Conexion();
        Connection laConexion = conexion.laConexion;

        String consultaDetalleConsolas = "SELECT * FROM consolas";
        try (Statement stmt = laConexion.createStatement();
             ResultSet rs = stmt.executeQuery(consultaDetalleConsolas)) {

            // Mostrar tabla
%>
            <h2>Datos de Todas las Consolas</h2>
            <table border="1">
                <tr>
                    <th>Nombre</th>
                    <th>CPU</th>
                    <th>GPU</th>
                    <th>Compañía</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Acciones</th>
                </tr>
<%
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
                                <% if (consolaStock > 0) { %>
                                    <input type="submit" value="Comprar">
                                <% } else { %>
                                    No hay stock disponible
                                <% } %>
                            </form>
                        </td>
                    </tr>
<%
                    //procesar compra
                    if ("POST".equals(request.getMethod())) {
                        String consolaSeleccionada = request.getParameter("consolaNombre");
                        if (consolaSeleccionada != null && consolaSeleccionada.equals(consolaNombre)) {

                            if (consolaStock > 0) {

                                String updateQuery = "UPDATE consolas SET stock = stock - 1 WHERE nombre=?";
                                try (PreparedStatement updateStmt = laConexion.prepareStatement(updateQuery)) {
                                    updateStmt.setString(1, consolaNombre);
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
<a href="consolas.html">Volver</a>
</body>
</html>
