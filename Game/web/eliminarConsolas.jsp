<%@ page import="java.sql.*" %>
<%@ page import="gamepackage.Conexion" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Verificar si la sesión existe
    //HttpSession session = request.getSession(false);                          esto da error nose por que :(    /// no pasa nada porq funciona igual ou yeah
    if (session == null || session.getAttribute("usuario") == null) {
        // Si no hay sesión redirigir al índice
        response.sendRedirect("index.html");
    }
%>
<html>
<head>
    <title>Eliminar Consolas</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<%
    try {
        Conexion conexion = new Conexion();
        Connection laConexion = conexion.laConexion;

        // Consulta consolas
        String consultaConsolas = "SELECT * FROM consolas";
        try (Statement stmtConsolas = laConexion.createStatement();
             ResultSet rsConsolas = stmtConsolas.executeQuery(consultaConsolas)) {

            
%>
            <h2>Eliminar Consolas</h2>
            <form method="post" action="">
                <table border="1">
                    <tr>
                        <th>Nombre</th>
                        <th>CPU</th>
                        <th>GPU</th>
                        <th>Compañía</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Eliminar</th>
                        <th>Borrar Juegos</th>
                    </tr>
<%
                    
                    while (rsConsolas.next()) {
                        String nombreConsola = rsConsolas.getString("nombre");
%>
                        <tr>
                            <td><%= nombreConsola %></td>
                            <td><%= rsConsolas.getString("cpu") %></td>
                            <td><%= rsConsolas.getString("gpu") %></td>
                            <td><%= rsConsolas.getString("compania") %></td>
                            <td><%= rsConsolas.getString("precio") %></td>
                            <td><%= rsConsolas.getInt("stock") %></td>
                            <td>
                                <input type="checkbox" name="consolasAEliminar" value="<%= nombreConsola %>">
                            </td>
                            <td>
                                <select name="borrarJuegos_<%= nombreConsola %>">
                                    <option value="si">Sí</option>
                                    <option value="no" selected>No</option>
                                </select>
                            </td>
                        </tr>
<%
                    }
%>
                </table>
                <br>
                <input type="submit" value="Eliminar Consolas Seleccionadas">
            </form>
<%
        } 


        if ("POST".equals(request.getMethod())) {
            String[] consolasAEliminar = request.getParameterValues("consolasAEliminar");
            if (consolasAEliminar != null) {
                for (String consolaAEliminar : consolasAEliminar) {
                    
                    String borrarJuegosOption = request.getParameter("borrarJuegos_" + consolaAEliminar);
                    
                    if ("si".equals(borrarJuegosOption)) {
                        // Borrar los juegos asociados de la consola
                        String deleteJuegosQuery = "DELETE FROM juegos WHERE consola=?";
                        try (PreparedStatement deleteJuegosStmt = laConexion.prepareStatement(deleteJuegosQuery)) {
                            deleteJuegosStmt.setString(1, consolaAEliminar);
                            deleteJuegosStmt.executeUpdate();
                        }
                    }
                    
                    // Borrar la consola
                    String deleteConsolaQuery = "DELETE FROM consolas WHERE nombre=?";
                    try (PreparedStatement deleteConsolaStmt = laConexion.prepareStatement(deleteConsolaQuery)) {
                        deleteConsolaStmt.setString(1, consolaAEliminar);
                        deleteConsolaStmt.executeUpdate();
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
<p>Ten en cuenta que no se puede borrar una consola si existen juegos de esa consola. Para ello está el botón de borrar juegos que antes de borrar la consola borra todos los juegos de esta.</p>
<a href="elegirAdmin.jsp">Volver</a>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
