<%@ page import="java.sql.*" %>
<%@ page import="gamepackage.Conexion" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Seleccionar Consola</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<%
   
    try {
        Conexion conexion = new Conexion();
        Connection laConexion = conexion.laConexion;

        
        String consultaConsolas = "SELECT nombre FROM consolas";
        try (PreparedStatement stmt = laConexion.prepareStatement(consultaConsolas);
             ResultSet rs = stmt.executeQuery()) {

%>
            <form action="mostrarDatosConsolaJuego.jsp" method="post">
                <label for="consola">Seleccione una consola:</label>
                <select name="consola" id="consola">
<%
                    // Mostrar opciones del select con los nombres de las consolas
                    while (rs.next()) {
                        String nombreConsola = rs.getString("nombre");
%>
                        <option value="<%= nombreConsola %>"><%= nombreConsola %></option>
<%
                    }
%>
                </select>
                <br>
                <input type="submit" value="Mostrar Datos">
            </form>
<%
        }

        // Cierra la conexión 
        laConexion.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<a href="juegos.html">Volver</a>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
