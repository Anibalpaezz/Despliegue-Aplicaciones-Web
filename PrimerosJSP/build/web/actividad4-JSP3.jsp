<%-- 
    Document   : actividad4-JSP3
    Created on : 26 oct 2023, 10:04:23
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
        <h1>Ejemplo de declaracion</h1>
        <%!
            int resultado;
            int suma(int x, int y) {
                resultado = x + y;
                return resultado;
            }

            int resta(int x, int y) {
                resultado = x - y;
                return resultado;
            }

            int multiplicacion(int x, int y) {
                resultado = x * y;
                return resultado;
            }

            int division(int x, int y) {
                resultado = x / y;
                return resultado;
            }   
        %>

        <h3>Suma: <%= suma(10, 50)%></h3>
        <h3>Resta: <%= resta(780, 70)%></h3>
        <h3>Multiplicacion: <%= multiplicacion(2, 66)%></h3>
        <h3>Division: <%= division(87835, 986)%></h3>
    </body>
</html>
