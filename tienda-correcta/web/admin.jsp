<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("index.html");
    }
%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GAME</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('fotos/1.jpg');
            background-size: cover;
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
    </style>
</head>
<body>

<nav>
    <a href="juegos.jsp">Juegos</a>
    <a href="consolas.jsp">Consolas</a>
    <a href="todo.jsp">Todo</a>
    <a href="stock.jsp">Stock</a>
    <a href="nuevo_juego.jsp">Agregar Juego</a>
    <a href="elim_consolas.jsp">Eliminar consola</a>
    <a href="elim_juegos.jsp">Eliminar juegos</a>
    <a href="logout">Cerrar sesion</a>
</nav>
    

<h2 style="color: white; text-align: center;">Bienvenido, <%=session.getAttribute("admin")%></h2>

</body>
</html>
