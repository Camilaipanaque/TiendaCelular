-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2026 a las 18:32:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendacelular`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `celulares`
--

CREATE TABLE `celulares` (
  `id` int(11) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ram` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `celulares`
--

INSERT INTO `celulares` (`id`, `marca`, `modelo`, `precio`, `nombre`, `ram`) VALUES
(1, 'Samsung', 'Galaxy A15', 649.00, 'Samsung Galaxy A15 128GB', '4GB'),
(2, 'Samsung', 'Galaxy A25', 999.00, 'Samsung Galaxy A25 5G', '6GB'),
(3, 'Samsung', 'Galaxy S24', 3299.00, 'Samsung Galaxy S24', '8GB'),
(4, 'Xiaomi', 'Redmi Note 13', 799.00, 'Redmi Note 13', '6GB'),
(5, 'Xiaomi', 'Redmi 13C', 499.00, 'Redmi 13C', '4GB'),
(6, 'Xiaomi', 'Poco X6', 1199.00, 'Poco X6 5G', '8GB'),
(7, 'Motorola', 'Moto G54', 799.00, 'Motorola Moto G54', '8GB'),
(8, 'Motorola', 'Moto G84', 1099.00, 'Motorola Moto G84', '8GB'),
(9, 'Apple', 'iPhone 13', 2199.00, 'Apple iPhone 13', '4GB'),
(10, 'Apple', 'iPhone 14', 2799.00, 'Apple iPhone 14', '6GB'),
(11, 'Apple', 'iPhone 15', 3499.00, 'Apple iPhone 15', '6GB'),
(12, 'Honor', 'X8b', 999.00, 'Honor X8b', '8GB'),
(13, 'Honor', 'X7b', 699.00, 'Honor X7b', '8GB'),
(14, 'Huawei', 'Nova 11', 1599.00, 'Huawei Nova 11', '8GB'),
(15, 'Huawei', 'P60 Pro', 3499.00, 'Huawei P60 Pro', '8GB'),
(16, 'Oppo', 'Reno 11', 1699.00, 'Oppo Reno 11', '8GB'),
(17, 'Oppo', 'A58', 649.00, 'Oppo A58', '6GB'),
(18, 'Vivo', 'Y36', 799.00, 'Vivo Y36', '8GB'),
(19, 'Realme', 'C67', 699.00, 'Realme C67', '8GB'),
(20, 'Infinix', 'Note 30', 749.00, 'Infinix Note 30', '8GB');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `celulares`
--
ALTER TABLE `celulares`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `celulares`
--
ALTER TABLE `celulares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
