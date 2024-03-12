<%-- 
    Document   : actividad2-JSP3
    Created on : 26 oct 2023, 9:56:46
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
        <h1>Ejemplo de Scriptlet</h1>
        <h2>Vamos a realizar un bucle</h2>
        <%
            for(int x=0; x<10; x++) {
                //No ponemos el System porque eso seria para sacar por consola
                out.println("Este es el mensaje numero" + x);
            }
            //Si ejecutamos eso vemos que no se esta haciendo el salto de linea debemos incluir codigo html dentro del Scriptlet
            for(int x=0; x<10; x++) {
                out.println("<br>Este es el mensaje numero: " + x);
            }
        %>
    </body>
</html>
