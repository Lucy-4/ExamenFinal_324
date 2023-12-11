-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2023 a las 08:39:04
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `academico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `id` int(11) NOT NULL,
  `id_pago` int(11) DEFAULT NULL,
  `ruta_comprobante` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `materia` varchar(50) NOT NULL,
  `horario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id`, `nombre`, `materia`, `horario`) VALUES
(1, 'LA', 'Estadistica', 'Martes - lunes'),
(2, 'José Martínez', 'Sistemas Contables', 'Jueves 13:00-15:00'),
(3, 'Ana Fernández', 'Inglés', 'Lunes 14:00-16:00'),
(4, 'Miguel González', 'Cálculo I', 'Miércoles 11:00-13:0'),
(5, 'Elena Ramírez', 'Auditoría', 'Viernes 15:00-17:00'),
(6, 'Javier Torres', 'Física', 'Martes 14:00-16:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `pago_aceptado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `usuario`, `monto`, `fecha`, `pago_aceptado`) VALUES
(20, '', 1998.00, '2023-12-09 22:29:09', 1),
(21, '', 1008.00, '2023-12-10 00:53:28', 1),
(22, '', 1008.00, '2023-12-10 00:58:57', 1),
(23, '', 1008.00, '2023-12-10 01:03:01', 1),
(24, '', 1008.00, '2023-12-10 01:13:21', 1),
(25, 'luis', 515.00, '2023-12-10 01:46:11', 1),
(26, 'gabriel', 1998.00, '2023-12-10 02:55:21', 1),
(27, 'maria', 515.00, '2023-12-10 03:09:03', 1),
(28, 'maria', 1998.00, '2023-12-10 03:10:36', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_administrativo_melissa`
--

CREATE TABLE `personal_administrativo_melissa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal_administrativo_melissa`
--

INSERT INTO `personal_administrativo_melissa` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `cargo`, `correo`) VALUES
(1, 'Juan', 'Gómez', 'López', 'Secretario', 'juan.gomez@melissa.com'),
(2, 'María', 'Martínez', 'Ramírez', 'Asistente Administrativo', 'maria.martinez@melissa.com'),
(3, 'Carlos', 'Pérez', 'García', 'Encargado de Recursos Humanos', 'carlos.perez@melissa.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido_paterno` varchar(50) DEFAULT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `tipo_graduacion` enum('UCB','Informatica','Excelencia') NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `tipo_graduacion`, `correo`, `contrasena`) VALUES
(1, 'Maria', 'Gutierrez', 'Ramos', 'Excelencia', 'mgr@umsa.bo', '123456'),
(2, 'Luis', 'Chavez', 'Fernandez', 'Informatica', 'lcf@umsa.bo', '123456'),
(3, 'Elena', 'Hernandez', 'Martinez', 'UCB', 'ehm@ucb.bo', '123456'),
(4, 'Diego', 'Garcia', 'Alvarez', 'UCB', 'dga@ucb.bo', '123456'),
(5, 'Laura', 'Rodriguez', 'Herrera', 'Excelencia', 'lrh@umsa.bo', '123456'),
(6, 'Gabriel', 'Moreno', 'Soto', 'Informatica', 'gms@umsa.bo', '123456'),
(7, 'Paula', 'Torres', 'Perez', 'UCB', 'ptp@ucb.bo', '123456'),
(8, 'Javier', 'Diaz', 'Luna', 'Excelencia', 'jdl@umsa.bo', '123456'),
(9, 'Isabel', 'Fuentes', 'Orozco', 'UCB', 'ifo@ucb.bo', '123456'),
(10, 'Ricardo', 'Ramirez', 'Fernandez', 'Informatica', 'rrf@umsa.bo', '123456'),
(11, 'Fernanda', 'Mendoza', 'Vargas', 'Excelencia', 'fmv@umsa.bo', '123456'),
(12, 'Alejandro', 'Santos', 'Rojas', 'UCB', 'asr@ucb.bo', '123456'),
(13, 'Camila', 'Gomez', 'Lopez', 'UCB', 'cgl@ucb.bo', '123456'),
(14, 'Miguel', 'Fernandez', 'Silva', 'Informatica', 'mfs@umsa.bo', '123456'),
(15, 'Sofia', 'Castro', 'Gonzalez', 'Excelencia', 'scg@umsa.bo', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pago` (`id_pago`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_administrativo_melissa`
--
ALTER TABLE `personal_administrativo_melissa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `personal_administrativo_melissa`
--
ALTER TABLE `personal_administrativo_melissa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD CONSTRAINT `comprobantes_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
