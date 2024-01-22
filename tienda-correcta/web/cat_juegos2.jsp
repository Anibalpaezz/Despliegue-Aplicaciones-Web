<%@ page import="java.sql.*" %>
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

            .filtrar {
                margin-top: 10px;
                padding: 10px;
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <h1>Filtrar juegos por generación</h1>
        <form action="" method="get">
            <label for="generacion">Selecciona la generación:</label>
            <select name="generacion" id="generacion">
                <option value="PS5">PS5</option>
                <option value="2">Xbox S/X</option>
                <option value="Nintendo switch">Nintendo switch</option>
                <option value="4">PS4</option>
                <option value="5">Xbox One</option>
            </select>
            <button type="submit" class="filtrar">Filtrar</button>
        </form>

        <table>
            <tr>
                <th>Nombre del Juego</th>
                <th>Generacion</th>
                <th>Compañía Desarrolladora</th>
                <th>Género</th>
                <th>Puntuación en Metacritic</th>
                <th>Precio</th>
                <th>Unidades Disponibles</th>
            </tr>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/tienda_juegos";
                    String user = "anibal";
                    String password = "nico";
                    conn = DriverManager.getConnection(url, user, password);

                    String generacionFilter = request.getParameter("generacion");
                    String query = "SELECT * FROM juegos";
                    if (generacionFilter != null && !generacionFilter.isEmpty()) {
                        query += " WHERE id_consola = " + generacionFilter;
                    }

                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(query);

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("nombre")%></td>
                <td><%= rs.getString("generacion")%></td>
                <td><%= rs.getString("compania_desarrolladora")%></td>
                <td><%= rs.getString("genero")%></td>
                <td><%= rs.getInt("puntuacion_metacritic")%></td>
                <td><%= rs.getDouble("precio")%></td>
                <td><%= rs.getInt("unidades_disponibles")%></td>
            </tr>
            <%
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                    out.println("Error: " + e.getMessage());
                } finally {
                    // Close resources in the finally block
                }
            %>
        </table>
    </body>
</html>
