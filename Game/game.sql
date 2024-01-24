-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-01-2024 a las 23:33:27
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `game`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consolas`
--

CREATE TABLE `consolas` (
  `nombre` varchar(50) NOT NULL,
  `cpu` varchar(50) NOT NULL,
  `gpu` varchar(50) NOT NULL,
  `compania` varchar(50) NOT NULL,
  `precio` varchar(50) NOT NULL,
  `stock` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `consolas`
--

INSERT INTO `consolas` (`nombre`, `cpu`, `gpu`, `compania`, `precio`, `stock`) VALUES
('Nintendo Switch', 'ñizen 1 pro', 'nvidia 1', 'Nintendo', '800€', 0),
('Nintendo Switch Lite', 'ñizen 1', 'nvidia 1', 'Nintendo', '500€', 60),
('PS4', 'ryzen 4', 'nvidia 4', 'SONY', '300€', 100),
('PS5 con CD', 'cpu 5', 'ryzen 5', 'MICROSOFT', '400€', 20),
('PS5 sin CD', 'ryzen 5', 'nvidia 5', 'SONY', '350€', 15),
('Xbox One', 'ryzen 3', 'nvidia 3', 'Microsoft', '200€', 10),
('Xbox Series S', 'ryzen 7', 'nvidia 7', 'Microsoft', '250€', 25),
('Xbox Series X', 'ryzen 7 pro', 'nvidia 7', 'Microsoft', '450€', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `nombre` varchar(50) NOT NULL,
  `consola` varchar(50) DEFAULT NULL,
  `compañia` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `puntuacion` varchar(50) DEFAULT NULL,
  `precio` varchar(50) DEFAULT NULL,
  `stock` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`nombre`, `consola`, `compañia`, `genero`, `puntuacion`, `precio`, `stock`) VALUES
('Ancient Empire Chronicles', 'PS4', 'Historical Games Inc.', 'Estrategia', '85', '49.99', 80),
('Animal Crossing', 'Nintendo Switch', 'Nintendo', 'RPG Lineal', '7.5/10', '55€', 19),
('Apex Legends of Valor', 'PS5 sin CD', 'Apex Studios', 'Shooter', '96', '69.99', 120),
('Apex Legends of Valor X', 'Xbox Series X', 'Apex Studios', 'Shooter', '96', '69.99', 120),
('Apocalyptic Survival', 'PS4', 'Dystopian Games', 'Simulación', '86', '44.99', 130),
('Arcane Spellcaster Academy', 'PS5 con CD', 'Enchanted Realms', 'Magia', '86', '59.99', 100),
('Call Of Duty BO3', 'Xbox One', 'Activision', 'FPS', '11/10', '35€', 4),
('Call Of Duty BO4', 'Xbox Series S', 'Activision', 'FPS', '5/10', '60€', 20),
('Cybernetic Assault', 'PS4', 'Tech Titans', 'Shooter', '90', '59.99', 120),
('Cybernetic Augmented Reality', 'PS5 con CD', 'Cyber Games', 'Simulación', '93', '79.99', 60),
('Cyberpunk Battlefront', 'Xbox One', 'Tech Titans', 'Shooter', '86', '59.99', 120),
('Epic Adventure Quest', 'Nintendo Switch', 'Gaming Studios', 'Aventura', '88', '49.99', 150),
('Epic Quest: Chronicles of Destiny', 'Xbox One', 'Adventure Studios', 'Aventura', '88', '49.99', 90),
('Epic Space Odyssey', 'PS5 sin CD', 'Galactic Adventures', 'Exploración', '92', '79.99', 100),
('Epic Space Odyssey X', 'Xbox Series X', 'Galactic Adventures', 'Exploración', '94', '79.99', 100),
('Fantasy Kingdom Builder', 'PS5 sin CD', 'Mythical Realms', 'Simulación', '91', '74.99', 80),
('Fantasy Kingdom Builder X', 'Xbox Series X', 'Mythical Realms', 'Simulación', '91', '74.99', 80),
('Fantasy Life Online', 'Nintendo Switch Lite', 'Roleplay Realms', 'RPG', '87', '54.99', 120),
('Fantasy Quest Heroes', 'PS4', 'Mythical Adventures', 'RPG', '93', '69.99', 120),
('Future Warfare Elite', 'PS5 con CD', 'Futuristic Games Inc.', 'Shooter', '94', '69.99', 100),
('Galactic Space Explorer', 'Nintendo Switch', 'Cosmic Creations', 'Exploración', '85', '44.99', 80),
('Galactic Strategy Command', 'PS5 con CD', 'Star Dynamics', 'Estrategia', '87', '54.99', 110),
('Ghostly Mansion Escape', 'Nintendo Switch Lite', 'Spooky Entertainment', 'Aventura', '89', '49.99', 70),
('Gravity Defying Racers', 'PS5 con CD', 'Anti-Gravity Games', 'Carreras', '88', '49.99', 80),
('GTA 6', 'Xbox Series X', 'Rockstar', 'Mundo Abierto', '10/10', '120€', 0),
('Interstellar Explorer VR', 'PS5 con CD', 'Cosmic VR Adventures', 'Exploración', '92', '79.99', 80),
('Jungle Survival Challenge', 'Nintendo Switch', 'Adventure Studios', 'Simulación', '78', '29.99', 130),
('Magic Academy: Spellbound', 'Nintendo Switch', 'Enchanted Games', 'RPG', '89', '49.99', 100),
('Martial Arts Showdown', 'PS5 con CD', 'Combat Masters', 'Lucha', '91', '69.99', 70),
('Mech Warfare Mayhem', 'Nintendo Switch Lite', 'Metal Mayhem Games', 'Acción', '85', '59.99', 90),
('Mechanical Mayhem Wars', 'PS5 sin CD', 'Metal Warriors', 'Estrategia', '88', '49.99', 110),
('Mechanical Mayhem Wars X', 'Xbox Series X', 'Metal Warriors', 'Estrategia', '88', '49.99', 110),
('Mystic Detective Agency', 'PS4', 'Investigation Studios', 'Aventura', '91', '64.99', 110),
('Mystic Kingdom Builders: Sandbox Adventure', 'Xbox Series S', 'Enchanted Realms', 'Simulación', '90', '59.99', 110),
('Mystic Kingdom Defenders', 'Nintendo Switch', 'Fantasy Games', 'Estrategia', '90', '59.99', 100),
('Mystic Quest of Legends', 'PS5 sin CD', 'Legendary Games', 'Aventura', '93', '79.99', 60),
('Mystic Quest of Legends X', 'Xbox Series X', 'Legendary Games', 'Aventura', '93', '79.99', 60),
('Mystic Realm Quest', 'Xbox One', 'Enchanted Realms', 'RPG', '92', '64.99', 100),
('Mystical Puzzle Quest', 'Nintendo Switch Lite', 'Mind Bending Studios', 'Puzzle', '92', '44.99', 80),
('Ninja Clash: Shadow Warriors', 'Nintendo Switch', 'Stealth Entertainment', 'Acción', '87', '54.99', 110),
('Pixel Art Party', 'Nintendo Switch Lite', 'Creative Minds', 'Fiesta', '88', '44.99', 100),
('Pixel Art Puzzle Paradise', 'PS5 sin CD', 'Creative Puzzles', 'Puzzle', '89', '59.99', 100),
('Pixel Art Puzzle Paradise 2: Colorful Challenges', 'Xbox Series S', 'Creative Puzzles', 'Puzzle', '92', '44.99', 90),
('Pixel Art Puzzle Paradise X', 'Xbox Series X', 'Creative Puzzles', 'Puzzle', '89', '59.99', 100),
('Pixel Puzzle Paradise', 'Xbox One', 'Puzzle Creations', 'Puzzle', '91', '44.99', 90),
('Pixel Puzzle Party: Retro Brain Teasers', 'Xbox Series S', 'Puzzle Creations', 'Puzzle', '91', '64.99', 100),
('Pixel Racing Madness', 'Nintendo Switch', 'Tech Innovators', 'Carreras', '82', '39.99', 120),
('Pixel Sports All-Stars', 'Xbox One', 'Retro Athletics', 'Deportes', '89', '54.99', 130),
('Pixel Sports Champions: Mini Edition', 'Xbox Series S', 'Retro Athletics', 'Deportes', '85', '44.99', 100),
('Pixel Sports Superstars', 'PS5 con CD', 'Retro Athletics', 'Deportes', '85', '44.99', 120),
('Pocket Monster Safari', 'Nintendo Switch Lite', 'Creature Studios', 'Simulación', '88', '49.99', 90),
('Puzzle Quest: Mind Benders', 'Nintendo Switch', 'Brain Teasers Inc.', 'Puzzle', '91', '39.99', 70),
('Quantum Velocity: Warp Zone', 'Xbox Series S', 'Speedster Games', 'Carreras', '88', '49.99', 120),
('Racing Rivals Revolution', 'PS4', 'Velocity Studios', 'Carreras', '82', '39.99', 90),
('Robo Rumble Revolution: Battle Bots', 'Xbox Series S', 'Metal Warriors', 'Lucha', '86', '39.99', 80),
('Robo Smash Rumble', 'Nintendo Switch', 'Tech Dynamics', 'Lucha', '84', '49.99', 90),
('Robo Warzone Domination', 'PS4', 'Metal Warriors', 'Shooter', '89', '49.99', 70),
('Sci-Fi Strategy Commanders', 'Nintendo Switch Lite', 'Strategic Dynamics', 'Estrategia', '91', '64.99', 110),
('Spectral Souls Online', 'PS5 con CD', 'Ethereal Entertainment', 'RPG', '90', '64.99', 90),
('Speedy Racers Mini', 'Nintendo Switch Lite', 'Speedster Games', 'Carreras', '80', '34.99', 100),
('Spiderman PS4', 'PS4', 'Sony', 'Accion', '10/10', '50€', 10),
('Spiderman PS5', 'PS5 con CD', 'Sony', 'Accion', '10/10', '60€', 50),
('Sports Champions Deluxe', 'PS5 sin CD', 'Athletics Deluxe', 'Deportes', '90', '54.99', 90),
('Sports Champions Deluxe X', 'Xbox Series X', 'Athletics Deluxe', 'Deportes', '90', '54.99', 90),
('Strategic Commanders: Galactic Domination', 'Xbox Series S', 'Strategic Dynamics', 'Estrategia', '87', '49.99', 70),
('Street Legends Showdown', 'PS4', 'Urban Games', 'Lucha', '88', '54.99', 100),
('Super Soccer Shootout', 'Nintendo Switch Lite', 'Goal Masters', 'Deportes', '82', '39.99', 130),
('Super Sports Champions', 'PS4', 'Athletics Games', 'Deportes', '84', '59.99', 80),
('Super Sports Showdown', 'Nintendo Switch', 'Athletics Games', 'Deportes', '86', '59.99', 120),
('Superhero Showdown', 'PS5 sin CD', 'Heroic Games', 'Lucha', '87', '59.99', 70),
('Superhero Showdown X', 'Xbox Series X', 'Heroic Games', 'Lucha', '87', '59.99', 70),
('Superhero Showdown: Infinity Clash', 'Xbox One', 'Heroic Entertainment', 'Lucha', '87', '44.99', 80),
('Survival Apocalypse: Outbreak', 'Xbox One', 'Dystopian Games', 'Survival', '88', '39.99', 120),
('Survival Challenge: Last Stand', 'Xbox Series S', 'Survival Studios', 'Survival', '89', '54.99', 130),
('Tech Warfare Arena: Cyber Siege', 'Xbox Series S', 'Tech Titans', 'Shooter', '87', '54.99', 90),
('Time Bender Chronicles', 'PS5 con CD', 'Temporal Studios', 'Aventura', '89', '59.99', 120),
('Time Traveler\s Dilemma', 'PS5 sin CD', 'Chrono Games', 'RPG', '94', '64.99', 80),
('Time Travelers Dilemma X', 'Xbox Series X', 'Chrono Games', 'RPG', '94', '64.99', 80),
('Tiny World Explorers', 'Nintendo Switch Lite', 'Micro Adventure Games', 'Aventura', '85', '39.99', 110),
('Velocity Racer: Turbocharged', 'Xbox One', 'Speedster Games', 'Carreras', '84', '39.99', 100),
('Virtual Reality Explorer', 'Xbox One', 'VR Innovations', 'Simulación', '85', '49.99', 70),
('Virtual Reality Odyssey', 'PS4', 'VR Innovations', 'Aventura', '87', '54.99', 100),
('Virtual Reality Racing Championship: Turbocharged', 'Xbox Series S', 'VR Velocity', 'Carreras', '88', '39.99', 120),
('Virtual Reality Racing Revolution', 'PS5 sin CD', 'VR Velocity', 'Carreras', '86', '44.99', 120),
('Virtual Reality Racing Revolution X', 'Xbox Series X', 'VR Velocity', 'Carreras', '86', '44.99', 120),
('Warzone Tactics: Strategic Command', 'Xbox One', 'Warfare Innovations', 'Estrategia', '90', '54.99', 110);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` tinyint(4) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `rol` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `password`, `rol`) VALUES
(1, 'pablo', 'pablo', 'admin'),
(2, 'bea', 'bea', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consolas`
--
ALTER TABLE `consolas`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `consola` (`consola`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`consola`) REFERENCES `consolas` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
