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
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getString("nombre_consola") %></td>
                <td><%= rs.getFloat("frecuencia_cpu") %></td>
                <td><%= rs.getFloat("frecuencia_gpu") %></td>
                <td><%= rs.getString("compania") %></td>
                <td><%= rs.getDouble("precio") %></td>
                <td><%= rs.getInt("unidades_disponibles") %></td>
                <td><%= rs.getInt("generacion") %></td>
            </tr>
<%
        }
%>
        </table>
<%
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("Error: MySQL JDBC driver no encontrado");
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
