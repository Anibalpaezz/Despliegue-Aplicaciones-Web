<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.*" %>

<%
    String usuario = request.getParameter("usuario");
    String pass = request.getParameter("pass");

    String db = "serviciosDGT";
    String dbuser = "anibal";
    String dbpass = "nico";
    String url = "jdbc:mysql://localhost:3306/" + db;
    Connection laconex = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        laconex = DriverManager.getConnection(url, dbuser, dbpass);

        String consulta = "SELECT * FROM usuarios where nombreUser = ? AND pass = ?";
        stmt = laconex.prepareStatement(consulta);
        stmt.setString(1, usuario);
        stmt.setString(2, pass);

        rs = stmt.executeQuery();

        if (rs.next()) {
            boolean adm = rs.getBoolean("adm");

            if (adm) {
                response.sendRedirect("Administradores.jsp");
            } else {
                response.sendRedirect("Usuarios.jsp");
            }
        }
    } finally {
    try {
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (laconex != null) {
            laconex.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
        /*try {
            Connection laconex = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
        
            String consulta2 = "SELECT * FROM representantes where nombreRepresentante = ? AND password = ? AND idUsuario IN (SELECT ID, adm FROM usuarios)";
            stmt = laconex.prepareStatement(consulta2);
            stmt.setString(1, usuario);
            stmt.setString(2, pass);
            
            rs = stmt.executeQuery();
            if (rs.next()) {
            boolean adm = rs.getBoolean("adm");

            if (adm) {
                response.sendRedirect("Administradores.jsp");
            } else {
                response.sendRedirect("Usuarios.jsp");
            }
        }
    } finally {
    try {
        if (rs != null) {
            rs.close();
        }
        if (stmt != null) {
            stmt.close();
        }
        if (laconex != null) {
            laconex.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}*/
%>
<%-- <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html> --%>
