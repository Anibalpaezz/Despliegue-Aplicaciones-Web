<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.BufferedWriter,java.io.FileWriter,java.io.IOException" %>
<%@ page import="java.util.Date" %>

<html>
<head>
    <title>Escribir en un Archivo desde JSP</title>
</head>
<body>

<%
    String contenido = "Este es un contenido de ejemplo generado por el JSP el " + new Date();

    String rutaArchivo = "web/WEB-INF/ejercicio1bw.txt";

    try (BufferedWriter writer = new BufferedWriter(new FileWriter(rutaArchivo, true))) {
        writer.write(contenido);
        writer.newLine();
    } catch (IOException e) {
        out.println("Error al escribir en el archivo: " + e.getMessage());
    }

    out.println("<h2>Se ha escrito en el archivo exitosamente desde el JSP.</h2>");
%>

</body>
</html>
