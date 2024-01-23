<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario 1</title>
</head>
<body>
    <h1>Hola esto es un Formulario</h1>
    <form action="ejercicio_form1" method="post">
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre" id="nombre">

        <label for="pass">Pass</label>
        <input type="text" name="pass" id="pass">

        <button type="submit">Dale</button>
    </form>
</body>
</html>
