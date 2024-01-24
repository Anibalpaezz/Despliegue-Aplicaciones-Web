DROP DATABASE IF EXISTS tienda_juegos;
CREATE DATABASE IF NOT EXISTS tienda_juegos;

USE tienda_juegos;

CREATE TABLE consolas (
    id_consola INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    frecuencia_cpu FLOAT,
    frecuencia_gpu FLOAT,
    compania VARCHAR(50),
    precio DECIMAL(10, 2),
    unidades_disponibles INT,
    generacion INT
)engine=InnoDB;

CREATE TABLE juegos (
    id_juego INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    compania_desarrolladora VARCHAR(50),
    genero VARCHAR(50),
    puntuacion_metacritic INT,
    precio DECIMAL(10, 2),
    unidades_disponibles INT,
    id_consola INT,
    generacion INT,
    CONSTRAINT fk_id_consola FOREIGN KEY (id_consola) REFERENCES consolas(id_consola) ON DELETE CASCADE
)engine=InnoDB;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    es_administrador BOOLEAN NOT NULL
)engine=InnoDB;


INSERT INTO consolas (nombre, frecuencia_cpu, frecuencia_gpu, compania, precio, unidades_disponibles, generacion)
VALUES
    ('PS5', 3.5, 2.23, 'Sony', 499.99, 50, 3),
    ('PS5 Sin CD', 3.5, 2.23, 'Sony', 449.99, 30, 3),
    ('Xbox Series X', 3.8, 1.825, 'Microsoft', 499.99, 40, 3),
    ('Xbox Series S', 3.6, 1.565, 'Microsoft', 299.99, 30, 3);

INSERT INTO consolas (nombre, frecuencia_cpu, frecuencia_gpu, compania, precio, unidades_disponibles, generacion)
VALUES
    ('Nintendo Switch', 1.02, 0.92, 'Nintendo', 299.99, 50, 2),
    ('Nintendo Switch Lite', 1.02, 0.92, 'Nintendo', 199.99, 40, 2);

INSERT INTO consolas (nombre, frecuencia_cpu, frecuencia_gpu, compania, precio, unidades_disponibles, generacion)
VALUES
    ('PS4', 1.6, 1.84, 'Sony', 399.99, 20, 1),
    ('Xbox One', 1.75, 1.31, 'Microsoft', 349.99, 25, 1);


INSERT INTO juegos (nombre, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola, generacion)
VALUES
('The Last of Us Part II', 'Naughty Dog', 'Aventura', 93, 59.99, 200, 1, 3),
('Cyberpunk 2077', 'CD Projekt', 'Acción/RPG', 87, 49.99, 150, 2, 3),
('Assassin''s Creed Valhalla', 'Ubisoft', 'Acción/Aventura', 82, 54.99, 180, 1, 3),
('FIFA 22', 'EA Sports', 'Deportes', 81, 44.99, 250, 3, 3),
('Spider-Man: Miles Morales', 'Insomniac Games', 'Acción/Aventura', 87, 49.99, 180, 1, 3),
('Call of Duty: Black Ops Cold War', 'Treyarch', 'Disparos', 84, 59.99, 200, 2, 3),
('Watch Dogs: Legion', 'Ubisoft', 'Acción/Aventura', 76, 39.99, 120, 1, 3),
('NBA 2K22', '2K Sports', 'Deportes', 80, 54.99, 150, 2, 3),
('Demon''s Souls', 'Bluepoint Games', 'Acción/RPG', 92, 69.99, 120, 1, 3),
('Resident Evil Village', 'Capcom', 'Horror de supervivencia', 85, 59.99, 100, 3, 3);

INSERT INTO juegos (nombre, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola, generacion)
VALUES
('Red Dead Redemption 2', 'Rockstar Games', 'Acción/Aventura', 97, 69.99, 150, 1, 2),
('The Legend of Zelda: Breath of the Wild', 'Nintendo', 'Aventura', 96, 59.99, 200, 4, 2),
('God of War', 'Santa Monica Studio', 'Acción', 94, 49.99, 180, 1, 2),
('Fortnite', 'Epic Games', 'Battle Royale', 78, 0.00, 500, 5, 2),
('Overwatch', 'Blizzard Entertainment', 'Disparos', 89, 39.99, 120, 6, 2),
('Minecraft', 'Mojang', 'Sandbox', 93, 29.99, 250, 7, 2),
('Destiny 2', 'Bungie', 'Disparos', 86, 44.99, 180, 6, 2),
('Pokémon: Let''s Go, Pikachu!', 'Game Freak', 'RPG', 81, 49.99, 150, 4, 2),
('FIFA 21', 'EA Sports', 'Deportes', 82, 54.99, 200, 3, 2),
('Super Smash Bros. Ultimate', 'Nintendo', 'Lucha', 93, 59.99, 120, 4, 2);

INSERT INTO juegos (nombre, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola, generacion)
VALUES
('Super Mario Odyssey', 'Nintendo', 'Plataformas', 97, 59.99, 180, 4, 1),
('The Witcher 3: Wild Hunt', 'CD Projekt', 'RPG', 92, 49.99, 150, 1, 1),
('Uncharted 4: A Thief''s End', 'Naughty Dog', 'Acción/Aventura', 93, 54.99, 200, 2, 1),
('Halo 5: Guardians', '343 Industries', 'Disparos', 84, 39.99, 120, 6, 1),
('Bloodborne', 'FromSoftware', 'Acción/RPG', 92, 44.99, 150, 1, 1),
('Grand Theft Auto V', 'Rockstar Games', 'Acción', 96, 69.99, 250, 3, 1),
('The Legend of Zelda: Twilight Princess', 'Nintendo', 'Aventura', 95, 49.99, 180, 4, 1),
('Mass Effect 2', 'BioWare', 'RPG', 94, 59.99, 200, 2, 1),
('Fallout 4', 'Bethesda Game Studios', 'RPG', 88, 54.99, 180, 1, 1),
('Super Smash Bros. Brawl', 'Nintendo', 'Lucha', 93, 39.99, 120, 4, 1),
('Mass Effect 2', 'BioWare', 'RPG', 94, 59.99, 200, 8, 1),
('Fallout 4', 'Bethesda Game Studios', 'RPG', 88, 54.99, 180, 8, 1),
('Super Smash Bros. Brawl', 'Nintendo', 'Lucha', 93, 39.99, 120, 8, 1);

INSERT INTO usuarios (nombre_usuario, contrasena, es_administrador)
VALUES
    ('anibal', 'nico', 1),
    ('nico', 'nico', 0),
    ('alejandro', 'nico', 0);

UPDATE juegos SET unidades_disponibles = 5 WHERE unidades_disponibles != 5;
UPDATE consolas SET unidades_disponibles = 5 WHERE unidades_disponibles != 5;

delete table consolas;
delete table juegos;








