<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    //HttpSession session = request.getSession(false);
    /*if (session == null || session.getAttribute("admin") == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.html");
    }*/
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Borrado de Juegos y Consolas</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }

        nav {
            background-color: #333;
            overflow: hidden;
        }

        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        nav a:hover {
            background-color: #ddd;
            color: black;
        }

        .container {
            margin: 20px;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        button {
            padding: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="container">

    <h1>Borrado de Juegos y Consolas</h1>

    <form action="borrado" method="post">
        <label for="tipo">Selecciona el tipo:</label>
        <select name="tipo" id="tipo">
            <option value="juegos">Juegos</option>
            <option value="consolas">Consolas</option>
        </select>

        <% if (request.getAttribute("juegos") != null) { %>
            <h2>Juegos Disponibles</h2>
            <table>
                <tr>
                    <th>ID Juego</th>
                    <th>Nombre del Juego</th>
                    <th>Compañía Desarrolladora</th>
                    <th>Acción</th>
                </tr>
                <% for (Map<String, Object> juego : (List<Map<String, Object>>)request.getAttribute("juegos")) { %>
                    <tr>
                        <td><%= juego.get("id_juego") %></td>
                        <td><%= juego.get("nombre") %></td>
                        <td><%= juego.get("compania_desarrolladora") %></td>
                        <td><input type="checkbox" name="seleccion[]" value="<%= juego.get("nombre") %>" /></td>
                    </tr>
                <% } %>
            </table>
        <% } else if (request.getAttribute("consolas") != null) { %>
            <h2>Consolas Disponibles</h2>
            <table>
                <tr>
                    <th>ID Consola</th>
                    <th>Nombre de la Consola</th>
                    <th>Compañía</th>
                    <th>Acción</th>
                </tr>
                <% for (Map<String, Object> consola : (List<Map<String, Object>>)request.getAttribute("consolas")) { %>
                    <tr>
                        <td><%= consola.get("id_consola") %></td>
                        <td><%= consola.get("nombre") %></td>
                        <td><%= consola.get("compania") %></td>
                        <td><input type="checkbox" name="seleccion[]" value="<%= consola.get("nombre") %>" /></td>
                    </tr>
                <% } %>
            </table>
        <% } %>

        <button type="submit">Eliminar Seleccionados</button>
    </form>

</div>

</body>
</html>
