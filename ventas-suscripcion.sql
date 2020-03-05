-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2019 at 11:27 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ventas-suscripcion`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` text NOT NULL,
  `ruta_categoria` text NOT NULL,
  `descripcion_categoria` text NOT NULL,
  `icono_categoria` text NOT NULL,
  `color_categoria` text NOT NULL,
  `fecha_categoria` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `ruta_categoria`, `descripcion_categoria`, `icono_categoria`, `color_categoria`, `fecha_categoria`) VALUES
(1, 'Cuerpo Activo', 'cuerpo-activo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae luctus mauris. Phasellus diam elit, congue interdum velit vitae, aliquet dignissim massa. Nam risus tortor, sagittis eget erat ac, sodales bibendum quam', 'fas fa-heart', 'purple', '2019-07-10 18:46:53'),
(2, 'Mente Sana', 'mente-sana', 'Sed ac vehicula neque, at venenatis nibh. Nullam aliquam odio tempor molestie dignissim. Aenean feugiat porttitor magna, non lobortis magna euismod a. Praesent risus tortor, consectetur et felis ac, accumsan tempor risus.', 'fas fa-puzzle-piece', 'info', '2019-07-10 18:46:53'),
(3, 'Espíritu Libre', 'espiritu-libre', 'Etiam placerat rhoncus pharetra. Fusce dapibus sem ultricies nulla consequat, vel cursus lacus interdum. Nulla ornare iaculis sapien nec faucibus. Nulla condimentum tempus magna, id faucibus nunc egestas ac.', 'fas fa-wind', 'primary', '2019-07-10 18:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `pagos_binaria`
--

CREATE TABLE `pagos_binaria` (
  `id_pago` int(11) NOT NULL,
  `id_pago_paypal` text NOT NULL,
  `usuario_pago` int(11) NOT NULL,
  `periodo` text NOT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pagos_matriz`
--

CREATE TABLE `pagos_matriz` (
  `id_pago` int(11) NOT NULL,
  `id_pago_paypal` text NOT NULL,
  `usuario_pago` int(11) NOT NULL,
  `periodo` text NOT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pagos_uninivel`
--

CREATE TABLE `pagos_uninivel` (
  `id_pago` int(11) NOT NULL,
  `id_pago_paypal` text,
  `usuario_pago` int(11) NOT NULL,
  `periodo` text NOT NULL,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pagos_uninivel`
--

INSERT INTO `pagos_uninivel` (`id_pago`, `id_pago_paypal`, `usuario_pago`, `periodo`, `periodo_comision`, `periodo_venta`, `fecha_pago`) VALUES
(7, NULL, 1, '2019-10-05 a 2019-10-06', 30, 30, '2019-10-08 01:13:24'),
(8, '545JE585HW242', 2, '2019-09-06 a 2019-10-06', 8, 20, '2019-10-08 01:13:26');

-- --------------------------------------------------------

--
-- Table structure for table `red_binaria`
--

CREATE TABLE `red_binaria` (
  `id_binaria` int(11) NOT NULL,
  `usuario_red` int(11) NOT NULL,
  `orden_binaria` int(11) NOT NULL,
  `derrame_binaria` int(11) NOT NULL,
  `posicion_binaria` varchar(1) DEFAULT NULL,
  `patrocinador_red` text,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_binaria` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `red_binaria`
--

INSERT INTO `red_binaria` (`id_binaria`, `usuario_red`, `orden_binaria`, `derrame_binaria`, `posicion_binaria`, `patrocinador_red`, `periodo_comision`, `periodo_venta`, `fecha_binaria`) VALUES
(1, 1, 1, 0, NULL, NULL, 10, 70, '2019-10-05 15:55:46'),
(10, 2, 2, 1, 'A', 'academy-of-life', 4, 30, '2019-09-27 23:21:45'),
(12, 3, 3, 2, 'A', 'alexander-parra-2', 0, 0, '2019-09-27 21:22:33'),
(13, 4, 4, 1, 'B', 'academy-of-life', 1, 20, '2019-09-27 23:36:01'),
(14, 5, 5, 2, 'B', 'alexander-parra-2', 0, 0, '2019-09-27 22:10:34'),
(15, 6, 6, 3, 'A', 'academy-of-life', 0, 0, '2019-09-27 22:10:34'),
(16, 7, 7, 4, 'A', 'felipe-perez-11', 0, 0, '2019-09-27 22:12:58'),
(17, 8, 8, 4, 'B', 'felipe-perez-11', 0, 0, '2019-09-27 22:12:58');

-- --------------------------------------------------------

--
-- Table structure for table `red_matriz`
--

CREATE TABLE `red_matriz` (
  `id_matriz` int(11) NOT NULL,
  `usuario_red` int(11) NOT NULL,
  `orden_matriz` int(11) NOT NULL,
  `derrame_matriz` int(11) NOT NULL,
  `posicion_matriz` varchar(1) DEFAULT NULL,
  `patrocinador_red` text,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_matriz` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `red_matriz`
--

INSERT INTO `red_matriz` (`id_matriz`, `usuario_red`, `orden_matriz`, `derrame_matriz`, `posicion_matriz`, `patrocinador_red`, `periodo_comision`, `periodo_venta`, `fecha_matriz`) VALUES
(1, 1, 1, 0, NULL, NULL, 10, 130, '2019-10-05 15:50:53'),
(2, 2, 2, 1, 'A', 'academy-of-life', 10, 40, '2019-10-07 18:39:54'),
(3, 3, 3, 1, 'B', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(4, 4, 4, 1, 'C', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(5, 5, 5, 1, 'D', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(6, 6, 6, 2, 'A', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(7, 7, 7, 2, 'B', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(8, 8, 8, 2, 'C', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(9, 9, 9, 2, 'D', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(10, 10, 10, 3, 'A', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(11, 11, 11, 3, 'B', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(12, 12, 12, 3, 'C', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(13, 13, 13, 3, 'D', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(14, 14, 14, 4, 'A', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(15, 15, 15, 4, 'B', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(16, 16, 16, 4, 'C', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(17, 17, 17, 4, 'D', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(18, 18, 18, 5, 'A', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(19, 19, 19, 5, 'B', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(20, 20, 20, 5, 'C', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(21, 21, 21, 5, 'D', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(22, 22, 22, 6, 'A', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(23, 23, 23, 6, 'B', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(24, 24, 24, 6, 'C', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(25, 25, 25, 6, 'D', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(26, 26, 26, 7, 'A', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(27, 27, 27, 7, 'B', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(28, 28, 28, 7, 'C', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(29, 29, 29, 7, 'D', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(30, 30, 30, 8, 'A', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(31, 31, 31, 8, 'B', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(32, 32, 32, 8, 'C', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(33, 33, 33, 8, 'D', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(34, 34, 34, 9, 'A', 'academy-of-life', 0, 0, '2019-10-05 15:50:44'),
(35, 35, 35, 9, 'B', 'academy-of-life', 0, 0, '2019-10-05 15:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `red_uninivel`
--

CREATE TABLE `red_uninivel` (
  `id_uninivel` int(11) NOT NULL,
  `usuario_red` int(11) NOT NULL,
  `patrocinador_red` text,
  `periodo_comision` float NOT NULL,
  `periodo_venta` float NOT NULL,
  `fecha_uninivel` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `red_uninivel`
--

INSERT INTO `red_uninivel` (`id_uninivel`, `usuario_red`, `patrocinador_red`, `periodo_comision`, `periodo_venta`, `fecha_uninivel`) VALUES
(1, 2, 'academy-of-life', 10, 10, '2019-10-08 01:13:27'),
(4, 10, 'alexander-parra-2', 4, 10, '2019-10-08 01:47:12'),
(5, 5, 'alexander-parra-2', 4, 10, '2019-10-08 01:47:15'),
(7, 12, 'academy-of-life', 10, 10, '2019-10-08 01:47:19'),
(8, 13, 'academy-of-life', 10, 10, '2019-10-08 01:47:21');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `perfil` text NOT NULL,
  `nombre` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `suscripcion` int(11) NOT NULL,
  `id_suscripcion` text,
  `ciclo_pago` int(11) DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `verificacion` int(11) NOT NULL,
  `email_encriptado` text,
  `foto` text,
  `enlace_afiliado` text,
  `patrocinador` text,
  `paypal` text,
  `pais` text,
  `codigo_pais` text,
  `telefono_movil` text,
  `firma` text,
  `fecha_contrato` date DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `perfil`, `nombre`, `email`, `password`, `suscripcion`, `id_suscripcion`, `ciclo_pago`, `vencimiento`, `verificacion`, `email_encriptado`, `foto`, `enlace_afiliado`, `patrocinador`, `paypal`, `pais`, `codigo_pais`, `telefono_movil`, `firma`, `fecha_contrato`, `fecha`) VALUES
(1, 'admin', 'Academy of life', 'info@academyoflife.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, NULL, NULL, '2019-10-07', 1, NULL, 'vistas/img/usuarios/1/434.jpg', 'academy-of-life', NULL, 'tutorialesatualcance-buyer@hotmail.com', NULL, NULL, NULL, NULL, NULL, '2019-09-27 19:13:02'),
(2, 'usuario', 'Alexander Parra', 'alexander@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 'I-YN6MGVHWFHD7', 1, '2019-11-01', 1, 'aaf98bbf03aff90b36e5f1343067d5e5', 'vistas/img/usuarios/2/559.png', 'alexander-parra-2', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Austria', 'AT', ' 43 (234) 523-5235', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"175\" height=\"35\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 34 c 0.26 -0.1 9.81 -4.69 15 -6 c 18.38 -4.66 37.28 -8.92 56 -12 c 7.53 -1.24 19.58 -0.22 23 -1 c 0.61 -0.14 -0.14 -3.7 -1 -4 c -3.99 -1.4 -12.61 -2.77 -19 -3 c -21.93 -0.77 -64.84 0 -66 0 c -0.52 0 20.02 0.9 30 0 c 16.13 -1.45 46.73 -6.85 48 -7 c 0.14 -0.02 -4.32 1.05 -5 2 c -0.63 0.88 -0.79 4.3 0 5 c 1.5 1.33 5.92 2.37 9 3 c 8.23 1.69 16.64 3.04 25 4 c 3.3 0.38 6.72 -0.42 10 0 c 9.66 1.24 19.59 3.06 29 5 c 1.72 0.35 3.49 2 5 2 c 2.31 0 5.63 -2 8 -2 l 6 2\"/></svg>', '2019-10-01', '2019-09-27 19:13:02'),
(3, 'usuario', 'Alejandra Gomez', 'alejandra@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 'I-X7VH1S2SXD25', 1, '2019-10-06', 1, '2b7fb2498d971766e7304fd6e90ef330', 'vistas/img/usuarios/3/911.jpg', 'alejandra-gomez-3', 'alexander-parra-2', 'tutorialesatualcance-buyer@hotmail.com', 'Argentina', 'AR', ' 54 (234) 523-5235', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"215\" height=\"55\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 27 6 c -0.07 -0.02 -2.67 -0.93 -4 -1 c -4.83 -0.25 -13.59 -2.29 -15 0 c -2.44 3.97 -5.39 23.86 -1 26 c 13.47 6.56 80.38 12.23 79 12 c -1.48 -0.25 -86.5 -13.13 -85 -13 c 3.74 0.32 179.43 26.86 213 24 c 6.59 -0.56 -0.94 -27.94 -2 -42 c -0.28 -3.74 -1.11 -9.67 -2 -11 c -0.36 -0.53 -3.52 0.98 -4 2 c -1.42 3.05 -2.37 8.61 -3 13 c -0.71 4.94 -0.23 10.18 -1 15 c -0.54 3.35 -1.71 7.2 -3 10 c -0.52 1.14 -1.89 2.9 -3 3 c -8.37 0.72 -21.38 1.24 -32 0 c -46.6 -5.45 -100.4 -13.75 -139 -20 c -1.17 -0.19 -3.37 -2.99 -3 -3 c 7.7 -0.27 58.02 0.3 88 0 l 12 -1\"/></svg>', '2019-10-01', '2019-09-27 19:13:02'),
(4, 'usuario', 'Felipe Perez', 'felipe@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 'I-G10RVK3G4VP5', 1, '2019-11-01', 1, '8fe863573a42ae1ec12c4d3c1d591c6d', NULL, 'felipe-perez-4', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Argentina', 'AR', ' 54 (352) 352-3235', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"220\" height=\"29\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 50 28 c 0.14 0 5.34 0.35 8 0 c 53.61 -7.02 153.04 -20.67 160 -22 c 0.85 -0.16 -12.69 -4.7 -19 -5 c -27.28 -1.31 -56.66 -2.28 -85 0 c -38.38 3.09 -114 16 -114 16\"/></svg>', '2019-10-01', '2019-09-27 19:13:02'),
(5, 'usuario', 'Maria Zuluaga', 'maria@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 'I-2HUG8GXPLNRA', 1, '2019-11-01', 1, 'c3a724f59d3245b0e166b278f809a9c7', NULL, 'maria-zuluaga-5', 'alexander-parra-2', 'tutorialesatualcance-buyer@hotmail.com', 'Colombia', 'CO', ' 57 (352) 352-3523', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"204\" height=\"40\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 15 28 c 0.09 -0.07 3.17 -3.3 5 -4 c 6.23 -2.4 13.77 -4.62 21 -6 c 24.5 -4.69 69.7 -10.96 73 -12 c 0.88 -0.28 -12.73 -4.3 -19 -5 c -8.3 -0.92 -17.58 -1.07 -26 0 c -12.25 1.56 -25.7 4.1 -37 8 c -7.22 2.49 -14.17 7.68 -21 12 c -3.22 2.04 -7.02 4.63 -9 7 c -0.88 1.06 -1.44 3.8 -1 5 c 0.67 1.84 3.04 5.89 5 6 c 20.55 1.18 55.64 2.09 82 -1 c 20.89 -2.45 41.61 -9.98 63 -16 c 11.45 -3.22 21.89 -7.03 33 -11 c 3.15 -1.12 7.03 -4 9 -4 c 1 0 2.36 2.59 3 4 c 0.93 2.05 0.95 5.05 2 7 l 5 6\"/></svg>', '2019-10-01', '2019-09-27 19:13:02'),
(6, 'usuario', 'Julia Sanchez', 'julia@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 'I-1S227L6LY133', 1, '2019-11-01', 1, 'c5b0841a24691bcd1c6a3410ea0ccdbf', NULL, 'julia-sanchez-6', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Cuba', 'CU', ' 53 (123) 412-4124', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"168\" height=\"50\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 20 44 c 0.07 -0.05 2.53 -2.45 4 -3 c 11.16 -4.19 23.71 -7.52 36 -12 c 17.02 -6.21 32.38 -12.16 49 -19 c 6.65 -2.74 19.45 -9.1 19 -9 c -2.79 0.59 -116.23 26.93 -127 32 c -2.44 1.15 16.6 14.66 25 16 c 21.22 3.4 49.56 0.87 75 0 c 14.31 -0.49 27.67 -2.26 42 -4 c 8.27 -1 24 -4 24 -4\"/></svg>', '2019-10-01', '2019-09-27 19:13:02'),
(7, 'usuario', 'Miguel Parra', 'miguel@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 'I-SJNLLG7N52BK', 1, '2019-11-01', 1, 'aaf98bbf03aff90b36e5f1343067d5e6', NULL, 'miguel-parra-7', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Israel', 'IL', ' 972 (352) 352-3523', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"296\" height=\"31\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 40 4 c 0.39 -0.02 14.51 -1 22 -1 c 8.17 0 24.42 1.03 24 1 c -0.93 -0.06 -39.28 -6.71 -53 -3 c -10.65 2.88 -35.01 24.72 -32 26 c 7.3 3.11 65.32 2.41 100 3 c 26.34 0.45 49.99 0.5 76 0 c 9.95 -0.19 24.45 0.11 29 -2 c 1.73 -0.8 -2.47 -10.56 -1 -11 c 2.87 -0.86 13.95 3.86 21 5 c 5.24 0.85 10.54 1 16 1 c 13.96 0 28.57 0.43 41 -1 c 3.66 -0.42 8.96 -2.96 11 -5 l 1 -7\"/></svg>', '2019-10-01', '2019-09-27 19:13:02'),
(8, 'usuario', 'Alejandro Gil', 'alejandro@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 1, 'I-DGUSEDLAJ037', 1, '2019-11-01', 1, '2b7fb2498d971766e7304fd6e90ef331', NULL, 'alejandro-gil-8', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Aruba', 'AW', ' 297 (523) 523-5235', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"193\" height=\"64\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 17 25 c 0.26 0.05 9.94 2.51 15 3 c 8.61 0.84 17.01 0.87 26 1 c 14.86 0.22 28.14 0.32 43 0 c 17.29 -0.37 34.54 0.76 50 -2 c 11.24 -2.01 23.28 -8.29 34 -13 c 2.53 -1.11 7.2 -3.79 7 -5 c -0.27 -1.61 -5.84 -6.76 -9 -7 c -26.57 -2.02 -65.39 -3.67 -96 -1 c -17.48 1.53 -34.73 8.9 -53 14 c -11.49 3.21 -28.37 5.85 -33 10 c -2.22 1.99 1.03 12.58 4 16 c 6.55 7.55 29 22 29 22\"/></svg>', '2019-10-01', '2019-09-27 19:13:02'),
(9, 'usuario', 'Felipe Perez', 'felipe@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-41JE6DJ0XW6N', 1, '2019-11-01', 1, '8fe863573a42ae1ec12c4d3c1d591c6d', NULL, 'felipe-perez-12', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 56 (452) 345-2352', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"199\" height=\"54\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 34 53 c -0.14 -0.07 -6.27 -2.04 -8 -4 c -4.87 -5.54 -9.63 -13.66 -14 -21 c -4.1 -6.89 -13.06 -18.55 -11 -21 c 2.8 -3.34 22.52 -2.37 32 -4 c 1.06 -0.18 3.08 -2.18 3 -2 c -0.9 1.92 -11.89 23.45 -18 34 c -0.9 1.55 -3.13 2.61 -4 4 c -0.63 1.01 -1.41 3.69 -1 4 c 0.51 0.38 3.42 -0.41 5 -1 c 9.98 -3.71 21.72 -8.12 30 -12 c 0.92 -0.43 1.32 -3.07 2 -3 c 1.68 0.17 5.23 3.25 8 4 c 9.18 2.48 19.1 4.52 29 6 c 10.41 1.56 20.44 2.71 31 3 c 27.13 0.73 78.6 0.04 80 0 c 0.25 -0.01 -9.28 -1.74 -14 -2 c -7.68 -0.41 -15.52 -0.47 -23 0 c -3 0.19 -6.6 0.89 -9 2 c -1.47 0.68 -3.04 2.56 -4 4 c -0.91 1.37 -2.5 4.5 -2 5 c 0.66 0.66 4.79 0.37 7 0 c 3.6 -0.6 7.82 -1.32 11 -3 c 7.65 -4.05 23 -15 23 -15\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(10, 'usuario', 'Maria Zuluaga', 'maria@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-TBT8T2DGN0NV', 1, '2019-11-01', 1, 'c3a724f59d3245b0e166b278f809a9c8', NULL, 'maria-zuluaga-13', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Mexico', 'MX', ' 53 (414) 124-1241', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"175\" height=\"24\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 23 c 0.02 -0.07 0.21 -3.39 1 -4 c 1.63 -1.27 5.21 -2.09 8 -3 c 9.92 -3.22 19.15 -6.29 29 -9 c 3.63 -1 7.32 -1.68 11 -2 c 3.94 -0.34 9.18 0.6 12 0 c 0.85 -0.18 2.37 -2.75 2 -3 c -0.83 -0.55 -5.29 -0.95 -8 -1 c -14.12 -0.28 -31.92 -0.69 -42 0 c -0.87 0.06 -2.21 2.38 -2 3 c 0.29 0.86 2.58 2.53 4 3 c 3.16 1.05 7.22 1.51 11 2 c 6.8 0.88 13.17 1.84 20 2 c 36.36 0.86 95.18 0.55 107 1 c 0.4 0.02 -2.38 2.68 -2 3 c 0.87 0.72 5.35 1.76 8 2 l 14 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(11, 'usuario', 'Julia Sanchez', 'julia@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-C96KL96BVXD4', 1, '2019-11-01', 1, 'c5b0841a24691bcd1c6a3410ea0ccdbf', NULL, 'julia-sanchez-14', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Argentina', 'AR', ' 55 (235) 235-2352', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"199\" height=\"78\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 16 77 c 0 -0.52 0.62 -20.07 0 -30 c -0.38 -6.04 -1.62 -12.09 -3 -18 c -0.96 -4.1 -2.4 -8.09 -4 -12 c -1.41 -3.46 -4.3 -10.44 -5 -10 c -0.96 0.6 -2.32 10.03 -3 15 c -0.31 2.28 -0.28 4.74 0 7 c 0.37 2.98 0.78 6.56 2 9 c 1.22 2.44 3.91 5.12 6 7 c 1.02 0.91 2.65 1.71 4 2 c 3.04 0.65 7.03 1.67 10 1 c 9.35 -2.1 20.72 -5.48 30 -10 c 15 -7.3 28.71 -17.26 44 -26 c 6.42 -3.67 12.84 -7.58 19 -10 c 2.6 -1.02 8.38 -1.49 9 -1 c 0.44 0.35 -2.32 4.16 -4 5 c -10.26 5.13 -23.55 10.44 -36 15 c -11.71 4.29 -30.74 7.5 -35 11 c -1.61 1.32 3.63 10.4 7 12 c 14.26 6.79 36.56 12.13 56 18 c 13.71 4.14 34.57 9 40 11 c 0.47 0.17 -2.34 2.9 -2 3 c 0.85 0.24 6.39 0.06 9 -1 c 9.01 -3.65 18.86 -8.95 28 -14 l 10 -7\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(12, 'usuario', 'Alexander Parra', 'alexander@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-G1F5K34TN5TD', 1, '2019-11-01', 1, 'aaf98bbf03aff90b36e5f1343067d5e7', NULL, 'alexander-parra-11', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 57 (357) 547-4574', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"278\" height=\"51\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 36 50 c 0.12 -0.21 4.21 -8.4 7 -12 c 5.11 -6.6 10.84 -13.53 17 -19 c 5.56 -4.94 12.6 -9.21 19 -13 c 2.38 -1.41 5.27 -2.28 8 -3 c 3.57 -0.94 8.49 -2.36 11 -2 c 1.12 0.16 3.58 3.57 3 4 c -2.25 1.65 -11.88 5.81 -18 7 c -17.27 3.36 -35.67 4.09 -54 7 c -9.64 1.53 -28.4 5.01 -28 6 c 0.45 1.12 20.93 2.88 32 4 c 12.75 1.29 24.34 2.73 37 3 c 35.45 0.75 91.18 -0.5 104 0 c 0.55 0.02 -1 3.23 -2 4 c -2.8 2.16 -7.95 3.89 -11 6 c -0.88 0.61 -2.28 2.53 -2 3 c 0.42 0.7 3.36 1.97 5 2 c 16.19 0.28 37.13 1.95 53 -1 c 10.85 -2.02 22.78 -9.63 33 -15 c 2.6 -1.37 6.12 -5.87 7 -6 c 0.48 -0.07 -0.37 3.52 0 5 c 0.56 2.25 1.62 5.62 3 7 c 1.14 1.14 3.98 1.64 6 2 c 3.53 0.62 10.83 0.91 11 1 l -9 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(13, 'usuario', 'Alejandra Gomez', 'alejandra@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-X8AS0DB5V8HR', 1, '2019-11-01', 1, '2b7fb2498d971766e7304fd6e90ef332', NULL, 'alejandra-gomez-12', 'alexander-parra-11', 'tutorialesatualcance-buyer@hotmail.com', 'Colombia', 'CO', ' 59 (523) 452-3523', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"311\" height=\"79\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 3 72 c 0.52 -0.24 20.14 -9.07 30 -14 c 2.15 -1.07 4.15 -2.46 6 -4 c 6.19 -5.16 14.3 -11.07 18 -16 c 1.23 -1.64 0.83 -6.07 0 -8 c -0.88 -2.05 -3.88 -4.27 -6 -6 c -1.46 -1.19 -3.31 -2.32 -5 -3 c -1.48 -0.59 -3.33 -0.94 -5 -1 c -6.88 -0.26 -14.24 -0.47 -21 0 c -2.65 0.18 -5.5 1.03 -8 2 c -3.39 1.32 -7.94 3.13 -10 5 c -0.94 0.85 -1 3.47 -1 5 c 0 1.24 0.14 3.47 1 4 c 3.35 2.1 9.93 4.7 15 6 c 6.35 1.63 13.27 2.56 20 3 c 8.65 0.56 17.61 0.28 26 0 c 1.33 -0.04 3.52 -1.48 4 -1 c 0.71 0.71 1 4.08 1 6 c 0 2.23 -0.91 4.64 -1 7 c -0.24 6.34 -1.1 15.15 0 19 c 0.37 1.28 4.12 2.11 6 2 c 8.11 -0.49 19.02 -0.97 27 -4 c 14.51 -5.52 28.73 -16.48 44 -23 c 19.26 -8.23 39.2 -13.04 59 -21 c 18.39 -7.39 35.43 -19.24 53 -24 c 16.38 -4.44 49.25 -5.63 54 -5 l -9 11\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(14, 'usuario', 'Felipe Perez', 'felipe@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-41JE6DJ0XW6N', 1, '2019-11-01', 1, '8fe863573a42ae1ec12c4d3c1d591c6d', NULL, 'felipe-perez-13', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 57 (452) 345-2352', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"199\" height=\"54\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 34 53 c -0.14 -0.07 -6.27 -2.04 -8 -4 c -4.87 -5.54 -9.63 -13.66 -14 -21 c -4.1 -6.89 -13.06 -18.55 -11 -21 c 2.8 -3.34 22.52 -2.37 32 -4 c 1.06 -0.18 3.08 -2.18 3 -2 c -0.9 1.92 -11.89 23.45 -18 34 c -0.9 1.55 -3.13 2.61 -4 4 c -0.63 1.01 -1.41 3.69 -1 4 c 0.51 0.38 3.42 -0.41 5 -1 c 9.98 -3.71 21.72 -8.12 30 -12 c 0.92 -0.43 1.32 -3.07 2 -3 c 1.68 0.17 5.23 3.25 8 4 c 9.18 2.48 19.1 4.52 29 6 c 10.41 1.56 20.44 2.71 31 3 c 27.13 0.73 78.6 0.04 80 0 c 0.25 -0.01 -9.28 -1.74 -14 -2 c -7.68 -0.41 -15.52 -0.47 -23 0 c -3 0.19 -6.6 0.89 -9 2 c -1.47 0.68 -3.04 2.56 -4 4 c -0.91 1.37 -2.5 4.5 -2 5 c 0.66 0.66 4.79 0.37 7 0 c 3.6 -0.6 7.82 -1.32 11 -3 c 7.65 -4.05 23 -15 23 -15\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(15, 'usuario', 'Maria Zuluaga', 'maria@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-TBT8T2DGN0NV', 1, '2019-11-01', 1, 'c3a724f59d3245b0e166b278f809a9c9', NULL, 'maria-zuluaga-14', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Mexico', 'MX', ' 54 (414) 124-1241', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"175\" height=\"24\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 23 c 0.02 -0.07 0.21 -3.39 1 -4 c 1.63 -1.27 5.21 -2.09 8 -3 c 9.92 -3.22 19.15 -6.29 29 -9 c 3.63 -1 7.32 -1.68 11 -2 c 3.94 -0.34 9.18 0.6 12 0 c 0.85 -0.18 2.37 -2.75 2 -3 c -0.83 -0.55 -5.29 -0.95 -8 -1 c -14.12 -0.28 -31.92 -0.69 -42 0 c -0.87 0.06 -2.21 2.38 -2 3 c 0.29 0.86 2.58 2.53 4 3 c 3.16 1.05 7.22 1.51 11 2 c 6.8 0.88 13.17 1.84 20 2 c 36.36 0.86 95.18 0.55 107 1 c 0.4 0.02 -2.38 2.68 -2 3 c 0.87 0.72 5.35 1.76 8 2 l 14 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(16, 'usuario', 'Julia Sanchez', 'julia@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-C96KL96BVXD5', 1, '2019-11-01', 1, 'c5b0841a24691bcd1c6a3410ea0ccdbf', NULL, 'julia-sanchez-15', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Argentina', 'AR', ' 56 (235) 235-2352', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"199\" height=\"78\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 16 77 c 0 -0.52 0.62 -20.07 0 -30 c -0.38 -6.04 -1.62 -12.09 -3 -18 c -0.96 -4.1 -2.4 -8.09 -4 -12 c -1.41 -3.46 -4.3 -10.44 -5 -10 c -0.96 0.6 -2.32 10.03 -3 15 c -0.31 2.28 -0.28 4.74 0 7 c 0.37 2.98 0.78 6.56 2 9 c 1.22 2.44 3.91 5.12 6 7 c 1.02 0.91 2.65 1.71 4 2 c 3.04 0.65 7.03 1.67 10 1 c 9.35 -2.1 20.72 -5.48 30 -10 c 15 -7.3 28.71 -17.26 44 -26 c 6.42 -3.67 12.84 -7.58 19 -10 c 2.6 -1.02 8.38 -1.49 9 -1 c 0.44 0.35 -2.32 4.16 -4 5 c -10.26 5.13 -23.55 10.44 -36 15 c -11.71 4.29 -30.74 7.5 -35 11 c -1.61 1.32 3.63 10.4 7 12 c 14.26 6.79 36.56 12.13 56 18 c 13.71 4.14 34.57 9 40 11 c 0.47 0.17 -2.34 2.9 -2 3 c 0.85 0.24 6.39 0.06 9 -1 c 9.01 -3.65 18.86 -8.95 28 -14 l 10 -7\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(17, 'usuario', 'Alexander Parra', 'alexander@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-G1F5K34TN5TD', 1, '2019-11-01', 1, 'aaf98bbf03aff90b36e5f1343067d5e8', NULL, 'alexander-parra-12', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 58 (357) 547-4574', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"278\" height=\"51\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 36 50 c 0.12 -0.21 4.21 -8.4 7 -12 c 5.11 -6.6 10.84 -13.53 17 -19 c 5.56 -4.94 12.6 -9.21 19 -13 c 2.38 -1.41 5.27 -2.28 8 -3 c 3.57 -0.94 8.49 -2.36 11 -2 c 1.12 0.16 3.58 3.57 3 4 c -2.25 1.65 -11.88 5.81 -18 7 c -17.27 3.36 -35.67 4.09 -54 7 c -9.64 1.53 -28.4 5.01 -28 6 c 0.45 1.12 20.93 2.88 32 4 c 12.75 1.29 24.34 2.73 37 3 c 35.45 0.75 91.18 -0.5 104 0 c 0.55 0.02 -1 3.23 -2 4 c -2.8 2.16 -7.95 3.89 -11 6 c -0.88 0.61 -2.28 2.53 -2 3 c 0.42 0.7 3.36 1.97 5 2 c 16.19 0.28 37.13 1.95 53 -1 c 10.85 -2.02 22.78 -9.63 33 -15 c 2.6 -1.37 6.12 -5.87 7 -6 c 0.48 -0.07 -0.37 3.52 0 5 c 0.56 2.25 1.62 5.62 3 7 c 1.14 1.14 3.98 1.64 6 2 c 3.53 0.62 10.83 0.91 11 1 l -9 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(18, 'usuario', 'Alejandra Gomez', 'alejandra@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-X8AS0DB5V8HR', 1, '2019-11-01', 1, '2b7fb2498d971766e7304fd6e90ef333', NULL, 'alejandra-gomez-13', 'alexander-parra-12', 'tutorialesatualcance-buyer@hotmail.com', 'Colombia', 'CO', ' 60 (523) 452-3523', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"311\" height=\"79\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 3 72 c 0.52 -0.24 20.14 -9.07 30 -14 c 2.15 -1.07 4.15 -2.46 6 -4 c 6.19 -5.16 14.3 -11.07 18 -16 c 1.23 -1.64 0.83 -6.07 0 -8 c -0.88 -2.05 -3.88 -4.27 -6 -6 c -1.46 -1.19 -3.31 -2.32 -5 -3 c -1.48 -0.59 -3.33 -0.94 -5 -1 c -6.88 -0.26 -14.24 -0.47 -21 0 c -2.65 0.18 -5.5 1.03 -8 2 c -3.39 1.32 -7.94 3.13 -10 5 c -0.94 0.85 -1 3.47 -1 5 c 0 1.24 0.14 3.47 1 4 c 3.35 2.1 9.93 4.7 15 6 c 6.35 1.63 13.27 2.56 20 3 c 8.65 0.56 17.61 0.28 26 0 c 1.33 -0.04 3.52 -1.48 4 -1 c 0.71 0.71 1 4.08 1 6 c 0 2.23 -0.91 4.64 -1 7 c -0.24 6.34 -1.1 15.15 0 19 c 0.37 1.28 4.12 2.11 6 2 c 8.11 -0.49 19.02 -0.97 27 -4 c 14.51 -5.52 28.73 -16.48 44 -23 c 19.26 -8.23 39.2 -13.04 59 -21 c 18.39 -7.39 35.43 -19.24 53 -24 c 16.38 -4.44 49.25 -5.63 54 -5 l -9 11\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(19, 'usuario', 'Felipe Perez', 'felipe@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-41JE6DJ0XW6N', 1, '2019-11-01', 1, '8fe863573a42ae1ec12c4d3c1d591c6d', NULL, 'felipe-perez-14', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 58 (452) 345-2352', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"199\" height=\"54\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 34 53 c -0.14 -0.07 -6.27 -2.04 -8 -4 c -4.87 -5.54 -9.63 -13.66 -14 -21 c -4.1 -6.89 -13.06 -18.55 -11 -21 c 2.8 -3.34 22.52 -2.37 32 -4 c 1.06 -0.18 3.08 -2.18 3 -2 c -0.9 1.92 -11.89 23.45 -18 34 c -0.9 1.55 -3.13 2.61 -4 4 c -0.63 1.01 -1.41 3.69 -1 4 c 0.51 0.38 3.42 -0.41 5 -1 c 9.98 -3.71 21.72 -8.12 30 -12 c 0.92 -0.43 1.32 -3.07 2 -3 c 1.68 0.17 5.23 3.25 8 4 c 9.18 2.48 19.1 4.52 29 6 c 10.41 1.56 20.44 2.71 31 3 c 27.13 0.73 78.6 0.04 80 0 c 0.25 -0.01 -9.28 -1.74 -14 -2 c -7.68 -0.41 -15.52 -0.47 -23 0 c -3 0.19 -6.6 0.89 -9 2 c -1.47 0.68 -3.04 2.56 -4 4 c -0.91 1.37 -2.5 4.5 -2 5 c 0.66 0.66 4.79 0.37 7 0 c 3.6 -0.6 7.82 -1.32 11 -3 c 7.65 -4.05 23 -15 23 -15\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(20, 'usuario', 'Maria Zuluaga', 'maria@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-TBT8T2DGN0NV', 1, '2019-11-01', 1, 'c3a724f59d3245b0e166b278f809a9c10', NULL, 'maria-zuluaga-15', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Mexico', 'MX', ' 55 (414) 124-1241', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"175\" height=\"24\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 23 c 0.02 -0.07 0.21 -3.39 1 -4 c 1.63 -1.27 5.21 -2.09 8 -3 c 9.92 -3.22 19.15 -6.29 29 -9 c 3.63 -1 7.32 -1.68 11 -2 c 3.94 -0.34 9.18 0.6 12 0 c 0.85 -0.18 2.37 -2.75 2 -3 c -0.83 -0.55 -5.29 -0.95 -8 -1 c -14.12 -0.28 -31.92 -0.69 -42 0 c -0.87 0.06 -2.21 2.38 -2 3 c 0.29 0.86 2.58 2.53 4 3 c 3.16 1.05 7.22 1.51 11 2 c 6.8 0.88 13.17 1.84 20 2 c 36.36 0.86 95.18 0.55 107 1 c 0.4 0.02 -2.38 2.68 -2 3 c 0.87 0.72 5.35 1.76 8 2 l 14 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(21, 'usuario', 'Julia Sanchez', 'julia@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-C96KL96BVXD6', 1, '2019-11-01', 1, 'c5b0841a24691bcd1c6a3410ea0ccdbf', NULL, 'julia-sanchez-16', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Argentina', 'AR', ' 57 (235) 235-2352', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"199\" height=\"78\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 16 77 c 0 -0.52 0.62 -20.07 0 -30 c -0.38 -6.04 -1.62 -12.09 -3 -18 c -0.96 -4.1 -2.4 -8.09 -4 -12 c -1.41 -3.46 -4.3 -10.44 -5 -10 c -0.96 0.6 -2.32 10.03 -3 15 c -0.31 2.28 -0.28 4.74 0 7 c 0.37 2.98 0.78 6.56 2 9 c 1.22 2.44 3.91 5.12 6 7 c 1.02 0.91 2.65 1.71 4 2 c 3.04 0.65 7.03 1.67 10 1 c 9.35 -2.1 20.72 -5.48 30 -10 c 15 -7.3 28.71 -17.26 44 -26 c 6.42 -3.67 12.84 -7.58 19 -10 c 2.6 -1.02 8.38 -1.49 9 -1 c 0.44 0.35 -2.32 4.16 -4 5 c -10.26 5.13 -23.55 10.44 -36 15 c -11.71 4.29 -30.74 7.5 -35 11 c -1.61 1.32 3.63 10.4 7 12 c 14.26 6.79 36.56 12.13 56 18 c 13.71 4.14 34.57 9 40 11 c 0.47 0.17 -2.34 2.9 -2 3 c 0.85 0.24 6.39 0.06 9 -1 c 9.01 -3.65 18.86 -8.95 28 -14 l 10 -7\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(22, 'usuario', 'Alexander Parra', 'alexander@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-G1F5K34TN5TD', 1, '2019-11-01', 1, 'aaf98bbf03aff90b36e5f1343067d5e9', NULL, 'alexander-parra-13', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 59 (357) 547-4574', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"278\" height=\"51\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 36 50 c 0.12 -0.21 4.21 -8.4 7 -12 c 5.11 -6.6 10.84 -13.53 17 -19 c 5.56 -4.94 12.6 -9.21 19 -13 c 2.38 -1.41 5.27 -2.28 8 -3 c 3.57 -0.94 8.49 -2.36 11 -2 c 1.12 0.16 3.58 3.57 3 4 c -2.25 1.65 -11.88 5.81 -18 7 c -17.27 3.36 -35.67 4.09 -54 7 c -9.64 1.53 -28.4 5.01 -28 6 c 0.45 1.12 20.93 2.88 32 4 c 12.75 1.29 24.34 2.73 37 3 c 35.45 0.75 91.18 -0.5 104 0 c 0.55 0.02 -1 3.23 -2 4 c -2.8 2.16 -7.95 3.89 -11 6 c -0.88 0.61 -2.28 2.53 -2 3 c 0.42 0.7 3.36 1.97 5 2 c 16.19 0.28 37.13 1.95 53 -1 c 10.85 -2.02 22.78 -9.63 33 -15 c 2.6 -1.37 6.12 -5.87 7 -6 c 0.48 -0.07 -0.37 3.52 0 5 c 0.56 2.25 1.62 5.62 3 7 c 1.14 1.14 3.98 1.64 6 2 c 3.53 0.62 10.83 0.91 11 1 l -9 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(23, 'usuario', 'Alexander Parra', 'alexander@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-G1F5K34TN5TD', 1, '2019-11-01', 1, 'aaf98bbf03aff90b36e5f1343067d5e6', NULL, 'alexander-parra-10', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 56 (357) 547-4574', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"278\" height=\"51\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 36 50 c 0.12 -0.21 4.21 -8.4 7 -12 c 5.11 -6.6 10.84 -13.53 17 -19 c 5.56 -4.94 12.6 -9.21 19 -13 c 2.38 -1.41 5.27 -2.28 8 -3 c 3.57 -0.94 8.49 -2.36 11 -2 c 1.12 0.16 3.58 3.57 3 4 c -2.25 1.65 -11.88 5.81 -18 7 c -17.27 3.36 -35.67 4.09 -54 7 c -9.64 1.53 -28.4 5.01 -28 6 c 0.45 1.12 20.93 2.88 32 4 c 12.75 1.29 24.34 2.73 37 3 c 35.45 0.75 91.18 -0.5 104 0 c 0.55 0.02 -1 3.23 -2 4 c -2.8 2.16 -7.95 3.89 -11 6 c -0.88 0.61 -2.28 2.53 -2 3 c 0.42 0.7 3.36 1.97 5 2 c 16.19 0.28 37.13 1.95 53 -1 c 10.85 -2.02 22.78 -9.63 33 -15 c 2.6 -1.37 6.12 -5.87 7 -6 c 0.48 -0.07 -0.37 3.52 0 5 c 0.56 2.25 1.62 5.62 3 7 c 1.14 1.14 3.98 1.64 6 2 c 3.53 0.62 10.83 0.91 11 1 l -9 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(24, 'usuario', 'Alejandra Gomez', 'alejandra@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-X8AS0DB5V8HR', 1, '2019-11-01', 1, '2b7fb2498d971766e7304fd6e90ef331', NULL, 'alejandra-gomez-11', 'alexander-parra-10', 'tutorialesatualcance-buyer@hotmail.com', 'Colombia', 'CO', ' 58 (523) 452-3523', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"311\" height=\"79\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 3 72 c 0.52 -0.24 20.14 -9.07 30 -14 c 2.15 -1.07 4.15 -2.46 6 -4 c 6.19 -5.16 14.3 -11.07 18 -16 c 1.23 -1.64 0.83 -6.07 0 -8 c -0.88 -2.05 -3.88 -4.27 -6 -6 c -1.46 -1.19 -3.31 -2.32 -5 -3 c -1.48 -0.59 -3.33 -0.94 -5 -1 c -6.88 -0.26 -14.24 -0.47 -21 0 c -2.65 0.18 -5.5 1.03 -8 2 c -3.39 1.32 -7.94 3.13 -10 5 c -0.94 0.85 -1 3.47 -1 5 c 0 1.24 0.14 3.47 1 4 c 3.35 2.1 9.93 4.7 15 6 c 6.35 1.63 13.27 2.56 20 3 c 8.65 0.56 17.61 0.28 26 0 c 1.33 -0.04 3.52 -1.48 4 -1 c 0.71 0.71 1 4.08 1 6 c 0 2.23 -0.91 4.64 -1 7 c -0.24 6.34 -1.1 15.15 0 19 c 0.37 1.28 4.12 2.11 6 2 c 8.11 -0.49 19.02 -0.97 27 -4 c 14.51 -5.52 28.73 -16.48 44 -23 c 19.26 -8.23 39.2 -13.04 59 -21 c 18.39 -7.39 35.43 -19.24 53 -24 c 16.38 -4.44 49.25 -5.63 54 -5 l -9 11\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(25, 'usuario', 'Felipe Perez', 'felipe@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-41JE6DJ0XW6N', 1, '2019-11-01', 1, '8fe863573a42ae1ec12c4d3c1d591c6d', NULL, 'felipe-perez-12', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 56 (452) 345-2352', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"199\" height=\"54\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 34 53 c -0.14 -0.07 -6.27 -2.04 -8 -4 c -4.87 -5.54 -9.63 -13.66 -14 -21 c -4.1 -6.89 -13.06 -18.55 -11 -21 c 2.8 -3.34 22.52 -2.37 32 -4 c 1.06 -0.18 3.08 -2.18 3 -2 c -0.9 1.92 -11.89 23.45 -18 34 c -0.9 1.55 -3.13 2.61 -4 4 c -0.63 1.01 -1.41 3.69 -1 4 c 0.51 0.38 3.42 -0.41 5 -1 c 9.98 -3.71 21.72 -8.12 30 -12 c 0.92 -0.43 1.32 -3.07 2 -3 c 1.68 0.17 5.23 3.25 8 4 c 9.18 2.48 19.1 4.52 29 6 c 10.41 1.56 20.44 2.71 31 3 c 27.13 0.73 78.6 0.04 80 0 c 0.25 -0.01 -9.28 -1.74 -14 -2 c -7.68 -0.41 -15.52 -0.47 -23 0 c -3 0.19 -6.6 0.89 -9 2 c -1.47 0.68 -3.04 2.56 -4 4 c -0.91 1.37 -2.5 4.5 -2 5 c 0.66 0.66 4.79 0.37 7 0 c 3.6 -0.6 7.82 -1.32 11 -3 c 7.65 -4.05 23 -15 23 -15\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(26, 'usuario', 'Maria Zuluaga', 'maria@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-TBT8T2DGN0NV', 1, '2019-11-01', 1, 'c3a724f59d3245b0e166b278f809a9c8', NULL, 'maria-zuluaga-13', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Mexico', 'MX', ' 53 (414) 124-1241', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"175\" height=\"24\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 23 c 0.02 -0.07 0.21 -3.39 1 -4 c 1.63 -1.27 5.21 -2.09 8 -3 c 9.92 -3.22 19.15 -6.29 29 -9 c 3.63 -1 7.32 -1.68 11 -2 c 3.94 -0.34 9.18 0.6 12 0 c 0.85 -0.18 2.37 -2.75 2 -3 c -0.83 -0.55 -5.29 -0.95 -8 -1 c -14.12 -0.28 -31.92 -0.69 -42 0 c -0.87 0.06 -2.21 2.38 -2 3 c 0.29 0.86 2.58 2.53 4 3 c 3.16 1.05 7.22 1.51 11 2 c 6.8 0.88 13.17 1.84 20 2 c 36.36 0.86 95.18 0.55 107 1 c 0.4 0.02 -2.38 2.68 -2 3 c 0.87 0.72 5.35 1.76 8 2 l 14 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(27, 'usuario', 'Julia Sanchez', 'julia@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-C96KL96BVXD4', 1, '2019-11-01', 1, 'c5b0841a24691bcd1c6a3410ea0ccdbf', NULL, 'julia-sanchez-14', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Argentina', 'AR', ' 55 (235) 235-2352', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"199\" height=\"78\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 16 77 c 0 -0.52 0.62 -20.07 0 -30 c -0.38 -6.04 -1.62 -12.09 -3 -18 c -0.96 -4.1 -2.4 -8.09 -4 -12 c -1.41 -3.46 -4.3 -10.44 -5 -10 c -0.96 0.6 -2.32 10.03 -3 15 c -0.31 2.28 -0.28 4.74 0 7 c 0.37 2.98 0.78 6.56 2 9 c 1.22 2.44 3.91 5.12 6 7 c 1.02 0.91 2.65 1.71 4 2 c 3.04 0.65 7.03 1.67 10 1 c 9.35 -2.1 20.72 -5.48 30 -10 c 15 -7.3 28.71 -17.26 44 -26 c 6.42 -3.67 12.84 -7.58 19 -10 c 2.6 -1.02 8.38 -1.49 9 -1 c 0.44 0.35 -2.32 4.16 -4 5 c -10.26 5.13 -23.55 10.44 -36 15 c -11.71 4.29 -30.74 7.5 -35 11 c -1.61 1.32 3.63 10.4 7 12 c 14.26 6.79 36.56 12.13 56 18 c 13.71 4.14 34.57 9 40 11 c 0.47 0.17 -2.34 2.9 -2 3 c 0.85 0.24 6.39 0.06 9 -1 c 9.01 -3.65 18.86 -8.95 28 -14 l 10 -7\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(28, 'usuario', 'Alexander Parra', 'alexander@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-G1F5K34TN5TD', 1, '2019-11-01', 1, 'aaf98bbf03aff90b36e5f1343067d5e7', NULL, 'alexander-parra-11', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 57 (357) 547-4574', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"278\" height=\"51\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 36 50 c 0.12 -0.21 4.21 -8.4 7 -12 c 5.11 -6.6 10.84 -13.53 17 -19 c 5.56 -4.94 12.6 -9.21 19 -13 c 2.38 -1.41 5.27 -2.28 8 -3 c 3.57 -0.94 8.49 -2.36 11 -2 c 1.12 0.16 3.58 3.57 3 4 c -2.25 1.65 -11.88 5.81 -18 7 c -17.27 3.36 -35.67 4.09 -54 7 c -9.64 1.53 -28.4 5.01 -28 6 c 0.45 1.12 20.93 2.88 32 4 c 12.75 1.29 24.34 2.73 37 3 c 35.45 0.75 91.18 -0.5 104 0 c 0.55 0.02 -1 3.23 -2 4 c -2.8 2.16 -7.95 3.89 -11 6 c -0.88 0.61 -2.28 2.53 -2 3 c 0.42 0.7 3.36 1.97 5 2 c 16.19 0.28 37.13 1.95 53 -1 c 10.85 -2.02 22.78 -9.63 33 -15 c 2.6 -1.37 6.12 -5.87 7 -6 c 0.48 -0.07 -0.37 3.52 0 5 c 0.56 2.25 1.62 5.62 3 7 c 1.14 1.14 3.98 1.64 6 2 c 3.53 0.62 10.83 0.91 11 1 l -9 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(29, 'usuario', 'Alexander Parra', 'alexander@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-G1F5K34TN5TD', 1, '2019-11-01', 1, 'aaf98bbf03aff90b36e5f1343067d5e6', NULL, 'alexander-parra-10', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 56 (357) 547-4574', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"278\" height=\"51\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 36 50 c 0.12 -0.21 4.21 -8.4 7 -12 c 5.11 -6.6 10.84 -13.53 17 -19 c 5.56 -4.94 12.6 -9.21 19 -13 c 2.38 -1.41 5.27 -2.28 8 -3 c 3.57 -0.94 8.49 -2.36 11 -2 c 1.12 0.16 3.58 3.57 3 4 c -2.25 1.65 -11.88 5.81 -18 7 c -17.27 3.36 -35.67 4.09 -54 7 c -9.64 1.53 -28.4 5.01 -28 6 c 0.45 1.12 20.93 2.88 32 4 c 12.75 1.29 24.34 2.73 37 3 c 35.45 0.75 91.18 -0.5 104 0 c 0.55 0.02 -1 3.23 -2 4 c -2.8 2.16 -7.95 3.89 -11 6 c -0.88 0.61 -2.28 2.53 -2 3 c 0.42 0.7 3.36 1.97 5 2 c 16.19 0.28 37.13 1.95 53 -1 c 10.85 -2.02 22.78 -9.63 33 -15 c 2.6 -1.37 6.12 -5.87 7 -6 c 0.48 -0.07 -0.37 3.52 0 5 c 0.56 2.25 1.62 5.62 3 7 c 1.14 1.14 3.98 1.64 6 2 c 3.53 0.62 10.83 0.91 11 1 l -9 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(30, 'usuario', 'Alejandra Gomez', 'alejandra@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-X8AS0DB5V8HR', 1, '2019-11-01', 1, '2b7fb2498d971766e7304fd6e90ef331', NULL, 'alejandra-gomez-11', 'alexander-parra-10', 'tutorialesatualcance-buyer@hotmail.com', 'Colombia', 'CO', ' 58 (523) 452-3523', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"311\" height=\"79\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 3 72 c 0.52 -0.24 20.14 -9.07 30 -14 c 2.15 -1.07 4.15 -2.46 6 -4 c 6.19 -5.16 14.3 -11.07 18 -16 c 1.23 -1.64 0.83 -6.07 0 -8 c -0.88 -2.05 -3.88 -4.27 -6 -6 c -1.46 -1.19 -3.31 -2.32 -5 -3 c -1.48 -0.59 -3.33 -0.94 -5 -1 c -6.88 -0.26 -14.24 -0.47 -21 0 c -2.65 0.18 -5.5 1.03 -8 2 c -3.39 1.32 -7.94 3.13 -10 5 c -0.94 0.85 -1 3.47 -1 5 c 0 1.24 0.14 3.47 1 4 c 3.35 2.1 9.93 4.7 15 6 c 6.35 1.63 13.27 2.56 20 3 c 8.65 0.56 17.61 0.28 26 0 c 1.33 -0.04 3.52 -1.48 4 -1 c 0.71 0.71 1 4.08 1 6 c 0 2.23 -0.91 4.64 -1 7 c -0.24 6.34 -1.1 15.15 0 19 c 0.37 1.28 4.12 2.11 6 2 c 8.11 -0.49 19.02 -0.97 27 -4 c 14.51 -5.52 28.73 -16.48 44 -23 c 19.26 -8.23 39.2 -13.04 59 -21 c 18.39 -7.39 35.43 -19.24 53 -24 c 16.38 -4.44 49.25 -5.63 54 -5 l -9 11\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(31, 'usuario', 'Felipe Perez', 'felipe@hotmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-41JE6DJ0XW6N', 1, '2019-11-01', 1, '8fe863573a42ae1ec12c4d3c1d591c6d', NULL, 'felipe-perez-12', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 56 (452) 345-2352', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"199\" height=\"54\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 34 53 c -0.14 -0.07 -6.27 -2.04 -8 -4 c -4.87 -5.54 -9.63 -13.66 -14 -21 c -4.1 -6.89 -13.06 -18.55 -11 -21 c 2.8 -3.34 22.52 -2.37 32 -4 c 1.06 -0.18 3.08 -2.18 3 -2 c -0.9 1.92 -11.89 23.45 -18 34 c -0.9 1.55 -3.13 2.61 -4 4 c -0.63 1.01 -1.41 3.69 -1 4 c 0.51 0.38 3.42 -0.41 5 -1 c 9.98 -3.71 21.72 -8.12 30 -12 c 0.92 -0.43 1.32 -3.07 2 -3 c 1.68 0.17 5.23 3.25 8 4 c 9.18 2.48 19.1 4.52 29 6 c 10.41 1.56 20.44 2.71 31 3 c 27.13 0.73 78.6 0.04 80 0 c 0.25 -0.01 -9.28 -1.74 -14 -2 c -7.68 -0.41 -15.52 -0.47 -23 0 c -3 0.19 -6.6 0.89 -9 2 c -1.47 0.68 -3.04 2.56 -4 4 c -0.91 1.37 -2.5 4.5 -2 5 c 0.66 0.66 4.79 0.37 7 0 c 3.6 -0.6 7.82 -1.32 11 -3 c 7.65 -4.05 23 -15 23 -15\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(32, 'usuario', 'Maria Zuluaga', 'maria@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-TBT8T2DGN0NV', 1, '2019-11-01', 1, 'c3a724f59d3245b0e166b278f809a9c8', NULL, 'maria-zuluaga-13', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Mexico', 'MX', ' 53 (414) 124-1241', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"175\" height=\"24\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 1 23 c 0.02 -0.07 0.21 -3.39 1 -4 c 1.63 -1.27 5.21 -2.09 8 -3 c 9.92 -3.22 19.15 -6.29 29 -9 c 3.63 -1 7.32 -1.68 11 -2 c 3.94 -0.34 9.18 0.6 12 0 c 0.85 -0.18 2.37 -2.75 2 -3 c -0.83 -0.55 -5.29 -0.95 -8 -1 c -14.12 -0.28 -31.92 -0.69 -42 0 c -0.87 0.06 -2.21 2.38 -2 3 c 0.29 0.86 2.58 2.53 4 3 c 3.16 1.05 7.22 1.51 11 2 c 6.8 0.88 13.17 1.84 20 2 c 36.36 0.86 95.18 0.55 107 1 c 0.4 0.02 -2.38 2.68 -2 3 c 0.87 0.72 5.35 1.76 8 2 l 14 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(33, 'usuario', 'Julia Sanchez', 'julia@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-C96KL96BVXD4', 1, '2019-11-01', 1, 'c5b0841a24691bcd1c6a3410ea0ccdbf', NULL, 'julia-sanchez-14', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Argentina', 'AR', ' 55 (235) 235-2352', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"199\" height=\"78\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 16 77 c 0 -0.52 0.62 -20.07 0 -30 c -0.38 -6.04 -1.62 -12.09 -3 -18 c -0.96 -4.1 -2.4 -8.09 -4 -12 c -1.41 -3.46 -4.3 -10.44 -5 -10 c -0.96 0.6 -2.32 10.03 -3 15 c -0.31 2.28 -0.28 4.74 0 7 c 0.37 2.98 0.78 6.56 2 9 c 1.22 2.44 3.91 5.12 6 7 c 1.02 0.91 2.65 1.71 4 2 c 3.04 0.65 7.03 1.67 10 1 c 9.35 -2.1 20.72 -5.48 30 -10 c 15 -7.3 28.71 -17.26 44 -26 c 6.42 -3.67 12.84 -7.58 19 -10 c 2.6 -1.02 8.38 -1.49 9 -1 c 0.44 0.35 -2.32 4.16 -4 5 c -10.26 5.13 -23.55 10.44 -36 15 c -11.71 4.29 -30.74 7.5 -35 11 c -1.61 1.32 3.63 10.4 7 12 c 14.26 6.79 36.56 12.13 56 18 c 13.71 4.14 34.57 9 40 11 c 0.47 0.17 -2.34 2.9 -2 3 c 0.85 0.24 6.39 0.06 9 -1 c 9.01 -3.65 18.86 -8.95 28 -14 l 10 -7\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(34, 'usuario', 'Alexander Parra', 'alexander@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-G1F5K34TN5TD', 1, '2019-11-01', 1, 'aaf98bbf03aff90b36e5f1343067d5e7', NULL, 'alexander-parra-11', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Brazil', 'BR', ' 57 (357) 547-4574', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"278\" height=\"51\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 36 50 c 0.12 -0.21 4.21 -8.4 7 -12 c 5.11 -6.6 10.84 -13.53 17 -19 c 5.56 -4.94 12.6 -9.21 19 -13 c 2.38 -1.41 5.27 -2.28 8 -3 c 3.57 -0.94 8.49 -2.36 11 -2 c 1.12 0.16 3.58 3.57 3 4 c -2.25 1.65 -11.88 5.81 -18 7 c -17.27 3.36 -35.67 4.09 -54 7 c -9.64 1.53 -28.4 5.01 -28 6 c 0.45 1.12 20.93 2.88 32 4 c 12.75 1.29 24.34 2.73 37 3 c 35.45 0.75 91.18 -0.5 104 0 c 0.55 0.02 -1 3.23 -2 4 c -2.8 2.16 -7.95 3.89 -11 6 c -0.88 0.61 -2.28 2.53 -2 3 c 0.42 0.7 3.36 1.97 5 2 c 16.19 0.28 37.13 1.95 53 -1 c 10.85 -2.02 22.78 -9.63 33 -15 c 2.6 -1.37 6.12 -5.87 7 -6 c 0.48 -0.07 -0.37 3.52 0 5 c 0.56 2.25 1.62 5.62 3 7 c 1.14 1.14 3.98 1.64 6 2 c 3.53 0.62 10.83 0.91 11 1 l -9 0\"/></svg>', '0000-00-00', '2019-09-27 19:13:02'),
(35, 'usuario', 'Pepito Jimenez', 'pepito@gmail.com', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 0, 'I-T27RAY85C3XW', 1, '2019-11-01', 1, '42c58abd933c11304fcaa7a18cefaaaa', NULL, 'pepito-jimenez-35', 'academy-of-life', 'tutorialesatualcance-buyer@hotmail.com', 'Armenia', 'AM', ' 374 (352) 352-3523', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?><!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\"><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"222\" height=\"41\"><path stroke-linejoin=\"round\" stroke-linecap=\"round\" stroke-width=\"1\" stroke=\"#333\" fill=\"none\" d=\"M 5 38 c 0.05 0.04 2.05 2.05 3 2 c 4.29 -0.23 11.28 -1.01 16 -3 c 9.6 -4.05 20.54 -9.9 29 -16 c 5.24 -3.78 10.87 -10.52 14 -15 c 0.76 -1.09 0.82 -4.69 0 -5 c -2.12 -0.82 -8.7 -0.4 -13 0 c -6.37 0.6 -13.16 1.16 -19 3 c -6.38 2.01 -12.92 5.58 -19 9 c -4.57 2.57 -9.2 5.96 -13 9 c -0.87 0.69 -1.88 2.06 -2 3 c -0.17 1.33 0.04 4.44 1 5 c 2.1 1.22 7.23 1.56 11 2 c 7.79 0.92 15.18 1.92 23 2 c 24.73 0.26 49.93 1.42 73 -1 c 10.6 -1.11 30.97 -9.53 32 -10 c 0.31 -0.14 -6.7 -0.3 -10 0 c -4.02 0.37 -8.2 1 -12 2 c -2.38 0.63 -7.19 2.42 -7 3 c 0.24 0.73 5.93 2.48 9 3 c 10.43 1.78 21.17 3.55 32 4 c 21.83 0.9 62.84 0.17 65 0 c 0.45 -0.03 -13.27 -3.64 -13 -4 l 16 0\"/></svg>', '2019-10-01', '2019-10-01 22:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id_video` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `titulo_video` text NOT NULL,
  `descripcion_video` text NOT NULL,
  `medios_video` text NOT NULL,
  `medios_video_mp4` text NOT NULL,
  `imagen_video` text NOT NULL,
  `vista_gratuita` int(11) NOT NULL,
  `fecha_video` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id_video`, `id_cat`, `titulo_video`, `descripcion_video`, `medios_video`, `medios_video_mp4`, `imagen_video`, `vista_gratuita`, `fecha_video`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae luctus mauris. Phasellus diam elit, congue interdum velit vitae, aliquet dignissim massa. Nam risus tortor, sagittis eget erat ac, sodales bibendum quam.', 'vistas/videos/cuerpo-activo/01-video/01-video.m3u8', 'vistas/videos/cuerpo-activo/01-video.mp4', 'vistas/img/cuerpo-activo/01-imagen.jpg', 1, '2019-08-30 21:39:04'),
(2, 1, 'Consectetur adipiscing elit', 'Sed lacus purus, suscipit et nibh in, elementum varius purus. Mauris eget ornare ipsum, at faucibus est. Quisque sem elit, condimentum nec sodales et, auctor in nisl.', 'vistas/videos/cuerpo-activo/02-video/02-video.m3u8', 'vistas/videos/cuerpo-activo/02-video.mp4', 'vistas/img/cuerpo-activo/02-imagen.jpg', 1, '2019-08-30 21:39:24'),
(3, 1, 'Morbi eleifend porta efficitur', 'Aenean quis lectus ac nibh elementum lobortis. Praesent ac bibendum nisi, in tempor elit. Cras ex diam, tincidunt congue tincidunt in, consequat quis lorem. Maecenas rutrum scelerisque dignissim.', 'vistas/videos/cuerpo-activo/03-video/03-video.m3u8', 'vistas/videos/cuerpo-activo/03-video.mp4', 'vistas/img/cuerpo-activo/03-imagen.jpg', 1, '2019-08-30 21:39:27'),
(4, 1, 'Quisque nec tortor ultrices', 'Nunc suscipit suscipit porta. Donec sagittis urna hendrerit mauris suscipit, eu gravida lacus elementum. Donec augue lacus, ultricies quis hendrerit sit amet, varius sit amet justo.', 'vistas/videos/cuerpo-activo/04-video/04-video.m3u8', 'vistas/videos/cuerpo-activo/04-video.mp4', 'vistas/img/cuerpo-activo/04-imagen.jpg', 0, '2019-08-30 21:39:30'),
(5, 1, 'Vivamus et ullamcorper massa', 'Praesent quis diam in diam facilisis semper. Nam sit amet commodo arcu. Duis luctus, purus vel imperdiet gravida, urna nibh tincidunt nisl', 'vistas/videos/cuerpo-activo/05-video/05-video.m3u8', 'vistas/videos/cuerpo-activo/05-video.mp4', 'vistas/img/cuerpo-activo/05-imagen.jpg', 0, '2019-08-30 21:39:38'),
(6, 1, 'Erat sit amet urna consecteturt', 'Aliquam sed orci pretium, viverra orci sed, sollicitudin risus. Quisque velit ipsum, commodo ut venenatis non, bibendum vitae dolor. Nulla non porttitor nisi. In pharetra sed nisl eget fringilla. Suspendisse potenti.', 'vistas/videos/cuerpo-activo/06-video/06-video.m3u8', 'vistas/videos/cuerpo-activo/06-video.mp4', 'vistas/img/cuerpo-activo/06-imagen.jpg', 0, '2019-08-30 21:39:47'),
(7, 2, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae luctus mauris. Phasellus diam elit, congue interdum velit vitae, aliquet dignissim massa. Nam risus tortor, sagittis eget erat ac, sodales bibendum quam.', 'vistas/videos/mente-sana/01-video/01-video.m3u8', 'vistas/videos/mente-sana/01-video.mp4', 'vistas/img/mente-sana/01-imagen.jpg', 1, '2019-08-30 21:40:04'),
(8, 2, 'Consectetur adipiscing elit', 'Sed lacus purus, suscipit et nibh in, elementum varius purus. Mauris eget ornare ipsum, at faucibus est. Quisque sem elit, condimentum nec sodales et, auctor in nisl.', 'vistas/videos/mente-sana/02-video/02-video.m3u8', 'vistas/videos/mente-sana/02-video.mp4', 'vistas/img/mente-sana/02-imagen.jpg', 1, '2019-08-30 21:40:10'),
(9, 2, 'Morbi eleifend porta efficitur', 'Aenean quis lectus ac nibh elementum lobortis. Praesent ac bibendum nisi, in tempor elit. Cras ex diam, tincidunt congue tincidunt in, consequat quis lorem. Maecenas rutrum scelerisque dignissim.', 'vistas/videos/mente-sana/03-video/03-video.m3u8', 'vistas/videos/mente-sana/03-video.mp4', 'vistas/img/mente-sana/03-imagen.jpg', 1, '2019-08-30 21:40:14'),
(10, 2, 'Quisque nec tortor ultrices', 'Nunc suscipit suscipit porta. Donec sagittis urna hendrerit mauris suscipit, eu gravida lacus elementum. Donec augue lacus, ultricies quis hendrerit sit amet, varius sit amet justo.', 'vistas/videos/mente-sana/04-video/04-video.m3u8', 'vistas/videos/mente-sana/04-video.mp4', 'vistas/img/mente-sana/04-imagen.jpg', 0, '2019-08-30 21:40:18'),
(11, 2, 'Vivamus et ullamcorper massa', 'Praesent quis diam in diam facilisis semper. Nam sit amet commodo arcu. Duis luctus, purus vel imperdiet gravida, urna nibh tincidunt nisl', 'vistas/videos/mente-sana/05-video/05-video.m3u8', 'vistas/videos/mente-sana/05-video.mp4', 'vistas/img/mente-sana/05-imagen.jpg', 0, '2019-08-30 21:40:21'),
(12, 2, 'Erat sit amet urna consecteturt', 'Aliquam sed orci pretium, viverra orci sed, sollicitudin risus. Quisque velit ipsum, commodo ut venenatis non, bibendum vitae dolor. Nulla non porttitor nisi. In pharetra sed nisl eget fringilla. Suspendisse potenti.', 'vistas/videos/mente-sana/06-video/06-video.m3u8', 'vistas/videos/mente-sana/06-video.mp4', 'vistas/img/mente-sana/06-imagen.jpg', 0, '2019-08-30 21:40:25'),
(13, 3, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vitae luctus mauris. Phasellus diam elit, congue interdum velit vitae, aliquet dignissim massa. Nam risus tortor, sagittis eget erat ac, sodales bibendum quam.', 'vistas/videos/espiritu-libre/01-video/01-video.m3u8', 'vistas/videos/espiritu-libre/01-video.mp4', 'vistas/img/espiritu-libre/01-imagen.jpg', 1, '2019-08-30 21:40:41'),
(14, 3, 'Consectetur adipiscing elit', 'Sed lacus purus, suscipit et nibh in, elementum varius purus. Mauris eget ornare ipsum, at faucibus est. Quisque sem elit, condimentum nec sodales et, auctor in nisl.', 'vistas/videos/espiritu-libre/02-video/02-video.m3u8', 'vistas/videos/espiritu-libre/02-video.mp4', 'vistas/img/espiritu-libre/02-imagen.jpg', 1, '2019-08-30 21:49:04'),
(15, 3, 'Morbi eleifend porta efficitur', 'Aenean quis lectus ac nibh elementum lobortis. Praesent ac bibendum nisi, in tempor elit. Cras ex diam, tincidunt congue tincidunt in, consequat quis lorem. Maecenas rutrum scelerisque dignissim.', 'vistas/videos/espiritu-libre/03-video/03-video.m3u8', 'vistas/videos/espiritu-libre/03-video.mp4', 'vistas/img/espiritu-libre/03-imagen.jpg', 1, '2019-08-30 21:49:07'),
(16, 3, 'Quisque nec tortor ultrices', 'Nunc suscipit suscipit porta. Donec sagittis urna hendrerit mauris suscipit, eu gravida lacus elementum. Donec augue lacus, ultricies quis hendrerit sit amet, varius sit amet justo.', 'vistas/videos/espiritu-libre/04-video/04-video.m3u8', 'vistas/videos/espiritu-libre/04-video.mp4', 'vistas/img/espiritu-libre/04-imagen.jpg', 0, '2019-08-30 21:49:10'),
(17, 3, 'Vivamus et ullamcorper massa', 'Praesent quis diam in diam facilisis semper. Nam sit amet commodo arcu. Duis luctus, purus vel imperdiet gravida, urna nibh tincidunt nisl', 'vistas/videos/espiritu-libre/05-video/05-video.m3u8', 'vistas/videos/espiritu-libre/05-video.mp4', 'vistas/img/espiritu-libre/05-imagen.jpg', 0, '2019-08-30 21:49:15'),
(18, 3, 'Erat sit amet urna consecteturt', 'Aliquam sed orci pretium, viverra orci sed, sollicitudin risus. Quisque velit ipsum, commodo ut venenatis non, bibendum vitae dolor. Nulla non porttitor nisi. In pharetra sed nisl eget fringilla. Suspendisse potenti.', 'vistas/videos/espiritu-libre/06-video/06-video.m3u8', 'vistas/videos/espiritu-libre/06-video.mp4', 'vistas/img/espiritu-libre/06-imagen.jpg', 0, '2019-08-30 21:49:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `pagos_binaria`
--
ALTER TABLE `pagos_binaria`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indexes for table `pagos_matriz`
--
ALTER TABLE `pagos_matriz`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indexes for table `pagos_uninivel`
--
ALTER TABLE `pagos_uninivel`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indexes for table `red_binaria`
--
ALTER TABLE `red_binaria`
  ADD PRIMARY KEY (`id_binaria`);

--
-- Indexes for table `red_matriz`
--
ALTER TABLE `red_matriz`
  ADD PRIMARY KEY (`id_matriz`);

--
-- Indexes for table `red_uninivel`
--
ALTER TABLE `red_uninivel`
  ADD PRIMARY KEY (`id_uninivel`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id_video`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pagos_binaria`
--
ALTER TABLE `pagos_binaria`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pagos_matriz`
--
ALTER TABLE `pagos_matriz`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pagos_uninivel`
--
ALTER TABLE `pagos_uninivel`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `red_binaria`
--
ALTER TABLE `red_binaria`
  MODIFY `id_binaria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `red_matriz`
--
ALTER TABLE `red_matriz`
  MODIFY `id_matriz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `red_uninivel`
--
ALTER TABLE `red_uninivel`
  MODIFY `id_uninivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
