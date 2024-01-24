<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Catálogo de Consolas</title>
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

        .comprar {
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

        String query = "SELECT * FROM consolas";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(query);
%>
        <h1>Catálogo de Consolas</h1>
        <form action="compra" method="get">
            <table>
                <tr>
                    <th>Nombre de la Consola</th>
                    <th>Potencia de la CPU</th>
                    <th>Potencia de la GPU</th>
                    <th>Compañía</th>
                    <th>Precio</th>
                    <th>Unidades Disponibles</th>
                    <th>Generación</th>
                    <th>Comprar</th>
                </tr>
<%
        while (rs.next()) {
%>
                <tr>
                    <td><%= rs.getString("nombre") %></td>
                    <td><%= rs.getFloat("frecuencia_cpu") %></td>
                    <td><%= rs.getFloat("frecuencia_gpu") %></td>
                    <td><%= rs.getString("compania") %></td>
                    <td><%= rs.getDouble("precio") %></td>
                    <td><%= rs.getInt("unidades_disponibles") %></td>
                    <td><%= rs.getInt("generacion") %></td>
                    <td><input type="checkbox" name="seleccion[]" value="<%= rs.getString("nombre") %>"></td>
                </tr>
<%
        }
%>
            </table>
            <button type="submit" class="comprar">Comprar Seleccionados</button>
            <input type="hidden" name="paginaOrigen" value="consolas">
        </form>
<%
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("Error: MySQL JDBC driver not found");
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

</body>
</html>
