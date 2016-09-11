-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:8889
-- Tiempo de generación: 11-09-2016 a las 07:54:09
-- Versión del servidor: 5.5.38
-- Versión de PHP: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `hakaton`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos`
--

CREATE TABLE `activos` (
`id_activo` double NOT NULL,
  `tipo_user` varchar(50) NOT NULL,
  `user` varchar(100) NOT NULL,
  `clave` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `activos`
--

INSERT INTO `activos` (`id_activo`, `tipo_user`, `user`, `clave`) VALUES
(62, 'admin', 'OSWALDO', '14215442057d4c66b0bba54.17431286'),
(64, 'admin', 'salvador', '53405620657d4e1b019b370.58924976');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
`id_admin` int(11) NOT NULL,
  `codigo_admin` varchar(20) NOT NULL,
  `nombre_admin` varchar(200) NOT NULL,
  `pass_admin` varchar(50) NOT NULL,
  `foto_admin` varchar(100) DEFAULT NULL,
  `sexo_admin` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id_admin`, `codigo_admin`, `nombre_admin`, `pass_admin`, `foto_admin`, `sexo_admin`) VALUES
(1, 'SALVADOR', 'SALVADOR CALVILLO', 'ƒüè˜ˆ@íahNí¯Tl', NULL, 1),
(2, 'OSWALDO', 'OSWALDO', 'Õ~±\ZbyT\\iS:¡]', NULL, 1),
(3, 'ROBERT', 'ROBERT', 'Òú¸)Ø|>àSQÕ%J1Â0', NULL, 1),
(4, 'master', 'master', '{~³ª¿±Hð’¤ÝV·XQr', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria`
--

CREATE TABLE `galeria` (
`id` int(11) NOT NULL,
  `archivo` varchar(300) NOT NULL,
  `ruta` varchar(200) NOT NULL,
  `user` varchar(100) NOT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `lon` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `galeria`
--

INSERT INTO `galeria` (`id`, `archivo`, `ruta`, `user`, `lat`, `lon`, `descripcion`) VALUES
(66, '2da488513982ea730c6a9dea24c0ccbd.jpg', 'Files', 'salvador', '20.65970', '-103.34961', 'guadalajara'),
(67, '88.jpg', 'Files', 'salvador', '41.90278', '12.49637', 'roma'),
(68, 'PORRISTAS-DE-LOS-TIGRES-DE-QR.jpg', 'Files', 'salvador', '20.65970', '-103.34961', 'guadalajara'),
(69, 'cf1022v2_maroon-3.jpg', 'Files', 'salvador', '20.65970', '-103.34961', 'guadalajara');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
`id_genero` int(11) NOT NULL,
  `genero` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `genero`) VALUES
(1, 'MASCULINO'),
(2, 'FEMENINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `keyy`
--

CREATE TABLE `keyy` (
`id_key` int(11) NOT NULL,
  `keyy` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `keyy`
--

INSERT INTO `keyy` (`id_key`, `keyy`) VALUES
(2, 'Í`“`LÒÀÊýfq¶ƒ6”');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activos`
--
ALTER TABLE `activos`
 ADD PRIMARY KEY (`id_activo`);

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id_admin`), ADD KEY `sexo_admin` (`sexo_admin`);

--
-- Indices de la tabla `galeria`
--
ALTER TABLE `galeria`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
 ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `keyy`
--
ALTER TABLE `keyy`
 ADD PRIMARY KEY (`id_key`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activos`
--
ALTER TABLE `activos`
MODIFY `id_activo` double NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `galeria`
--
ALTER TABLE `galeria`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `keyy`
--
ALTER TABLE `keyy`
MODIFY `id_key` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin`
--
ALTER TABLE `admin`
ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`sexo_admin`) REFERENCES `genero` (`id_genero`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
