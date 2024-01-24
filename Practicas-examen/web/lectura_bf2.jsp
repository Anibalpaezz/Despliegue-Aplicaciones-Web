<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String ruta = getServletContext().getRealPath("/WEB-INF/ejercicio1br.txt");

    try (BufferedReader br = new BufferedReader(new FileReader(ruta))) {
        String lectura;
        while ((lectura = br.readLine()) != null) {
            String[] separar = lectura.split("-");
            for (String separado : separar) {
                out.println("<h1>" + separado + "</h1>");
            }
        }
    } catch (IOException e) {
        e.printStackTrace();
    }
%>
