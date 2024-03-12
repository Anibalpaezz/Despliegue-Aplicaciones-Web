<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logueado</title>
</head>
<body>
    <h2>Login correcto</h2>
    <p>Bienvenido, <%= session.getAttribute("username") %>!</p>

    <!-- Add a form with a button to invalidate the session -->
    <form action="LogoutServlet" method="post">
        <button type="submit">Cerrar sesion</button>
    </form>
</body>
</html>
