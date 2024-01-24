CREATE DATABASE IF NOT EXISTS tienda_juegos;

USE tienda_juegos;

CREATE TABLE consolas (
    id_consola INT AUTO_INCREMENT PRIMARY KEY,
    nombre_consola VARCHAR(50) NOT NULL,
    frecuencia_cpu FLOAT,
    frecuencia_gpu FLOAT,
    compania VARCHAR(50),
    precio DECIMAL(10, 2),
    unidades_disponibles INT,
    generacion INT
);

CREATE TABLE juegos (
    id_juego INT AUTO_INCREMENT PRIMARY KEY,
    nombre_juego VARCHAR(100) NOT NULL,
    compania_desarrolladora VARCHAR(50),
    genero VARCHAR(50),
    puntuacion_metacritic INT,
    precio DECIMAL(10, 2),
    unidades_disponibles INT,
    id_consola INT,
    generacion INT,
    FOREIGN KEY (id_consola) REFERENCES consolas(id_consola)
);

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    es_administrador BOOLEAN NOT NULL
);


INSERT INTO consolas (nombre_consola, frecuencia_cpu, frecuencia_gpu, compania, precio, unidades_disponibles, generacion)
VALUES
    ('PS5', 3.5, 2.23, 'Sony', 499.99, 50, 3),
    ('PS5 Sin CD', 3.5, 2.23, 'Sony', 449.99, 30, 3),
    ('Xbox Series X', 3.8, 1.825, 'Microsoft', 499.99, 40, 3),
    ('Xbox Series S', 3.6, 1.565, 'Microsoft', 299.99, 30, 3);

INSERT INTO consolas (nombre_consola, frecuencia_cpu, frecuencia_gpu, compania, precio, unidades_disponibles, generacion)
VALUES
    ('Nintendo Switch', 1.02, 0.92, 'Nintendo', 299.99, 50, 2),
    ('Nintendo Switch Lite', 1.02, 0.92, 'Nintendo', 199.99, 40, 2);

INSERT INTO consolas (nombre_consola, frecuencia_cpu, frecuencia_gpu, compania, precio, unidades_disponibles, generacion)
VALUES
    ('PS4', 1.6, 1.84, 'Sony', 399.99, 20, 1),
    ('Xbox One', 1.75, 1.31, 'Microsoft', 349.99, 25, 1);


INSERT INTO juegos (nombre_juego, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola, generacion)
VALUES
    -- Juegos para Xbox Series X
    ('Halo Infinite', '343 Industries', 'Disparos', 87, 49.99, 25, 3, 3),
    ('Forza Horizon 5', 'Playground Games', 'Conducción', 92, 59.99, 30, 3, 3),
    ('Fable', 'Playground Games', 'Aventura', 0, 69.99, 20, 3, 3),
    ('Sea of Thieves', 'Rare', 'Aventura', 0, 39.99, 50, 3, 3),
    ('God of War: Ragnarok', 'Santa Monica Studio', 'Acción', 0, 69.99, 20, 1, 3),
    ('Gran Turismo 7', 'Polyphony Digital', 'Conducción', 0, 59.99, 35, 1, 3),
    ('Horizon Forbidden West', 'Guerrilla Games', 'Aventura', 0, 69.99, 30, 1, 3),
    ('Ratchet & Clank: Rift Apart', 'Insomniac Games', 'Plataformas', 0, 59.99, 40, 1, 3);

INSERT INTO juegos (nombre_juego, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola, generacion)
VALUES
    ('The Legend of Zelda: Breath of the Wild', 'Nintendo', 'Aventura', 97, 59.99, 30, 7, 2),
    ('Super Mario Odyssey', 'Nintendo', 'Plataformas', 97, 59.99, 30, 7, 2),
    ('Animal Crossing: New Horizons', 'Nintendo', 'Simulación', 90, 49.99, 45, 7, 2),
    ('Ghost of Tsushima', 'Sucker Punch Productions', 'Aventura', 0, 49.99, 35, 1, 2),
    ('Pokémon Sword and Shield', 'Game Freak', 'RPG', 80, 49.99, 40, 8, 2),
    ('Luigi''s Mansion 3', 'Nintendo', 'Aventura', 86, 39.99, 30, 8, 2),
    ('Hollow Knight', 'Team Cherry', 'Acción-Aventura', 90, 14.99, 50, 8, 2),
    ('Splatoon 2', 'Nintendo', 'Disparos', 83, 39.99, 40, 7, 2);

INSERT INTO juegos (nombre_juego, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola, generacion)
VALUES
    ('Red Dead Redemption 2', 'Rockstar Games', 'Acción-Aventura', 97, 49.99, 25, 2, 1),
    ('Gears 5', 'The Coalition', 'Disparos', 84, 39.99, 35, 3, 1),
    ('Forza Horizon 4', 'Playground Games', 'Conducción', 92, 44.99, 30, 3, 1),
    ('Ratchet & Clank: Rift Apart', 'Insomniac Games', 'Plataformas', 0, 59.99, 40, 1, 1),
    ('The Last of Us Part II', 'Naughty Dog', 'Aventura', 94, 59.99, 30, 1, 1),
    ('Spider-Man', 'Insomniac Games', 'Aventura', 87, 39.99, 40, 1, 1),
    ('Bloodborne', 'FromSoftware', 'Acción', 92, 29.99, 25, 1, 1),
    ('Forza Horizon 5', 'Playground Games', 'Conducción', 92, 59.99, 30, 3, 1);

INSERT INTO usuarios (nombre_usuario, contrasena, es_administrador)
VALUES
    ('anibal', 'nico', 1),
    ('nico', 'nico', 0),
    ('alejandro', 'nico', 0);







