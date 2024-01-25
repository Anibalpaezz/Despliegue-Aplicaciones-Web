<%-- 
    Document   : compruebaUseradm
    Created on : Jan 21, 2024, 1:20:46 PM
    Author     : apg
--%>

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

String db = "";
String dbuser = "";
String dbpass = "";

//out.println(usuario + pass);

String archivo = getServletContext().getRealPath("/WEB-INF/datosDeConexion.txt");
try {
    BufferedReader lectura = new BufferedReader(new FileReader(archivo));
    String linea;
    int contador = 0;

    while ((linea = lectura.readLine()) != null && contador < 3) {
    String[] partes = linea.split("-");
    
    if (partes.length >= 2) {
        String clave = partes[0];
        String valor = partes[1];
        
        switch (clave.toLowerCase()) {
            case "dbname":
                db = valor;
                break;
            case "user":
                dbuser = valor;
                break;
            case "pass":
                dbpass = valor;
                break;
            default:
                break;
        }
    }
    
    contador++;
}

out.println(db);
out.println(dbuser);
out.println(dbpass);

lectura.close(); 
} catch (IOException e) {
    out.println("Error al leer el archivo");
}

String url = "jdbc:mysql://localhost:3306/" + db;
Connection laconex = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    laconex = DriverManager.getConnection(url, dbuser, dbpass);

    String consulta = "SELECT * FROM usuarios where nombreUser = ? AND password = ?";
    stmt = laconex.prepareStatement(consulta);
    stmt.setString(1, usuario);
    stmt.setString(2, pass);


    rs = stmt.executeQuery();

    if (rs.next()) {
        boolean adm = rs.getBoolean("adm");

        if (adm) {
            response.sendRedirect("funcionalidadesAdm");
        } else {
            response.sendRedirect("funcionalidadesUsuarios");
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

%>


<%-- <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1>Inicio de sesion</h1>
    </body>
</html> --%>
