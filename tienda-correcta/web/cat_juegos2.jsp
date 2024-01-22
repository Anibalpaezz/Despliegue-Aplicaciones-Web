<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Catálogo de Juegos</title>
        <style>
            table{border-collapse:collapse;width:80%;margin:20px}td,th{border:1px solid #ddd;padding:10px;text-align:left}th{background-color:#333;color:#fff}.filtrar{margin-top:10px;padding:10px;background-color:#4caf50;color:#fff;border:none;border-radius:4px;cursor:pointer}
        </style>
    </head>
    <body>
        <h1>Filtrar juegos por consola</h1>
        <form action="" method="get">
            <label for="generacion">Selecciona la generación:</label>
            <select name="generacion" id="generacion">
                <option value="PS5">PS5</option>
                <option value="Xbox">Xbox S/X</option>
                <option value="Nintendo">Nintendo switch</option>
                <option value="PS4">PS4</option>
                <option value="XbOne">Xbox One</option>
            </select>
            <button type="submit" class="filtrar">Filtrar</button>
        </form>

        <table>
            <tr>
                <th>Nombre del Juego</th>
                <th>Consola</th>
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

                    String select_filtro = request.getParameter("generacion");
                    String consulta = "SELECT juegos.*, consolas.nombre AS nombre_consola FROM juegos " +
                    "JOIN consolas ON juegos.id_consola = consolas.id_consola";

if (select_filtro != null && !select_filtro.isEmpty() && select_filtro.equals("PS5")) {
    consulta += " WHERE consolas.nombre LIKE 'PS5%'";
} else if (select_filtro != null && !select_filtro.isEmpty() && select_filtro.equals("Xbox")) {
    consulta += " WHERE consolas.nombre LIKE 'X%S' OR consolas.nombre LIKE 'X%X'";
} else if (select_filtro != null && !select_filtro.isEmpty() && select_filtro.equals("Nintendo")) {
    consulta += " WHERE consolas.nombre LIKE 'Nintendo%'";
} else if (select_filtro != null && !select_filtro.isEmpty() && select_filtro.equals("PS4")) {
    consulta += " WHERE consolas.nombre LIKE 'PS4'";
} else if (select_filtro != null && !select_filtro.isEmpty() && select_filtro.equals("XbOne")) {
    consulta += " WHERE consolas.nombre LIKE 'X%%e'";
}
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(consulta);

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("nombre")%></td>
                <td><%= rs.getString("nombre_consola")%></td>
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
                }
            %>
        </table>
    </body>
</html>
