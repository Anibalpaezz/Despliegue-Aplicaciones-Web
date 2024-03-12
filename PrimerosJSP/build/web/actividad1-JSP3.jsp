<%-- 
    Document   : actividad1-JSP3
    Created on : 26 oct 2023, 9:51:22
    Author     : Anibal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Ejemplo de expresiones</h1>
        <h2>Convertir a mayusculas</h2>
        <p>Convirtiendo a mayusculas: <%= "Alejandro".toUpperCase() %></p>
        <h2>Expresiones matematicas</h2>
        <p>Sumando numeros: 5+3 <%= 5+3 %></p>
        <h2>Expresiones booleanas</h2>
        <p>10 es mayor que 5 <%= 10>5 %></p>
    </body>
</html>
