<%-- 
    Document   : registroNuevoUsuario
    Created on : 14 nov 2023, 10:24:09
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Registro</title>
        <link href="estilos.css" rel="stylesheet">
        <%
            String login=request.getParameter("registra");
            if(login==null){
                response.sendRedirect("index.html");
            }
        %>
    </head>
    <body>
        <h2>Regístrate</h2>
        <form action="servletDeRegistro" method="post">
            Usuario:<input type="text" name="username"><br><br>
            Password:<input type="text" name="passwd"><br><br>
            <input type="submit" name="registrar" value="Registrar">
        </form>
    </body>
</html>
