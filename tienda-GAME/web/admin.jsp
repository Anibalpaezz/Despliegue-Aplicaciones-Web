<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('fotos/1.jpg'); /* Cambia la ruta según la ubicación de tu imagen */
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

<!-- Contenido específico para administradores -->
<h2 style="color: white; text-align: center;">Bienvenido, Administrador</h2>

<!-- Aquí puedes agregar más contenido específico para administradores -->

</body>
</html>
