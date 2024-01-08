<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GAME</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('fotos/2.png'); /* Cambia la ruta según la ubicación de tu imagen */
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
    <a href="index.html">Cerrar sesion</a>
</nav>

<h2 style="color: white; text-align: center;">Bienvenido, <%=session.getAttribute("nombre")%></h2>


</body>
</html>
