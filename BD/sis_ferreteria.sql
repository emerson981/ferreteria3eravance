-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-09-2022 a las 18:45:30
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sis_ferreteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`) VALUES
(8, 'fierros', '2022-09-22 20:37:30'),
(9, 'material de construccion', '2022-09-22 20:37:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `documento` int(11) NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `compras` int(11) NOT NULL,
  `ultima_compra` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `documento`, `email`, `telefono`, `direccion`, `fecha_nacimiento`, `compras`, `ultima_compra`, `fecha`) VALUES
(15, 'emerson', 787788778, 'eeeeee@eeeee.com', '(999) 898-9898', 'av jdjshjd', '2000-11-11', 4, '2022-09-22 15:44:30', '2022-09-22 20:44:30'),
(16, 'walter', 2147483647, 'eeeeee@eeeee.com', '(447) 778-7787', 'av jdjshjdeeee', '2015-05-05', 22, '2022-09-22 23:06:54', '2022-09-23 04:06:54'),
(17, 'anderson', 87787787, 'aaaaaaaaaaa@gmail.com', '(888) 888-8888', 'av jdjshjd', '2022-09-22', 8, '2022-09-22 17:32:52', '2022-09-22 22:32:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `ventas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_categoria`, `codigo`, `descripcion`, `imagen`, `stock`, `precio_compra`, `precio_venta`, `ventas`, `fecha`) VALUES
(61, 8, '01', 'fierros', 'vistas/img/productos/01/493.png', 10, 20, 28, 24, '2022-09-28 13:25:33'),
(62, 9, '02', 'cemento', 'vistas/img/productos/02/400.jpg', 30, 25, 26.25, 10, '2022-09-28 13:05:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
(61, 'emerson', 'emerson', '$2a$07$asxx54ahjppf45sd87a5auTplqRP/VeE4vAyOF7Iye91a/QkNCaqa', 'Administrador', '', 1, '2022-09-30 10:12:21', '2022-09-30 15:12:21'),
(62, 'emerson sanchez', 'emerson1234', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'Administrador', '', 1, '2022-09-12 20:30:20', '2022-09-28 04:35:08'),
(65, 'javier', 'javier', '$2a$07$asxx54ahjppf45sd87a5auNGiMUhuUlqQq8VydYmBpTcUEAvNN2Fe', 'Vendedor', '', 1, '2022-09-28 08:29:08', '2022-09-28 13:29:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `productos` text COLLATE utf8_spanish_ci NOT NULL,
  `impuesto` float NOT NULL,
  `neto` float NOT NULL,
  `total` float NOT NULL,
  `metodo_pago` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `codigo`, `id_cliente`, `id_vendedor`, `productos`, `impuesto`, `neto`, `total`, `metodo_pago`, `fecha`) VALUES
(40, 10001, 15, 61, '[{\"id\":\"61\",\"descripcion\":\"fierros\",\"cantidad\":\"4\",\"stock\":\"10\",\"precio\":\"28\",\"total\":\"112\"}]', 16.8, 112, 128.8, 'Efectivo', '2022-09-22 20:44:30'),
(41, 10002, 16, 61, '[{\"id\":\"61\",\"descripcion\":\"fierros\",\"cantidad\":\"5\",\"stock\":\"5\",\"precio\":\"28\",\"total\":\"140\"}]', 16.8, 140, 156.8, 'Efectivo', '2022-09-22 20:55:54'),
(42, 10003, 16, 61, '[{\"id\":\"62\",\"descripcion\":\"cemento\",\"cantidad\":\"8\",\"stock\":\"2\",\"precio\":\"26.25\",\"total\":\"210\"},{\"id\":\"61\",\"descripcion\":\"fierros\",\"cantidad\":\"5\",\"stock\":\"0\",\"precio\":\"28\",\"total\":\"140\"}]', 17.5, 350, 367.5, 'Efectivo', '2022-09-22 21:33:46'),
(43, 10004, 17, 61, '[{\"id\":\"62\",\"descripcion\":\"cemento\",\"cantidad\":\"1\",\"stock\":\"1\",\"precio\":\"26.25\",\"total\":\"26.25\"},{\"id\":\"61\",\"descripcion\":\"fierros\",\"cantidad\":\"7\",\"stock\":\"3\",\"precio\":\"28\",\"total\":\"196\"}]', 40.005, 222.25, 262.255, 'Efectivo', '2022-09-22 22:32:52'),
(44, 10005, 16, 61, '[{\"id\":\"62\",\"descripcion\":\"cemento\",\"cantidad\":\"1\",\"stock\":\"0\",\"precio\":\"26.25\",\"total\":\"26.25\"},{\"id\":\"61\",\"descripcion\":\"fierros\",\"cantidad\":\"3\",\"stock\":\"0\",\"precio\":\"28\",\"total\":\"84\"}]', 19.845, 110.25, 130.095, 'Efectivo', '2022-09-23 04:06:54');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
