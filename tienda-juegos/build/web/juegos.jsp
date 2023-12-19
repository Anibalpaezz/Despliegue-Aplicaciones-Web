<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Catálogo de Juegos</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<body>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Establecer la conexión con la base de datos
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/tienda_juegos";
        String user = "anibal";
        String password = "nico";
        conn = DriverManager.getConnection(url, user, password);

        // Consultar el catálogo de juegos
        String query = "SELECT * FROM juegos";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);

        // Mostrar la tabla con el catálogo de juegos
%>
        <h1>Catálogo de Juegos</h1>
        <table>
            <tr>
                <th>Nombre del Juego</th>
                <th>Compañía Desarrolladora</th>
                <th>Género</th>
                <th>Puntuación en Metacritic</th>
                <th>Precio</th>
                <th>Unidades Disponibles</th>
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getString("nombre_juego") %></td>
                <td><%= rs.getString("compania_desarrolladora") %></td>
                <td><%= rs.getString("genero") %></td>
                <td><%= rs.getInt("puntuacion_metacritic") %></td>
                <td><%= rs.getDouble("precio") %></td>
                <td><%= rs.getInt("unidades_disponibles") %></td>
            </tr>
<%
        }
%>
        </table>
<%
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        // Print the error message to the page for debugging purposes
        out.println("Error: " + e.getMessage());
    } finally {
        // Cerrar recursos
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

</body>
</html>
