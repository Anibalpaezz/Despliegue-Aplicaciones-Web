<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("index.html");
    }
%>


<html>
<head>
    <title>Agregar Juego</title>
</head>
<body>

<%
    Connection conn = null;
    Statement stmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/tienda_juegos";
        String user = "anibal";
        String password = "nico";
        conn = DriverManager.getConnection(url, user, password);

        if (request.getMethod().equals("POST")) {
            String nombre = request.getParameter("nombre");
            String desarrolladora = request.getParameter("desarrolladora");
            String genero = request.getParameter("genero");
            int puntuacion = Integer.parseInt(request.getParameter("puntuacion"));
            double precio = Double.parseDouble(request.getParameter("precio"));
            int unidades = Integer.parseInt(request.getParameter("unidades"));
            int idConsola = Integer.parseInt(request.getParameter("idConsola"));
            int generacion = Integer.parseInt(request.getParameter("generacion"));

            String insertar = "INSERT INTO juegos (nombre, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola, generacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement preparedStatement = conn.prepareStatement(insertar)) {
                preparedStatement.setString(1, nombre);
                preparedStatement.setString(2, desarrolladora);
                preparedStatement.setString(3, genero);
                preparedStatement.setInt(4, puntuacion);
                preparedStatement.setDouble(5, precio);
                preparedStatement.setInt(6, unidades);
                preparedStatement.setInt(7, idConsola);
                preparedStatement.setInt(8, generacion);

                int filas = preparedStatement.executeUpdate();

                if (filas > 0) {
                    out.println("<h2>Juego añadido con éxito.</h2>");
                } else {
                    out.println("<h2>Error al añadir el juego.</h2>");
                }
            }
        }
%>

<form action="" method="post">
    <label for="nombre">Nombre del Juego:</label>
    <input type="text" name="nombre" required><br>

    <label for="desarrolladora">Compañía Desarrolladora:</label>
    <input type="text" name="desarrolladora" required><br>

    <label for="genero">Género:</label>
    <input type="text" name="genero" required><br>

    <label for="puntuacion">Puntuación Metacritic:</label>
    <input type="number" name="puntuacion" min="0" required><br>

    <label for="precio">Precio:</label>
    <input type="number" name="precio" min="0" step="0.01" required><br>

    <label for="unidades">Unidades Disponibles:</label>
    <input type="number" name="unidades" min="0" required><br>

    <label for="idConsola">ID Consola:</label>
    <input type="number" name="idConsola" min="0" required><br>

    <label for="generacion">Generación:</label>
    <input type="number" name="generacion" min="0" required><br>

    <input type="submit" value="Agregar Juego">
</form>

<%
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("Error: MySQL JDBC driver not found");
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

</body>
</html>
