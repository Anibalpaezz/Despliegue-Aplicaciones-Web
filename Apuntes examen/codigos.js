let tabla = document.getElementById('tabla');
tabla.addEventListener('click', celdaclick);

function celdaclick(event) {
    let celda = event.target;
    if (celda.tagName === 'TD') {
        /* celda.style.backgroundColor='red'; */
        if (celda.style.backgroundColor === '') {
            celda.style.backgroundColor = 'red';
            colorear('green', celda);
        } else if (celda.style.backgroundColor === 'red') {
            celda.style.backgroundColor = 'yellow';
            colorear('', celda);
        }
    }
}

function colorear(nuevo, celda) {
    let fila = celda.parentElement.rowIndex;
    let columna = celda.cellIndex;
    console.log(fila, columna);
    let camposacolorear = [
        { fila: fila + 1, columna: columna }, //superior
        { fila: fila - 1, columna: columna }, //inferior
        { fila: fila, columna: columna + 1 }, //derecha
        { fila: fila, columna: columna - 1 }, //izquierda
        { fila: fila + 1, columna: columna + 1 }, //superior derecha
        { fila: fila + 1, columna: columna - 1 }, //superior izquierda
        { fila: fila - 1, columna: columna + 1 }, //inferior derecha
        { fila: fila - 1, columna: columna - 1 }, //inferior izquierda
    ];
    for (let posiciones of camposacolorear) {
        let filarelativa = posiciones.fila;
        let columnarelativa = posiciones.columna;
        if (filarelativa >= 0 && filarelativa < tabla.rows.length && columnarelativa >= 0 && columnarelativa < tabla.rows[filarelativa].cells.length) {
            let celdaaux = tabla.rows[filarelativa].cells[columnarelativa];
            if (celdaaux.style.backgroundColor === 'red') {
            } else {
                celdaaux.style.backgroundColor = nuevo;
            }
        }
    }
}