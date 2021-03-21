-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-09-2019 a las 18:54:07
-- Versión del servidor: 5.7.27-0ubuntu0.18.04.1
-- Versión de PHP: 5.6.40-12+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_tiendapos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_caja` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `monto_inicial` decimal(10,2) DEFAULT NULL,
  `fecha_apertura` date NOT NULL,
  `feregistro_apertura` timestamp NULL DEFAULT NULL,
  `fecha_cierre` date NOT NULL,
  `feregistro_cierre` timestamp NULL DEFAULT NULL,
  `id_moneda` int(11) DEFAULT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '	0: Activo // 1: Inactivo // 2: Aperturado // 3:Cerrado',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id_caja`, `id_usuario`, `monto_inicial`, `fecha_apertura`, `feregistro_apertura`, `fecha_cierre`, `feregistro_cierre`, `id_moneda`, `flestado`, `feregistro`) VALUES
(1, 2, '50.00', '2019-08-27', '2019-08-28 11:44:30', '2019-08-27', '2019-09-10 23:21:48', 1, 3, '2019-08-28 04:44:11'),
(2, 3, '100.00', '2019-09-10', '2019-09-10 23:06:22', '2019-09-10', '2019-09-10 23:16:12', 1, 3, '2019-09-10 22:05:44'),
(3, 2, '20.00', '2019-09-10', '2019-09-10 23:36:47', '2019-09-10', NULL, 1, 2, '2019-09-10 22:33:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `flestado`, `feregistro`) VALUES
(1, 'Lácteo', 0, '2019-08-25 06:10:53'),
(2, 'Golosina', 0, '2019-08-25 06:11:01'),
(3, 'Tecnología', 0, '2019-08-25 06:11:13'),
(4, 'Avícola', 0, '2019-08-28 06:13:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `tipo_doc` int(11) NOT NULL COMMENT '1: DNI // 2: RUC',
  `nro_doc` varchar(20) NOT NULL,
  `razon_social` varchar(240) DEFAULT NULL,
  `nombres` varchar(200) DEFAULT NULL,
  `apellido_paterno` varchar(200) DEFAULT NULL,
  `apellido_materno` varchar(200) DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL COMMENT '1: Masculino // 2: Femenino',
  `telefono1` varchar(50) DEFAULT NULL,
  `telefono2` varchar(50) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `referencia` varchar(200) DEFAULT NULL,
  `correo` varchar(240) DEFAULT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `tipo_doc`, `nro_doc`, `razon_social`, `nombres`, `apellido_paterno`, `apellido_materno`, `sexo`, `telefono1`, `telefono2`, `direccion`, `referencia`, `correo`, `flestado`, `feregistro`) VALUES
(1, 2, '10727037964', 'Bitlogy S.AC', '', '', '', 0, '', '', '', '', '', 0, '2019-08-16 11:25:22'),
(2, 1, '72703796', '', 'Pedro', 'Perez', 'Mamani', 1, '', '', '', '', '', 0, '2019-08-23 04:48:26'),
(3, 1, '54546565', '', 'Mario', 'Sánchez', 'Merino', 1, '', '', '', '', '', 0, '2019-09-10 22:54:40'),
(5, 2, '20108723654', 'Isajor Construcciones S.A.C', '', '', '', 0, '', '', '', '', '', 0, '2019-09-11 00:29:18'),
(6, 2, '20658545548', 'Comercial Martinez S.A.C', '', '', '', 0, '', '', '', '', '', 0, '2019-09-11 16:39:26'),
(7, 2, '20848484854', 'Piruwa S.A', '', '', '', 0, '', '', '', '', '', 0, '2019-09-11 19:27:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE `comprobante` (
  `id_comprobante` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `descripcion` varchar(240) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comprobante`
--

INSERT INTO `comprobante` (`id_comprobante`, `codigo`, `descripcion`, `flestado`, `feregistro`) VALUES
(1, 'BO', 'Boleta', 0, '2019-08-23 23:07:24'),
(2, 'FA', 'Factura', 0, '2019-08-24 03:42:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mediopago`
--

CREATE TABLE `mediopago` (
  `id_mediopago` int(11) NOT NULL,
  `nombre` varchar(240) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '	0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mediopago`
--

INSERT INTO `mediopago` (`id_mediopago`, `nombre`, `flestado`, `feregistro`) VALUES
(1, 'Efectivo', 0, '2019-09-05 02:47:55'),
(2, 'Crédito', 0, '2019-09-05 02:48:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `id_moneda` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `simbolo` varchar(50) NOT NULL,
  `iso` varchar(50) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id_moneda`, `nombre`, `simbolo`, `iso`, `flestado`, `feregistro`) VALUES
(1, 'Sol', 'S/', 'PEN', 0, '2019-08-24 14:18:27'),
(2, 'Dolar Americano', '$', 'USD', 0, '2019-08-25 02:36:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nombre`, `flestado`, `feregistro`) VALUES
(1, 'Administrador', 0, '2019-08-23 07:06:19'),
(2, 'Cajero', 0, '2019-08-25 08:17:03'),
(3, 'Contador', 0, '2019-08-25 08:20:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL,
  `tipo_doc` int(11) NOT NULL COMMENT '1: DNI // 2: RUC',
  `nro_doc` varchar(20) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellido_paterno` varchar(200) NOT NULL,
  `apellido_materno` varchar(200) NOT NULL,
  `sexo` int(11) NOT NULL COMMENT '1: Masculino // 2: Femenino',
  `telefono1` varchar(50) NOT NULL,
  `telefono2` varchar(50) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `referencia` varchar(200) DEFAULT NULL,
  `id_ubigeo` int(11) DEFAULT NULL,
  `ruta_foto` varchar(240) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `tipo_doc`, `nro_doc`, `nombres`, `apellido_paterno`, `apellido_materno`, `sexo`, `telefono1`, `telefono2`, `direccion`, `referencia`, `id_ubigeo`, `ruta_foto`, `flestado`, `feregistro`) VALUES
(1, 1, '72703796', 'Roy', 'Roa', 'Sánchez', 1, '917919003', '', '', '', NULL, '18f9994a729efa14a72b554b5b7ca38c.jpg', 0, '2019-08-23 07:07:14'),
(2, 1, '11223344', 'Usuario', 'Prueba', 'Bitlogy', 1, '998877665', '', '', '', NULL, '', 0, '2019-08-25 09:18:13'),
(3, 1, '99887766', 'Usuario2', 'Prueba2', 'Bitlogy', 2, '887766554', '', '', '', NULL, '', 0, '2019-08-25 09:28:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(240) NOT NULL,
  `ruta_imagen` varchar(240) NOT NULL,
  `descripcion` varchar(240) DEFAULT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_moneda` int(11) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `ruta_imagen`, `descripcion`, `cantidad`, `id_unidad`, `precio_unitario`, `id_categoria`, `id_moneda`, `flestado`, `feregistro`) VALUES
(1, 'Leche Gloria 240 mls', '', 'Leche Gloria 240 mls', '1.00', 3, '3.20', 1, 1, 0, '2019-08-25 07:33:18'),
(2, 'Milanesa de Pollo 240g', '', 'Milanesa de Pollo 240g', '1.00', 3, '2.00', 4, 1, 0, '2019-08-28 06:14:26'),
(3, 'Leche Ideal Amanecer 240 ml', '', 'Leche Ideal Amanecer 240 ml ', '1.00', 3, '2.20', 1, 1, 0, '2019-08-30 07:17:28'),
(4, 'Pollo Entero', '', 'Pollo Entero', '1.00', 1, '5.50', 4, 1, 0, '2019-09-05 04:37:29'),
(5, 'Gallina Entera', '', 'Gallina Entera', '1.00', 1, '12.50', 4, 1, 0, '2019-09-05 04:37:57'),
(6, 'Chancho Entero', '', 'Chancho Entero', '1.00', 1, '10.00', 4, 1, 0, '2019-09-05 04:38:21'),
(7, 'Hígado de Pollo', '', 'Hígado de Pollo', '1.00', 1, '5.00', 4, 1, 0, '2019-09-05 04:38:58'),
(8, 'Galleta Tentación pack', '', 'Galleta Tentación pack', '1.00', 3, '3.50', 2, 1, 0, '2019-09-08 06:34:37'),
(9, 'Galleta Oreo', '', 'Galleta Oreo', '1.00', 3, '4.00', 2, 1, 0, '2019-09-08 06:34:58'),
(10, 'USB Hyundai 3.0 16Gb', '', 'USB Hyundai 3.0 16Gb', '1.00', 3, '25.00', 3, 1, 0, '2019-09-08 06:35:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `tipo_doc` int(11) NOT NULL COMMENT '1: DNI // 2: RUC',
  `nro_doc` varchar(20) NOT NULL,
  `razon_social` varchar(240) NOT NULL,
  `telefono1` varchar(50) NOT NULL,
  `telefono2` varchar(50) DEFAULT NULL,
  `direccion` varchar(240) NOT NULL,
  `referencia` varchar(240) DEFAULT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `tipo_doc`, `nro_doc`, `razon_social`, `telefono1`, `telefono2`, `direccion`, `referencia`, `flestado`, `feregistro`) VALUES
(1, 2, '107799887743', 'Servicios Roa S.A.C3', '919191913', '3', 'Calle Infante de la Torre 2213', '3', 0, '2019-08-23 19:38:00'),
(2, 2, '20554411220', 'Carga Mudanza S.A.C', '917919003', '2', 'Calle Trovadores MZL2 LT31', '2', 0, '2019-08-23 20:34:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

CREATE TABLE `unidad` (
  `id_unidad` int(11) NOT NULL,
  `abreviatura` varchar(10) NOT NULL,
  `nombre` varchar(240) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`id_unidad`, `abreviatura`, `nombre`, `flestado`, `feregistro`) VALUES
(1, 'Kg', 'Kilogramos', 0, '2019-08-25 06:11:53'),
(2, 'Mt', 'Metros', 0, '2019-08-25 06:11:58'),
(3, 'Und', 'Unidad', 0, '2019-08-25 06:33:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_personal` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `contrasena` char(32) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_personal`, `login`, `contrasena`, `id_perfil`, `flestado`, `feregistro`) VALUES
(1, 1, '12345678', '550e1bafe077ff0b0b67f4e32f29d751', 1, 0, '2019-08-23 18:55:38'),
(2, 2, '11223344', 'd88d8b5f68df34118949998858f4d1d0', 2, 0, '2019-08-25 09:24:41'),
(3, 3, '99887766', '9ca3af320cab33677510b4a92e907a4b', 2, 0, '2019-09-10 22:04:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_cliente` int(11) NOT NULL,
  `id_mediopago` int(11) NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_moneda` int(11) NOT NULL,
  `conversion` decimal(10,2) NOT NULL,
  `efectivo` decimal(10,2) NOT NULL,
  `vuelto` decimal(10,2) NOT NULL,
  `flestado` int(11) NOT NULL COMMENT '0: Pagado // 1: Pendiente // 2: Anulado',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `feregistro_anular` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `id_caja`, `fecha`, `id_cliente`, `id_mediopago`, `id_comprobante`, `id_usuario`, `subtotal`, `descuento`, `total`, `id_moneda`, `conversion`, `efectivo`, `vuelto`, `flestado`, `feregistro`, `feregistro_anular`) VALUES
(1, 1, '2019-09-10 21:53:58', 1, 2, 1, 2, '7.70', '0.00', '7.70', 1, '0.00', '0.00', '0.00', 2, '2019-09-09 23:04:26', '2019-09-10 22:43:45'),
(2, 1, '2019-09-10 21:53:56', 1, 1, 1, 2, '9.70', '0.00', '9.70', 1, '0.00', '10.00', '0.30', 0, '2019-09-09 23:19:34', NULL),
(3, 1, '2019-09-10 21:53:53', 1, 1, 2, 2, '20.20', '0.20', '20.00', 1, '0.00', '20.00', '0.00', 2, '2019-09-09 23:27:39', '2019-09-10 22:46:16'),
(4, 1, '2019-09-10 22:11:04', 1, 1, 1, 2, '13.60', '0.00', '13.60', 1, '0.00', '14.00', '0.40', 0, '2019-09-10 21:53:39', NULL),
(5, 2, '2019-09-10 22:10:47', 2, 1, 1, 3, '18.50', '0.00', '18.50', 1, '0.00', '20.00', '1.50', 0, '2019-09-10 22:06:43', NULL),
(6, 2, '2019-09-10 22:10:52', 2, 1, 1, 3, '45.20', '0.00', '45.20', 1, '0.00', '50.00', '4.80', 0, '2019-09-10 22:07:19', NULL),
(7, 2, '2019-09-10 22:10:17', 1, 1, 1, 3, '22.50', '0.00', '22.50', 1, '0.00', '30.00', '7.50', 0, '2019-09-10 22:10:17', NULL),
(8, 2, '2019-09-10 22:18:06', 2, 2, 1, 3, '4.20', '0.00', '4.20', 1, '0.00', '0.00', '0.00', 1, '2019-09-10 22:12:25', NULL),
(9, 1, '2019-09-10 22:21:07', 1, 2, 1, 2, '5.50', '0.00', '5.50', 1, '0.00', '0.00', '0.00', 1, '2019-09-10 22:21:07', NULL),
(10, 3, '2019-09-10 22:37:39', 1, 1, 1, 2, '8.50', '0.00', '8.50', 1, '0.00', '10.00', '1.50', 0, '2019-09-10 22:37:39', NULL),
(11, 3, '2019-09-11 17:18:26', 6, 1, 1, 2, '8.40', '0.00', '8.40', 1, '0.00', '8.50', '0.10', 0, '2019-09-11 17:18:26', NULL),
(12, 3, '2019-09-11 19:27:39', 7, 1, 1, 2, '5.50', '0.00', '5.50', 1, '0.00', '10.00', '4.50', 0, '2019-09-11 19:27:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventadetalle`
--

CREATE TABLE `ventadetalle` (
  `id_ventadetalle` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventadetalle`
--

INSERT INTO `ventadetalle` (`id_ventadetalle`, `id_venta`, `item`, `id_producto`, `id_unidad`, `cantidad`, `precio`, `total`, `flestado`, `feregistro`) VALUES
(1, 1, 0, 4, 1, '1.00', '5.50', '5.50', 0, '2019-09-09 23:04:26'),
(2, 1, 1, 3, 3, '1.00', '2.20', '2.20', 0, '2019-09-09 23:04:26'),
(3, 2, 0, 4, 1, '1.00', '5.50', '5.50', 0, '2019-09-09 23:19:34'),
(4, 2, 1, 3, 3, '1.00', '2.20', '2.20', 0, '2019-09-09 23:19:34'),
(5, 2, 2, 2, 3, '1.00', '2.00', '2.00', 0, '2019-09-09 23:19:34'),
(6, 3, 0, 1, 3, '1.00', '3.20', '3.20', 0, '2019-09-09 23:27:40'),
(7, 3, 1, 2, 3, '1.00', '2.00', '2.00', 0, '2019-09-09 23:27:40'),
(8, 3, 2, 6, 1, '1.00', '10.00', '10.00', 0, '2019-09-09 23:27:40'),
(9, 3, 3, 7, 1, '1.00', '5.00', '5.00', 0, '2019-09-09 23:27:40'),
(10, 4, 0, 2, 3, '2.00', '2.00', '4.00', 0, '2019-09-10 21:53:41'),
(11, 4, 1, 1, 3, '3.00', '3.20', '9.60', 0, '2019-09-10 21:53:41'),
(12, 5, 0, 7, 1, '1.00', '5.00', '5.00', 0, '2019-09-10 22:06:43'),
(13, 5, 1, 8, 3, '1.00', '3.50', '3.50', 0, '2019-09-10 22:06:43'),
(14, 5, 2, 6, 1, '1.00', '10.00', '10.00', 0, '2019-09-10 22:06:43'),
(15, 6, 0, 1, 3, '1.00', '3.20', '3.20', 0, '2019-09-10 22:07:19'),
(16, 6, 1, 2, 3, '1.00', '2.00', '2.00', 0, '2019-09-10 22:07:19'),
(17, 6, 2, 6, 1, '1.00', '10.00', '10.00', 0, '2019-09-10 22:07:19'),
(18, 6, 3, 7, 1, '1.00', '5.00', '5.00', 0, '2019-09-10 22:07:19'),
(19, 6, 4, 10, 3, '1.00', '25.00', '25.00', 0, '2019-09-10 22:07:19'),
(20, 7, 0, 6, 1, '1.00', '10.00', '10.00', 0, '2019-09-10 22:10:17'),
(21, 7, 1, 5, 1, '1.00', '12.50', '12.50', 0, '2019-09-10 22:10:17'),
(22, 8, 0, 2, 3, '1.00', '2.00', '2.00', 0, '2019-09-10 22:12:25'),
(23, 8, 1, 3, 3, '1.00', '2.20', '2.20', 0, '2019-09-10 22:12:25'),
(24, 9, 0, 4, 1, '1.00', '5.50', '5.50', 0, '2019-09-10 22:21:08'),
(25, 10, 0, 8, 3, '1.00', '3.50', '3.50', 0, '2019-09-10 22:37:39'),
(26, 10, 1, 7, 1, '1.00', '5.00', '5.00', 0, '2019-09-10 22:37:39'),
(27, 11, 0, 2, 3, '2.00', '2.00', '4.00', 0, '2019-09-11 17:18:27'),
(28, 11, 1, 3, 3, '2.00', '2.20', '4.40', 0, '2019-09-11 17:18:27'),
(29, 12, 0, 4, 1, '1.00', '5.50', '5.50', 0, '2019-09-11 19:27:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_caja`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`) USING BTREE;

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`id_comprobante`);

--
-- Indices de la tabla `mediopago`
--
ALTER TABLE `mediopago`
  ADD PRIMARY KEY (`id_mediopago`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`id_moneda`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_personal`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`);

--
-- Indices de la tabla `ventadetalle`
--
ALTER TABLE `ventadetalle`
  ADD PRIMARY KEY (`id_ventadetalle`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `id_comprobante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `mediopago`
--
ALTER TABLE `mediopago`
  MODIFY `id_mediopago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id_moneda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `unidad`
--
ALTER TABLE `unidad`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `ventadetalle`
--
ALTER TABLE `ventadetalle`
  MODIFY `id_ventadetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
