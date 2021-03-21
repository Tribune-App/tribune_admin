-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-09-2019 a las 10:39:18
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
(1, 2, '50.00', '2019-08-27', '2019-08-28 11:44:30', '2019-08-27', NULL, 1, 2, '2019-08-28 04:44:11');

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
(1, 2, '10727037964', 'Bitlogy S.A', 'a', 'b', 'c', 0, 'd', 'e', 'f', 'g', 'h', 0, '2019-08-16 11:25:22'),
(2, 1, '72703796', '', '', '', '', 0, '', '', '', '', '', 0, '2019-08-23 04:48:26');

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
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_personal`, `tipo_doc`, `nro_doc`, `nombres`, `apellido_paterno`, `apellido_materno`, `sexo`, `telefono1`, `telefono2`, `direccion`, `referencia`, `id_ubigeo`, `flestado`, `feregistro`) VALUES
(1, 1, '72703796', 'Roy', 'Roa', 'Sánchez', 1, '917919003', '', '', '', NULL, 0, '2019-08-23 07:07:14'),
(2, 1, '02888242', 'Victor', 'Roa', 'Mogollón', 1, '998877665', '', '', '', NULL, 0, '2019-08-25 09:18:13'),
(3, 1, '02888244', 'Eliana', 'Sánchez', 'Aparicio', 2, '887766554', '', '', '', NULL, 0, '2019-08-25 09:28:31');

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
(2, 2, '02888242', 'c4278526cb5909e07352ee5eb31d30a7', 2, 0, '2019-08-25 09:24:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_cliente` int(11) NOT NULL,
  `id_mediopago` int(11) NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_moneda` int(11) NOT NULL,
  `efectivo` decimal(10,2) NOT NULL,
  `vuelto` decimal(10,2) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `total` int(11) NOT NULL,
  `flestado` int(11) NOT NULL DEFAULT '0' COMMENT '0: Activo // 1: Inactivo',
  `feregistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventadetalle`
--
ALTER TABLE `ventadetalle`
  MODIFY `id_ventadetalle` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
