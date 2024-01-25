<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal de multas</title>
    </head>
    <body>
        <%
            Connection laconex = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                String db = "serviciosDGT";
                String dbuser = "anibal";
                String dbpass = "nico";
                String url = "jdbc:mysql://localhost:3306/" + db;
                laconex = DriverManager.getConnection(url, dbuser, dbpass);

                String consulta = "SELECT * FROM multas where idUsuario = 2";
                stmt = laconex.prepareStatement(consulta);
                rs = stmt.executeQuery();
        %>
        <table>
            <tr>
                <th>ID multa</th>
                <th>Tipo de infraccion</th>
                <th>Cantidad</th>
                <th>ID Usuario</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("IdMulta")%></td>
                <td><%= rs.getString("tipoInfraccion")%></td>
                <td><%= rs.getString("cantidad")%></td>
                <td><%= rs.getInt("idUsuario")%></td>
            </tr>
            <%
                            }
            %>
        </table>
        <a href="index.html"><button>Cerrar sesion</button></a>
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
                    if (laconex != null) {
                        laconex.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </body>
</html>
