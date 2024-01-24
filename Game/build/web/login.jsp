<%-- 
    Document   : login
    Created on : 12 dic 2023, 9:29:22
    Author     : GSW2A8481962
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario de registro</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="estilo.css">
        <link rel="shortcut icon" href="#">
        <style>
            .principal{
                display: flex;
                justify-content: center;
            }
            body{
                heigh:99%;
                width:99%;
            }
        </style>
    </head>
    <body>
        <!-- BARRA NAVEGACIÓN -->
    <div class="bg-light">
		<nav class="navbar navbar-expand-md navbar-light bg-light border-3 border-bottom border-primary">
            <div class="container-fluid">
                <a href="index.html" class="navbar-brand">GAME</a>
            </div>
            <div id="MenuNavegacion" class="collapse navbar-collapse">
                <ul class="navbar-nav ms-3">
                    <li class="nav-item">
                        <a class="nav-link text-nowrap" href="index.html"><button name="login" type="button" class="btn btn-outline-primary">Volver</button></a>
                    </li>
                </ul>
			</div>
		</nav>
	</div>
    <!-- BARRA NAVEGACIÓN -->
    <div class="principal">
        <br><br>
        <form action="loginservlet" method="post">
            <center><h1>LogIn Usuarios</h1></center>
            <table>
                
                <tr>
                    <td><br><br><br><br><br>Usuario  </td>
                    <td><br><br><br><br><br><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td>Contrseña  </td>
                    <td><input type="password" name="passwd"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <br><br><input class=""  type="submit" name="login" value="LogIn">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    </body>
</html>