<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.html");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GAME</title>
    <style>
        body{margin:0;padding:0;background-image:url('fotos/2.png');background-size:cover;font-family:Arial,sans-serif}nav{background-color:#333;overflow:hidden}nav a{float:left;display:block;color:#fff;text-align:center;padding:14px 16px;text-decoration:none}nav a:hover{background-color:#ddd;color:#000}
    </style>
</head>
<body>

<nav>
    <a href="juegos.jsp">Comprar Juegos</a>
    <a href="consolas.jsp">Comprar Consolas</a>
    <a href="cat_juegos.jsp">Filtro Generacion</a>
    <a href="cat_juegos2.jsp">Filtro Consolas</a>
    <%-- <a href="nuevo_juego.jsp">Agregar Juego</a> --%>
    <%-- <a href="elim_consolas.jsp">Eliminar consola</a> --%>
    <%-- <a href="elim_juegos.jsp">Eliminar juegos</a> --%>
    <a href="logout">Cerrar sesion</a>
</nav>

<h2 style="color: white; text-align: center;">Bienvenido, <%=session.getAttribute("user")%></h2>

</body>
</html>
