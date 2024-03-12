<%-- 
    Document   : registro
    Created on : 30 oct 2023, 16:26:18
    Author     : Nico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>resultado</h1>
        <h2>fecha de hoy : <%= new java.util.Date()%></h2>
        <h2>nombre = <%= request.getParameter("nombre")%></h2>
        <h2>apellido = <%= request.getParameter("apellido")%></h2>
        <jsp:include page="formulario.html"></jsp:include> <!-- añadir codigo en el jsp -->
        
    </body>
</html>
