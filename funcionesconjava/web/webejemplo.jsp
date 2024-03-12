<%-- 
    Document   : webejemplo
    Created on : 30 oct 2023, 16:09:16
    Author     : Nico
--%>
<%@ page import="accesodatos.calculos" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>sumas: <%=calculos.sumar(3,4)%></h1>
        <h1>restar: <%=calculos.restar(10,6)%></h1>
        <h1>restar: <%=request.getHeader("User-Agent")%></h1>
    </body>
</html>
