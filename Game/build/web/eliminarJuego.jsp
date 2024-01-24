<%@ page import="java.sql.*" %>
<%@ page import="gamepackage.Conexion" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Verificar si la sesión existe
    if (session == null || session.getAttribute("usuario") == null) {
        // Si no hay sesión redirigir al índice
        response.sendRedirect("index.html");
    }
%>
<html>
<head>
    <title>Eliminar Juegos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<%
    try {
        Conexion conexion = new Conexion();
        Connection laConexion = conexion.laConexion;

        // Consulta todos los juegos
        String consultaJuegos = "SELECT * FROM juegos";
        try (Statement stmtJuegos = laConexion.createStatement();
             ResultSet rsJuegos = stmtJuegos.executeQuery(consultaJuegos)) {

            // Mostrar juegos 
%>
            <h2>Eliminar Juegos</h2>
            <form method="post" action="">
                <table border="1">
                    <tr>
                        <th>Nombre</th>
                        <th>Consola</th>
                        <th>Género</th>
                        <th>Puntuación</th>
                        <th>Compañía</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Eliminar</th>
                    </tr>
<%
                    // Mostrar tabla
                    while (rsJuegos.next()) {
                        String nombreJuego = rsJuegos.getString("nombre");
%>
                        <tr>
                            <td><%= nombreJuego %></td>
                            <td><%= rsJuegos.getString("consola") %></td>
                            <td><%= rsJuegos.getString("genero") %></td>
                            <td><%= rsJuegos.getString("puntuacion") %></td>
                            <td><%= rsJuegos.getString("compañia") %></td>
                            <td><%= rsJuegos.getString("precio") %></td>
                            <td><%= rsJuegos.getShort("stock") %></td>
                            <td>
                                <input type="checkbox" name="juegosAEliminar" value="<%= nombreJuego %>">
                            </td>
                        </tr>
<%
                    }
%>
                </table>
                <br>
                <input type="submit" value="Eliminar Juegos Seleccionados">
            </form>
<%
        } 

        if ("POST".equals(request.getMethod())) {
            String[] juegosAEliminar = request.getParameterValues("juegosAEliminar");
            if (juegosAEliminar != null) {
                for (String juegoAEliminar : juegosAEliminar) {
                    // Borrar el juego
                    String deleteJuegoQuery = "DELETE FROM juegos WHERE nombre=?";
                    try (PreparedStatement deleteJuegoStmt = laConexion.prepareStatement(deleteJuegoQuery)) {
                        deleteJuegoStmt.setString(1, juegoAEliminar);
                        deleteJuegoStmt.executeUpdate();
                    }
                }
                // Recargar la página 
                response.sendRedirect(request.getRequestURI());
            }
        }

        // Cierra la conexión
        laConexion.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
    
%>
<a href="elegirAdmin.jsp">Volver</a>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
