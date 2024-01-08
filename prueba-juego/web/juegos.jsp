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

        .comprar-button {
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

                String query = "SELECT * FROM juegos";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(query);
        %>
        <h1>Catálogo de Juegos</h1>
        <form action="compra" method="get">
            <table>
                <tr>
                    <th>Nombre del Juego</th>
                    <th>Compañía Desarrolladora</th>
                    <th>Género</th>
                    <th>Puntuación en Metacritic</th>
                    <th>Precio</th>
                    <th>Unidades Disponibles</th>
                    <th>Comprar</th>
                </tr>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("nombre_juego")%></td>
                    <td><%= rs.getString("compania_desarrolladora")%></td>
                    <td><%= rs.getString("genero")%></td>
                    <td><%= rs.getInt("puntuacion_metacritic")%></td>
                    <td><%= rs.getDouble("precio")%></td>
                    <td><%= rs.getInt("unidades_disponibles")%></td>
                    <td><input type="checkbox" name="seleccion[]" value="<%= rs.getString("nombre_juego")%>"></td>

                </tr>
                <%
                    }
                %>
            </table>
            <button type="submit" class="comprar-button">Comprar Seleccionados</button>
        </form>
        <%
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                out.println("Error: " + e.getMessage());
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                try {
                    if (stmt != null) {
                        stmt.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>

    </body>
</html>