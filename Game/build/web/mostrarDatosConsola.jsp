<%@ page import="java.sql.*" %>
<%@ page import="gamepackage.Conexion" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mostrar Datos de la Consola</title>
</head>
<body>

<%
    try {
        Conexion conexion = new Conexion();
        Connection laConexion = conexion.laConexion;

        // Obtener el nombre de la consola seleccionada
        String nombreConsola = request.getParameter("consola");


        String consultaDetalleConsola = "SELECT * FROM consolas WHERE nombre=?";
        try (PreparedStatement stmt = laConexion.prepareStatement(consultaDetalleConsola)) {
            stmt.setString(1, nombreConsola);
            ResultSet rs = stmt.executeQuery();

            // Mostrar tabla
%>
            <h2>Datos de la Consola: <%= nombreConsola %></h2>
            <table border="1">
                <tr>
                    <th>Nombre</th>
                    <th>CPU</th>
                    <th>GPU</th>
                    <th>Compañía</th>
                    <th>Precio</th>
                    <th>Stock</th>
                </tr>
<%
                
                while (rs.next()) {
%>
                    <tr>
                        <td><%= rs.getString("nombre") %></td>
                        <td><%= rs.getString("cpu") %></td>
                        <td><%= rs.getString("gpu") %></td>
                        <td><%= rs.getString("compania") %></td>
                        <td><%= rs.getString("precio") %></td>
                        <td><%= rs.getShort("stock") %></td>
                    </tr>
<%
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
<a href="SeleccionarConsola.jsp">Volver</a>
</body>
</html>
