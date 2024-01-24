<%-- 
    Document   : elegirAdmin
    Created on : 5 ene 2024, 13:58:42
    Author     : pablo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Elegir Acción</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
      background-color: #f8f9fa; /* Color de fondo  */
    }

    .btn-container {
      text-align: center;
    }

    .btn-custom {
      margin: 5px;
      background-color: #007bff; /* Color de fondo para los botones */
      color: #ffffff; /* Color del texto en los botones */
      border: none;
    }

    .btn-custom:hover {
      background-color: #0056b3; 
    }
  </style>
</head>
<body>
    <!-- BARRA NAVEGACIÓN -->
<div class="bg-light">
    <nav class="navbar navbar-expand-md navbar-light bg-light border-3 border-bottom border-primary">
        
        <div id="MenuNavegacion" class="collapse navbar-collapse">
            <ul class="navbar-nav ms-3">
                <li class="nav-item">
                    <a class="nav-link text-nowrap" href="logoutservlet"><button name="login" type="button" class="btn btn-outline-primary">Salir</button></a>
                </li>
            </ul>
        </div>
    </nav>
</div>
<!-- BARRA NAVEGACIÓN -->

  <div class="btn-container">
      <a href="introducirConsola.jsp"><button class="btn btn-custom btn-lg">Introducir Consola</button></a>
    <a href="introducirJuego.jsp"><button class="btn btn-custom btn-lg">Introducir Juego</button></a>
    <a href="eliminarConsolas.jsp"><button class="btn btn-custom btn-lg">Eliminar Consola</button></a>
    <a href="eliminarJuego.jsp"><button class="btn btn-custom btn-lg">Eliminar Juego</button></a>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

