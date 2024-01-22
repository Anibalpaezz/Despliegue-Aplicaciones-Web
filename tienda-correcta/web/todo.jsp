<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    //HttpSession session = request.getSession(false);
    /*if (session == null || session.getAttribute("admin") == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.html");
    }*/
%>

<html>
    <head>
        <title>Catálogo Completo</title>
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
            ResultSet rsJuegos = null;
            ResultSet rsConsolas = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");

                String url = "jdbc:mysql://localhost:3306/tienda_juegos";
                String user = "anibal";
                String password = "nico";
                conn = DriverManager.getConnection(url, user, password);

                String queryJuegos = "SELECT * FROM juegos";
                stmt = conn.createStatement();
                rsJuegos = stmt.executeQuery(queryJuegos);
        %>
        <h1>Catálogo Completo</h1>
        <h2>Juegos</h2>
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
                while (rsJuegos.next()) {
            %>
            <tr>
                <td><%= rsJuegos.getString("nombre") %></td>
                <td><%= rsJuegos.getString("compania_desarrolladora") %></td>
                <td><%= rsJuegos.getString("genero") %></td>
                <td><%= rsJuegos.getInt("puntuacion_metacritic") %></td>
                <td><%= rsJuegos.getDouble("precio") %></td>
                <td><%= rsJuegos.getInt("unidades_disponibles") %></td>
            </tr>
            <tr>
                <th>Nombre de la Consola</th>
                <th>Potencia de la CPU</th>
                <th>Potencia de la GPU</th>
                <th>Compañía</th>
                <th>Precio</th>
                <th>Unidades Disponibles</th>
                <th>Generación</th>
            </tr>
            <%
        String queryConsolas = "SELECT * FROM consolas";
        rsConsolas = stmt.executeQuery(queryConsolas);

        while (rsConsolas.next()) {
            %>
            <tr>
                <td><%= rsConsolas.getString("nombre") %></td>
                <td><%= rsConsolas.getFloat("frecuencia_cpu") %></td>
                <td><%= rsConsolas.getFloat("frecuencia_gpu") %></td>
                <td><%= rsConsolas.getString("compania") %></td>
                <td><%= rsConsolas.getDouble("precio") %></td>
                <td><%= rsConsolas.getInt("unidades_disponibles") %></td>
                <td><%= rsConsolas.getInt("generacion") %></td>
            </tr>
        </table>

        <h2>Consolas</h2>
        <table>
            <tr>
                <th>Nombre de la Consola</th>
                <th>Potencia de la CPU</th>
                <th>Potencia de la GPU</th>
                <th>Compañía</th>
                <th>Precio</th>
                <th>Unidades Disponibles</th>
                <th>Generación</th>
            </tr>
            <%
                    String queryConsolas = "SELECT * FROM consolas";
                    rsConsolas = stmt.executeQuery(queryConsolas);

                    while (rsConsolas.next()) {
            %>
            <tr>
                <td><%= rsConsolas.getString("nombre") %></td>
                <td><%= rsConsolas.getFloat("frecuencia_cpu") %></td>
                <td><%= rsConsolas.getFloat("frecuencia_gpu") %></td>
                <td><%= rsConsolas.getString("compania") %></td>
                <td><%= rsConsolas.getDouble("precio") %></td>
                <td><%= rsConsolas.getInt("unidades_disponibles") %></td>
                <td><%= rsConsolas.getInt("generacion") %></td>
            </tr>
            <%
                    }
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                    out.println("Error: MySQL JDBC driver not found");
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Error: " + e.getMessage());
                } finally {
                    try { if (rsJuegos != null) rsJuegos.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (rsConsolas != null) rsConsolas.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>

    </body>
</html>
