<%-- 
    Document   : compruebaUser.jsp
    Created on : 21 nov 2023, 9:07:07
    Author     : Anibal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="despliegue.examen.Conexion"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CompruebaUser</title>
        <%
          String enviar = request.getParameter("log");
          if (enviar == null) {
            response.sendRedirect("index.html");
          } else {
            try {
                
            } catch {
                out.println("<h2>Error</h2>");
                out.println(e.getMessage());
            }
          }
        %>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
