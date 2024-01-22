<%@ page import="java.sql.*" %>
<%@ page import="gamepackage.Conexion" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Verificar si la sesión existe
    //HttpSession session = request.getSession(false);                          esto da error nose por que :(     /// no pasa nada porq funciona igual ou yeah
    if (session == null || session.getAttribute("usuario") == null) {
        // Si no hay sesión redirigir al índice
        response.sendRedirect("index.html");
    }
%>

<html>
<head>
    <title>Introducir Consola</title>
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
        String nombreConsola = request.getParameter("nombre");
        String gpu = request.getParameter("gpu");
        String cpu = request.getParameter("cpu");
        String compania = request.getParameter("compania");
        String precio = request.getParameter("precio");
        Short stock = Short.parseShort(request.getParameter("stock"));

        if (nombreConsola != null && gpu != null && cpu != null && compania != null) {
            Conexion conexion = new Conexion();
            Connection laConexion = conexion.laConexion;


            String consultaInsertarConsola = "INSERT INTO consolas (nombre, gpu, cpu, compania, precio, stock) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = laConexion.prepareStatement(consultaInsertarConsola)) {
                stmt.setString(1, nombreConsola);
                stmt.setString(2, gpu);
                stmt.setString(3, cpu);
                stmt.setString(4, compania);
                stmt.setString(5, precio);
                stmt.setShort(6, stock);

                int filasAfectadas = stmt.executeUpdate();

                if (filasAfectadas > 0) {
                    //insertar la consola OK
%>
                    <h2>Consola Insertada Exitosamente</h2>
<%
                } else {
                    // Error insertar la consola
%>
                    <h2>Error al Insertar la Consola</h2>
<%
                }
            }

            // Cierra la conexión 
            laConexion.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<form action="introducirConsola.jsp" method="post">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" required><br>

    <label for="gpu">GPU:</label>
    <input type="text" name="gpu" required><br>

    <label for="cpu">CPU:</label>
    <input type="text" name="cpu" required><br>

    <label for="compania">Compañía:</label>
    <input type="text" name="compania" required><br>

    <label for="precio">Precio:</label>
    <input type="text" name="precio" required><br>

    <label for="stock">Stock:</label>
    <input type="number" name="stock" required><br>

    <input type="submit" value="Introducir Consola">
</form>
<a href="elegirAdmin.jsp">Volver</a>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
