<%@ page import="java.sql.*" %>
<%@ page import="gamepackage.Conexion" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Sesiones--------
    //HttpSession session = request.getSession(false);                          esto da error nose por que :(    /// no pasa nada porq funciona igual ou yeah
    if (session == null || session.getAttribute("usuario") == null) {
        // Si no hay sesión redirigir al índice
        response.sendRedirect("index.html");
    }
%>

<html>
<head>
    <title>Introducir Juego</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<!-- BARRA NAVEGACIÓN -->
<div class="bg-light">
    <nav class="navbar navbar-expand-md navbar-light bg-light border-3 border-bottom border-primary">
        <div class="container-fluid">
            <a href="index.html" class="navbar-brand">GAME</a>
        </div>
        <div id="MenuNavegacion" class="collapse navbar-collapse">
            <ul class="navbar-nav ms-3">
                <li class="nav-item">
                    <a class="nav-link text-nowrap" href="logoutservlet"><button name="login" type="button" class="btn btn-outline-primary">LogOut</button></a>
                </li>
            </ul>
        </div>
    </nav>
</div>
<!-- BARRA NAVEGACIÓN -->

<%
    
    try {
        Conexion conexion = new Conexion();
        Connection laConexion = conexion.laConexion;

     
        String consultaConsolas = "SELECT nombre FROM consolas";
        try (PreparedStatement stmtConsolas = laConexion.prepareStatement(consultaConsolas);
             ResultSet rsConsolas = stmtConsolas.executeQuery()) {

%>
            <form action="" method="post">
                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" required><br>

                <label for="consola">Consola:</label>
                <select name="consola" required>
                    <% while (rsConsolas.next()) { %>
                        <option value="<%= rsConsolas.getString("nombre") %>"><%= rsConsolas.getString("nombre") %></option>
                    <% } %>
                </select><br>

                <label for="compañia">Compañía:</label>
                <input type="text" name="compañia" required><br>

                <label for="genero">Género:</label>
                <input type="text" name="genero" required><br>

                <label for="puntuacion">Puntuación:</label>
                <input type="text" name="puntuacion" required><br>

                <label for="precio">Precio:</label>
                <input type="text" name="precio" required><br>

                <label for="stock">Stock:</label>
                <input type="number" name="stock" required><br>

                <input type="submit" value="Introducir Juego">
            </form>
<%
            
            if (request.getMethod().equalsIgnoreCase("post")) {
                String nombre = request.getParameter("nombre");
                String consola = request.getParameter("consola");
                String compañia = request.getParameter("compañia");
                String genero = request.getParameter("genero");
                String puntuacion = request.getParameter("puntuacion");
                String precio = request.getParameter("precio");
                Short stock = Short.parseShort(request.getParameter("stock"));

                // Consulta para insertar un nuevo juego
                String consultaInsertarJuego = "INSERT INTO juegos (nombre, consola, compañia, genero, puntuacion, precio, stock) VALUES (?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement stmtInsertarJuego = laConexion.prepareStatement(consultaInsertarJuego)) {
                    stmtInsertarJuego.setString(1, nombre);
                    stmtInsertarJuego.setString(2, consola);
                    stmtInsertarJuego.setString(3, compañia);
                    stmtInsertarJuego.setString(4, genero);
                    stmtInsertarJuego.setString(5, puntuacion);
                    stmtInsertarJuego.setString(6, precio);
                    stmtInsertarJuego.setShort(7, stock);

                    int filasAfectadas = stmtInsertarJuego.executeUpdate();

                    if (filasAfectadas > 0) {
                        //insertar el juego OK
%>
                        <h2>Juego Insertado Exitosamente</h2>
<%
                    } else {
                        //Error insertar el juego
%>
                        <h2>Error al Insertar el Juego</h2>
<%
                    }
                }
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
