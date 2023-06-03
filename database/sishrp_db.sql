-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-06-2023 a las 19:22:59
-- Versión del servidor: 8.0.30
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sishrp_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razon_social` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `razon_social`, `ciudad`, `dir`, `fono`, `web`, `actividad`, `correo`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'SISTEMA WEB REGISTRO DE SEGUIMIENTO DE HOJAS DE RUTA Y PORTAL', 'SISHRP', 'EMPRESA SISHRP', 'LA PAZ', 'LA PAZ', '222222', '', 'ACTIVIDAD', '', '1684528515_logo.jpg', NULL, '2023-05-19 20:35:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinatarios`
--

CREATE TABLE `destinatarios` (
  `id` bigint UNSIGNED NOT NULL,
  `hoja_ruta_id` bigint UNSIGNED NOT NULL,
  `destinatario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `informe` int NOT NULL,
  `asista` int NOT NULL,
  `responda` int NOT NULL,
  `ejecute` int NOT NULL,
  `difunda` int NOT NULL,
  `coordine` int NOT NULL,
  `ver_antecedente` int NOT NULL,
  `acelere_tramite` int NOT NULL,
  `para_conocimiento` int NOT NULL,
  `archivo` int NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `destinatarios`
--

INSERT INTO `destinatarios` (`id`, `hoja_ruta_id`, `destinatario`, `informe`, `asista`, `responda`, `ejecute`, `difunda`, `coordine`, `ver_antecedente`, `acelere_tramite`, `para_conocimiento`, `archivo`, `descripcion`, `fecha`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'ALCALDE', 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 'PRUEBA DESCRIPCION PRUEBA MODIFICACION', '2023-05-25', 1, '2023-05-26 17:15:15', '2023-05-31 20:15:06'),
(2, 3, 'ALCALDE', 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 'desc. de prueba 2', '2023-05-26', 1, '2023-05-26 17:17:51', '2023-05-26 17:17:51'),
(3, 4, 'ALCALDE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Descripcion 3', '2023-05-26', 1, '2023-05-26 17:19:33', '2023-05-26 17:19:33'),
(4, 5, 'ALCALDE', 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'desc. hoja 4', '2023-05-26', 1, '2023-05-26 17:20:48', '2023-05-26 17:20:48'),
(5, 6, 'ALCALDE', 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'DESC 5', '2023-05-26', 1, '2023-05-26 17:23:27', '2023-06-03 18:54:35'),
(7, 2, 'SECRETARIA MUNICIPAL ADMINISTRATIVA', 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 'DESC, DEST, # 2. PRUEBA 2 MODIFICACI´NO', '2023-05-31', 1, '2023-05-31 17:25:24', '2023-05-31 20:15:30'),
(9, 3, 'SECRETARIA MUNICIPAL ADMINISTRATIVA', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'DESC', '2023-05-31', 1, '2023-05-31 17:57:25', '2023-05-31 17:57:25'),
(10, 6, 'SECRETARIA MUNICIPAL ADMINISTRATIVA', 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 'DESC SECRETARIA MUNICIPAL', '2023-06-03', 1, '2023-06-03 18:55:11', '2023-06-03 18:55:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN SLIDER', 'created_at: 2023-05-25 11:52:25<br/>id: 1<br/>imagen: s1685029945.jpg<br/>updated_at: 2023-05-25 11:52:25<br/>', NULL, 'SLIDERS', '2023-05-25', '11:52:25', '2023-05-25 15:52:25', '2023-05-25 15:52:25'),
(2, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN SLIDER', 'created_at: 2023-05-25 11:52:25<br/>id: 1<br/>imagen: s1685029945.jpg<br/>updated_at: 2023-05-25 11:52:25<br/>', 'created_at: 2023-05-25 11:52:25<br/>id: 1<br/>imagen: s1685030319.jpg<br/>updated_at: 2023-05-25 11:58:39<br/>', 'SLIDERS', '2023-05-25', '11:58:39', '2023-05-25 15:58:39', '2023-05-25 15:58:39'),
(3, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN SLIDER', 'created_at: 2023-05-25 11:58:51<br/>id: 2<br/>imagen: s1685030331.jpg<br/>updated_at: 2023-05-25 11:58:51<br/>', NULL, 'SLIDERS', '2023-05-25', '11:58:51', '2023-05-25 15:58:51', '2023-05-25 15:58:51'),
(4, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN SLIDER', 'created_at: 2023-05-25 12:04:14<br/>id: 3<br/>imagen: s1685030654.jpg<br/>updated_at: 2023-05-25 12:04:14<br/>', NULL, 'SLIDERS', '2023-05-25', '12:04:14', '2023-05-25 16:04:14', '2023-05-25 16:04:14'),
(5, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN SLIDER', 'created_at: 2023-05-25 12:04:14<br/>id: 3<br/>imagen: s1685030654.jpg<br/>updated_at: 2023-05-25 12:04:14<br/>', NULL, 'SLIDERS', '2023-05-25', '12:05:33', '2023-05-25 16:05:33', '2023-05-25 16:05:33'),
(6, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA HOJA DE RUTA', 'id: 2<br/>procedencia: LA PAZ<br/>referencia: REF. DE PRUEBA<br/>fecha_recepcion: 2023-05-26<br/>hora: 13:12<br/>nro_hojas: 1<br/>nro_hoja_ruta: 1<br/>fecha_registro: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-26 13:15:15<br/>', NULL, 'HOJA DE RUTAS', '2023-05-26', '13:15:16', '2023-05-26 17:15:16', '2023-05-26 17:15:16'),
(7, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA HOJA DE RUTA', 'id: 3<br/>procedencia: HOJA 2<br/>referencia: REF. 2<br/>fecha_recepcion: 2023-05-26<br/>hora: 13:17<br/>nro_hojas: 2<br/>nro_hoja_ruta: 2<br/>fecha_registro: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:17:51<br/>updated_at: 2023-05-26 13:17:51<br/>', NULL, 'HOJA DE RUTAS', '2023-05-26', '13:17:51', '2023-05-26 17:17:51', '2023-05-26 17:17:51'),
(8, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA HOJA DE RUTA', 'id: 4<br/>procedencia: LA PAZ<br/>referencia: REF # 3<br/>fecha_recepcion: 2023-05-27<br/>hora: 08:00<br/>nro_hojas: 3<br/>nro_hoja_ruta: 3<br/>fecha_registro: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:19:33<br/>updated_at: 2023-05-26 13:19:33<br/>', NULL, 'HOJA DE RUTAS', '2023-05-26', '13:19:33', '2023-05-26 17:19:33', '2023-05-26 17:19:33'),
(9, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA HOJA DE RUTA', 'id: 5<br/>procedencia: PROC. 4<br/>referencia: REF 4<br/>fecha_recepcion: 2023-05-26<br/>hora: 09:00<br/>nro_hojas: 2<br/>nro_hoja_ruta: 4<br/>fecha_registro: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:20:48<br/>updated_at: 2023-05-26 13:20:48<br/>', NULL, 'HOJA DE RUTAS', '2023-05-26', '13:20:48', '2023-05-26 17:20:48', '2023-05-26 17:20:48'),
(10, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA HOJA DE RUTA', 'id: 6<br/>procedencia: PROC. 5<br/>referencia: REF. 5<br/>fecha_recepcion: 2023-05-26<br/>hora: 10:00<br/>nro_hojas: 1<br/>nro_hoja_ruta: 5<br/>fecha_registro: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:23:27<br/>updated_at: 2023-05-26 13:23:27<br/>', NULL, 'HOJA DE RUTAS', '2023-05-26', '13:23:27', '2023-05-26 17:23:27', '2023-05-26 17:23:27'),
(11, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA HOJA DE RUTA', 'id: 7<br/>procedencia: PROC. 6<br/>referencia: REF 6.<br/>fecha_recepcion: 2023-05-26<br/>hora: 11:00<br/>nro_hojas: 2<br/>nro_hoja_ruta: 6<br/>fecha_registro: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:24:18<br/>updated_at: 2023-05-26 13:24:18<br/>', NULL, 'HOJA DE RUTAS', '2023-05-26', '13:24:18', '2023-05-26 17:24:18', '2023-05-26 17:24:18'),
(12, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA HOJA DE RUTA', 'id: 3<br/>procedencia: HOJA 2<br/>referencia: REF. 2<br/>fecha_recepcion: 2023-05-26<br/>hora: 13:17:00<br/>nro_hojas: 2<br/>nro_hoja_ruta: 2<br/>fecha_registro: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:17:51<br/>updated_at: 2023-05-26 13:17:51<br/>', 'id: 3<br/>procedencia: HOJA 2 MODIFICADO<br/>referencia: REF. 2 MODIFICADO<br/>fecha_recepcion: 2023-05-26<br/>hora: 13:20<br/>nro_hojas: 3<br/>nro_hoja_ruta: 2<br/>fecha_registro: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:17:51<br/>updated_at: 2023-05-29 13:13:24<br/>', 'HOJA DE RUTAS', '2023-05-29', '13:13:24', '2023-05-29 17:13:24', '2023-05-29 17:13:24'),
(13, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESTINATARIO EN UNA HOJA DE RUTA', 'id: 7<br/>hoja_ruta_id: 2<br/>destinatario: SECRETARIA MUNICIPAL ADMINISTRATIVA<br/>informe: 1<br/>asista: 0<br/>responda: 0<br/>ejecute: 0<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: DESC, DEST, # 2<br/>fecha: 2023-05-31<br/>user_id: 1<br/>created_at: 2023-05-31 13:25:24<br/>updated_at: 2023-05-31 13:25:24<br/>', NULL, 'HOJA DE RUTAS', '2023-05-31', '13:25:24', '2023-05-31 17:25:24', '2023-05-31 17:25:24'),
(14, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESTINATARIO EN UNA HOJA DE RUTA', 'id: 8<br/>hoja_ruta_id: 2<br/>destinatario: DEST 3<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 0<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: DESC 3<br/>fecha: 2023-06-01<br/>user_id: 1<br/>created_at: 2023-05-31 13:25:24<br/>updated_at: 2023-05-31 13:25:24<br/>', NULL, 'HOJA DE RUTAS', '2023-05-31', '13:25:24', '2023-05-31 17:25:24', '2023-05-31 17:25:24'),
(15, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESTINATARIO EN UNA HOJA DE RUTA', 'id: 9<br/>hoja_ruta_id: 3<br/>destinatario: SECRETARIA MUNICIPAL ADMINISTRATIVA<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 0<br/>difunda: 0<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: DESC<br/>fecha: 2023-05-31<br/>user_id: 1<br/>created_at: 2023-05-31 13:57:25<br/>updated_at: 2023-05-31 13:57:25<br/>', NULL, 'HOJA DE RUTAS', '2023-05-31', '13:57:25', '2023-05-31 17:57:25', '2023-05-31 17:57:25'),
(16, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA HOJA DE RUTA', 'id: 7<br/>procedencia: PROC. 6<br/>referencia: REF 6.<br/>fecha_recepcion: 2023-05-26<br/>hora: 11:00:00<br/>nro_hojas: 2<br/>nro_hoja_ruta: 6<br/>fecha_registro: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:24:18<br/>updated_at: 2023-05-26 13:24:18<br/>', NULL, 'HOJA DE RUTAS', '2023-05-31', '13:58:39', '2023-05-31 17:58:39', '2023-05-31 17:58:39'),
(17, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 0<br/>ejecute: 0<br/>difunda: 0<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: prueba descripcion<br/>fecha: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-26 13:15:15<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 0<br/>ejecute: 0<br/>difunda: 0<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION<br/>fecha: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:24:23<br/>', 'DESTINATARIOS', '2023-05-31', '15:24:23', '2023-05-31 19:24:23', '2023-05-31 19:24:23'),
(18, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 0<br/>ejecute: 0<br/>difunda: 0<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION<br/>fecha: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:24:23<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE2<br/>informe: 0<br/>asista: 1<br/>responda: 0<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION MODIFICADO<br/>fecha: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:31:36<br/>', 'DESTINATARIOS', '2023-05-31', '15:31:36', '2023-05-31 19:31:36', '2023-05-31 19:31:36'),
(19, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE2<br/>informe: 0<br/>asista: 1<br/>responda: 0<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION MODIFICADO<br/>fecha: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:31:36<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION MODIFICADO ASD<br/>fecha: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:32:25<br/>', 'DESTINATARIOS', '2023-05-31', '15:32:25', '2023-05-31 19:32:25', '2023-05-31 19:32:25'),
(20, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION MODIFICADO ASD<br/>fecha: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:32:25<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:33:25<br/>', 'DESTINATARIOS', '2023-05-31', '15:33:25', '2023-05-31 19:33:25', '2023-05-31 19:33:25'),
(21, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:33:25<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:33:25<br/>', 'DESTINATARIOS', '2023-05-31', '15:33:52', '2023-05-31 19:33:52', '2023-05-31 19:33:52'),
(22, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:33:25<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:34:53<br/>', 'DESTINATARIOS', '2023-05-31', '15:34:53', '2023-05-31 19:34:53', '2023-05-31 19:34:53'),
(23, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:34:53<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:35:13<br/>', 'DESTINATARIOS', '2023-05-31', '15:35:13', '2023-05-31 19:35:13', '2023-05-31 19:35:13'),
(24, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:35:13<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 1<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:36:39<br/>', 'DESTINATARIOS', '2023-05-31', '15:36:39', '2023-05-31 19:36:39', '2023-05-31 19:36:39'),
(25, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 1<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:36:39<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:38:47<br/>', 'DESTINATARIOS', '2023-05-31', '15:38:47', '2023-05-31 19:38:47', '2023-05-31 19:38:47'),
(26, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:38:47<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:39:30<br/>', 'DESTINATARIOS', '2023-05-31', '15:39:30', '2023-05-31 19:39:30', '2023-05-31 19:39:30'),
(27, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:39:30<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:39:30<br/>', 'DESTINATARIOS', '2023-05-31', '15:40:01', '2023-05-31 19:40:01', '2023-05-31 19:40:01'),
(28, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:39:30<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:39:30<br/>', 'DESTINATARIOS', '2023-05-31', '15:41:29', '2023-05-31 19:41:29', '2023-05-31 19:41:29'),
(29, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:39:30<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:39:30<br/>', 'DESTINATARIOS', '2023-05-31', '15:42:30', '2023-05-31 19:42:30', '2023-05-31 19:42:30'),
(30, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:39:30<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'DESTINATARIOS', '2023-05-31', '15:54:28', '2023-05-31 19:54:28', '2023-05-31 19:54:28'),
(31, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'DESTINATARIOS', '2023-05-31', '15:54:59', '2023-05-31 19:54:59', '2023-05-31 19:54:59'),
(32, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'DESTINATARIOS', '2023-05-31', '15:55:45', '2023-05-31 19:55:45', '2023-05-31 19:55:45'),
(33, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'DESTINATARIOS', '2023-05-31', '15:56:44', '2023-05-31 19:56:44', '2023-05-31 19:56:44'),
(34, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'DESTINATARIOS', '2023-05-31', '15:58:11', '2023-05-31 19:58:11', '2023-05-31 19:58:11'),
(35, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'DESTINATARIOS', '2023-05-31', '16:02:39', '2023-05-31 20:02:39', '2023-05-31 20:02:39'),
(36, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 15:54:28<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:02:47<br/>', 'DESTINATARIOS', '2023-05-31', '16:02:47', '2023-05-31 20:02:47', '2023-05-31 20:02:47'),
(37, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:02:47<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:03:22<br/>', 'DESTINATARIOS', '2023-05-31', '16:03:22', '2023-05-31 20:03:22', '2023-05-31 20:03:22'),
(38, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 0<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 0<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:03:22<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:03:27<br/>', 'DESTINATARIOS', '2023-05-31', '16:03:27', '2023-05-31 20:03:27', '2023-05-31 20:03:27'),
(39, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:03:27<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 0<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:06:38<br/>', 'DESTINATARIOS', '2023-05-31', '16:06:38', '2023-05-31 20:06:38', '2023-05-31 20:06:38'),
(40, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 0<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:06:38<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:06:43<br/>', 'DESTINATARIOS', '2023-05-31', '16:06:43', '2023-05-31 20:06:43', '2023-05-31 20:06:43'),
(41, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:06:43<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:06:59<br/>', 'DESTINATARIOS', '2023-05-31', '16:06:59', '2023-05-31 20:06:59', '2023-05-31 20:06:59'),
(42, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:06:59<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:07:03<br/>', 'DESTINATARIOS', '2023-05-31', '16:07:03', '2023-05-31 20:07:03', '2023-05-31 20:07:03'),
(43, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:07:03<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:09:18<br/>', 'DESTINATARIOS', '2023-05-31', '16:09:18', '2023-05-31 20:09:18', '2023-05-31 20:09:18'),
(44, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 0<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:09:18<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:09:34<br/>', 'DESTINATARIOS', '2023-05-31', '16:09:34', '2023-05-31 20:09:34', '2023-05-31 20:09:34'),
(45, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:09:34<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 1<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:10:49<br/>', 'DESTINATARIOS', '2023-05-31', '16:10:49', '2023-05-31 20:10:49', '2023-05-31 20:10:49'),
(46, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 1<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:10:49<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 1<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:10:49<br/>', 'DESTINATARIOS', '2023-05-31', '16:11:17', '2023-05-31 20:11:17', '2023-05-31 20:11:17'),
(47, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 1<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:10:49<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 1<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:10:49<br/>', 'DESTINATARIOS', '2023-05-31', '16:12:39', '2023-05-31 20:12:39', '2023-05-31 20:12:39'),
(48, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 1<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:10:49<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:13:02<br/>', 'DESTINATARIOS', '2023-05-31', '16:13:02', '2023-05-31 20:13:02', '2023-05-31 20:13:02'),
(49, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 1<br/>responda: 1<br/>ejecute: 1<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 1<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:13:02<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 1<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:15:06<br/>', 'DESTINATARIOS', '2023-05-31', '16:15:06', '2023-05-31 20:15:06', '2023-05-31 20:15:06'),
(50, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 1<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:15:06<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 1<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:15:06<br/>', 'DESTINATARIOS', '2023-05-31', '16:15:11', '2023-05-31 20:15:11', '2023-05-31 20:15:11'),
(51, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 1<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:15:06<br/>', 'id: 1<br/>hoja_ruta_id: 2<br/>destinatario: ALCALDE<br/>informe: 1<br/>asista: 0<br/>responda: 1<br/>ejecute: 1<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 1<br/>acelere_tramite: 0<br/>para_conocimiento: 1<br/>archivo: 1<br/>descripcion: PRUEBA DESCRIPCION PRUEBA MODIFICACION<br/>fecha: 2023-05-25<br/>user_id: 1<br/>created_at: 2023-05-26 13:15:15<br/>updated_at: 2023-05-31 16:15:06<br/>', 'DESTINATARIOS', '2023-05-31', '16:15:17', '2023-05-31 20:15:17', '2023-05-31 20:15:17'),
(52, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 7<br/>hoja_ruta_id: 2<br/>destinatario: SECRETARIA MUNICIPAL ADMINISTRATIVA<br/>informe: 1<br/>asista: 0<br/>responda: 0<br/>ejecute: 0<br/>difunda: 1<br/>coordine: 0<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: DESC, DEST, # 2<br/>fecha: 2023-05-31<br/>user_id: 1<br/>created_at: 2023-05-31 13:25:24<br/>updated_at: 2023-05-31 13:25:24<br/>', 'id: 7<br/>hoja_ruta_id: 2<br/>destinatario: SECRETARIA MUNICIPAL ADMINISTRATIVA<br/>informe: 1<br/>asista: 0<br/>responda: 0<br/>ejecute: 0<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: DESC, DEST, # 2. PRUEBA 2 MODIFICACI´NO<br/>fecha: 2023-05-31<br/>user_id: 1<br/>created_at: 2023-05-31 13:25:24<br/>updated_at: 2023-05-31 16:15:30<br/>', 'DESTINATARIOS', '2023-05-31', '16:15:30', '2023-05-31 20:15:30', '2023-05-31 20:15:30'),
(53, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 7<br/>hoja_ruta_id: 2<br/>destinatario: SECRETARIA MUNICIPAL ADMINISTRATIVA<br/>informe: 1<br/>asista: 0<br/>responda: 0<br/>ejecute: 0<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: DESC, DEST, # 2. PRUEBA 2 MODIFICACI´NO<br/>fecha: 2023-05-31<br/>user_id: 1<br/>created_at: 2023-05-31 13:25:24<br/>updated_at: 2023-05-31 16:15:30<br/>', 'id: 7<br/>hoja_ruta_id: 2<br/>destinatario: SECRETARIA MUNICIPAL ADMINISTRATIVA<br/>informe: 1<br/>asista: 0<br/>responda: 0<br/>ejecute: 0<br/>difunda: 1<br/>coordine: 1<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: DESC, DEST, # 2. PRUEBA 2 MODIFICACI´NO<br/>fecha: 2023-05-31<br/>user_id: 1<br/>created_at: 2023-05-31 13:25:24<br/>updated_at: 2023-05-31 16:15:30<br/>', 'DESTINATARIOS', '2023-05-31', '16:15:36', '2023-05-31 20:15:36', '2023-05-31 20:15:36'),
(54, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'id: 8<br/>hoja_ruta_id: 2<br/>destinatario: DEST 3<br/>informe: 0<br/>asista: 0<br/>responda: 0<br/>ejecute: 0<br/>difunda: 0<br/>coordine: 1<br/>ver_antecedente: 0<br/>acelere_tramite: 0<br/>para_conocimiento: 0<br/>archivo: 0<br/>descripcion: DESC 3<br/>fecha: 2023-06-01<br/>user_id: 1<br/>created_at: 2023-05-31 13:25:24<br/>updated_at: 2023-05-31 13:25:24<br/>', NULL, 'HOJA DE RUTAS', '2023-05-31', '16:21:20', '2023-05-31 20:21:20', '2023-05-31 20:21:20'),
(55, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO EL PORTAL GAMY', '', NULL, 'PORTAL GAMY', '2023-06-02', '13:05:17', '2023-06-02 17:05:17', '2023-06-02 17:05:17'),
(56, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO EL PORTAL GAMY', '', NULL, 'PORTAL GAMY', '2023-06-02', '13:06:39', '2023-06-02 17:06:39', '2023-06-02 17:06:39'),
(57, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ EL PORTAL GAMY', '', '', 'PORTAL GAMY', '2023-06-02', '13:08:38', '2023-06-02 17:08:38', '2023-06-02 17:08:38'),
(58, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ EL PORTAL GAMY', '', '', 'PORTAL GAMY', '2023-06-02', '13:10:22', '2023-06-02 17:10:22', '2023-06-02 17:10:22'),
(59, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ EL PORTAL GAMY', '', '', 'PORTAL GAMY', '2023-06-02', '13:11:16', '2023-06-02 17:11:16', '2023-06-02 17:11:16'),
(60, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ EL PORTAL GAMY', '', '', 'PORTAL GAMY', '2023-06-02', '13:11:32', '2023-06-02 17:11:32', '2023-06-02 17:11:32'),
(61, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA NOTICIA', 'id: 1<br/>titulo: NOTICIA 1<br/>descripcion: DESCRIPCION DE LA NOTICIA<br/>archivo: 11685737977.jpg<br/>tipo: IMAGEN<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:32:57<br/>updated_at: 2023-06-02 16:32:57<br/>', NULL, 'NOTICIAS', '2023-06-02', '16:32:57', '2023-06-02 20:32:57', '2023-06-02 20:32:57'),
(62, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA NOTICIA', 'id: 1<br/>titulo: NOTICIA 1<br/>descripcion: DESCRIPCION DE LA NOTICIA<br/>archivo: 11685737977.jpg<br/>tipo: IMAGEN<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:32:57<br/>updated_at: 2023-06-02 16:32:57<br/>', 'id: 1<br/>titulo: NOTICIA 1<br/>descripcion: DESCRIPCION DE LA NOTICIA<br/>archivo: 11685738155.pdf<br/>tipo: ARCHIVO<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:32:57<br/>updated_at: 2023-06-02 16:35:55<br/>', 'NOTICIAS', '2023-06-02', '16:35:55', '2023-06-02 20:35:55', '2023-06-02 20:35:55'),
(63, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA NOTICIA', 'id: 1<br/>titulo: NOTICIA 1<br/>descripcion: DESCRIPCION DE LA NOTICIA<br/>archivo: 11685738155.pdf<br/>tipo: ARCHIVO<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:32:57<br/>updated_at: 2023-06-02 16:35:55<br/>', 'id: 1<br/>titulo: NOTICIA 1<br/>descripcion: DESCRIPCION DE LA NOTICIA<br/>archivo: 11685738181.docx<br/>tipo: ARCHIVO<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:32:57<br/>updated_at: 2023-06-02 16:36:21<br/>', 'NOTICIAS', '2023-06-02', '16:36:21', '2023-06-02 20:36:21', '2023-06-02 20:36:21'),
(64, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA NOTICIA', 'id: 2<br/>titulo: NOTICIA2<br/>descripcion: DESCRIPCION NOTICIA 2<br/>archivo: 21685738254.jpg<br/>tipo: IMAGEN<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:37:34<br/>updated_at: 2023-06-02 16:37:34<br/>', NULL, 'NOTICIAS', '2023-06-02', '16:37:34', '2023-06-02 20:37:34', '2023-06-02 20:37:34'),
(65, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA NOTICIA', 'id: 3<br/>titulo: ASD<br/>descripcion: <br/>archivo: <br/>tipo: <br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:38:36<br/>updated_at: 2023-06-02 16:38:36<br/>', NULL, 'NOTICIAS', '2023-06-02', '16:38:36', '2023-06-02 20:38:36', '2023-06-02 20:38:36'),
(66, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA NOTICIA', 'id: 3<br/>titulo: ASD<br/>descripcion: <br/>archivo: <br/>tipo: <br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:38:36<br/>updated_at: 2023-06-02 16:38:36<br/>', NULL, 'NOTICIAS', '2023-06-02', '16:39:30', '2023-06-02 20:39:30', '2023-06-02 20:39:30'),
(67, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA NOTICIA', 'id: 1<br/>titulo: CONVOCATORIA 1<br/>descripcion: DESC CONVOCATORIA<br/>archivo: 11685738630.pdf<br/>tipo: ARCHIVO<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:43:50<br/>updated_at: 2023-06-02 16:43:50<br/>', NULL, 'NOTICIAS', '2023-06-02', '16:43:50', '2023-06-02 20:43:50', '2023-06-02 20:43:50'),
(68, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA NOTICIA', 'id: 2<br/>titulo: CONVOCATORIA2<br/>descripcion: <br/>archivo: <br/>tipo: <br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:43:59<br/>updated_at: 2023-06-02 16:43:59<br/>', NULL, 'NOTICIAS', '2023-06-02', '16:43:59', '2023-06-02 20:43:59', '2023-06-02 20:43:59'),
(69, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA NOTICIA', 'id: 2<br/>titulo: CONVOCATORIA2<br/>descripcion: <br/>archivo: <br/>tipo: <br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:43:59<br/>updated_at: 2023-06-02 16:43:59<br/>', 'id: 2<br/>titulo: CONVOCATORIA2<br/>descripcion: <br/>archivo: 21685738647.jpg<br/>tipo: IMAGEN<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:43:59<br/>updated_at: 2023-06-02 16:44:07<br/>', 'NOTICIAS', '2023-06-02', '16:44:07', '2023-06-02 20:44:07', '2023-06-02 20:44:07'),
(70, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA NOTICIA', 'id: 2<br/>titulo: CONVOCATORIA2<br/>descripcion: <br/>archivo: 21685738647.jpg<br/>tipo: IMAGEN<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:43:59<br/>updated_at: 2023-06-02 16:44:07<br/>', NULL, 'NOTICIAS', '2023-06-02', '16:44:14', '2023-06-02 20:44:14', '2023-06-02 20:44:14'),
(71, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ACTIVIDAD', 'id: 1<br/>titulo: ACTIVIDAD 1<br/>descripcion: DESC<br/>archivo: 11685738828.jpg<br/>tipo: IMAGEN<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:47:08<br/>updated_at: 2023-06-02 16:47:08<br/>', NULL, 'ACTIVIDADES', '2023-06-02', '16:47:08', '2023-06-02 20:47:08', '2023-06-02 20:47:08'),
(72, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ACTIVIDAD', 'id: 2<br/>titulo: ACTIVIDAD2<br/>descripcion: ASD<br/>archivo: <br/>tipo: <br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:47:17<br/>updated_at: 2023-06-02 16:47:17<br/>', NULL, 'ACTIVIDADES', '2023-06-02', '16:47:17', '2023-06-02 20:47:17', '2023-06-02 20:47:17');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(73, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA ACTIVIDAD', 'id: 2<br/>titulo: ACTIVIDAD2<br/>descripcion: ASD<br/>archivo: <br/>tipo: <br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:47:17<br/>updated_at: 2023-06-02 16:47:17<br/>', 'id: 2<br/>titulo: ACTIVIDAD2<br/>descripcion: DESC<br/>archivo: <br/>tipo: <br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:47:17<br/>updated_at: 2023-06-02 16:47:23<br/>', 'ACTIVIDADES', '2023-06-02', '16:47:23', '2023-06-02 20:47:23', '2023-06-02 20:47:23'),
(74, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA ACTIVIDAD', 'id: 2<br/>titulo: ACTIVIDAD2<br/>descripcion: DESC<br/>archivo: <br/>tipo: <br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 16:47:17<br/>updated_at: 2023-06-02 16:47:23<br/>', NULL, 'ACTIVIDADES', '2023-06-02', '16:47:27', '2023-06-02 20:47:27', '2023-06-02 20:47:27'),
(75, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ EL LINK DE TURISMO Y DEPORTES', 'id: 1<br/>link_turismo: https://www.google.com/<br/>link_deportes: https://www.google.com/<br/>created_at: <br/>updated_at: <br/>', 'id: 1<br/>link_turismo: https://www.google.com/<br/>link_deportes: https://www.google.com/<br/>created_at: <br/>updated_at: <br/>', 'TURISMO Y DEPORTES', '2023-06-02', '17:04:02', '2023-06-02 21:04:02', '2023-06-02 21:04:02'),
(76, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ EL LINK DE TURISMO Y DEPORTES', 'id: 1<br/>link_turismo: https://www.google.com/<br/>link_deportes: https://www.google.com/<br/>created_at: <br/>updated_at: <br/>', 'id: 1<br/>link_turismo: https://www.google.com/<br/>link_deportes: https://www.google.com/xd<br/>created_at: <br/>updated_at: 2023-06-02 17:04:06<br/>', 'TURISMO Y DEPORTES', '2023-06-02', '17:04:06', '2023-06-02 21:04:06', '2023-06-02 21:04:06'),
(77, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ EL LINK DE TURISMO Y DEPORTES', 'id: 1<br/>link_turismo: https://www.google.com/<br/>link_deportes: https://www.google.com/xd<br/>created_at: <br/>updated_at: 2023-06-02 17:04:06<br/>', 'id: 1<br/>link_turismo: https://www.google.com/<br/>link_deportes: https://www.google.com/<br/>created_at: <br/>updated_at: 2023-06-02 17:04:11<br/>', 'TURISMO Y DEPORTES', '2023-06-02', '17:04:11', '2023-06-02 21:04:11', '2023-06-02 21:04:11'),
(78, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ EL LINK DE TURISMO Y DEPORTES', 'id: 1<br/>link_turismo: https://www.google.com/<br/>link_deportes: https://www.google.com/<br/>created_at: <br/>updated_at: 2023-06-02 17:04:11<br/>', 'id: 1<br/>link_turismo: https://www.google.com/asd<br/>link_deportes: https://www.google.com/<br/>created_at: <br/>updated_at: 2023-06-02 17:04:18<br/>', 'TURISMO Y DEPORTES', '2023-06-02', '17:04:18', '2023-06-02 21:04:18', '2023-06-02 21:04:18'),
(79, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ EL LINK DE TURISMO Y DEPORTES', 'id: 1<br/>link_turismo: https://www.google.com/asd<br/>link_deportes: https://www.google.com/<br/>created_at: <br/>updated_at: 2023-06-02 17:04:18<br/>', 'id: 1<br/>link_turismo: https://www.google.com/<br/>link_deportes: https://www.google.com/<br/>created_at: <br/>updated_at: 2023-06-02 17:04:24<br/>', 'TURISMO Y DEPORTES', '2023-06-02', '17:04:24', '2023-06-02 21:04:24', '2023-06-02 21:04:24'),
(80, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 2<br/>usuario: juan@gmail.com<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>correo: juan@gmail.com<br/>fono: 7777777<br/>tipo: OPERADOR<br/>foto: default.png<br/>password: $2y$10$VlZ5rT5ZoI2k7jATBNhGr.C35GUBxwY.3/TyQfPabzaBOLq3whilu<br/>acceso: 1<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 17:07:37<br/>updated_at: 2023-06-02 17:07:37<br/>', NULL, 'USUARIOS', '2023-06-02', '17:07:37', '2023-06-02 21:07:37', '2023-06-02 21:07:37'),
(81, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 3<br/>usuario: jose@gmail.com<br/>nombre: JOSE<br/>paterno: GONZALES<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>correo: jose@gmail.com<br/>fono: 666666<br/>tipo: SUPER USUARIO<br/>foto: default.png<br/>password: $2y$10$0oYix1YY4S40B333goO83.UeFqhm1YVQHWfc.OsX57qwhguWbPiDa<br/>acceso: 1<br/>fecha_registro: 2023-06-02<br/>created_at: 2023-06-02 17:08:06<br/>updated_at: 2023-06-02 17:08:06<br/>', NULL, 'USUARIOS', '2023-06-02', '17:08:06', '2023-06-02 21:08:06', '2023-06-02 21:08:06'),
(82, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN DESTINATARIO DE UNA HOJA DE RUTA', 'acelere_tramite: 0<br/>archivo: 0<br/>asista: 0<br/>coordine: 0<br/>created_at: 2023-05-26 13:23:27<br/>descripcion: desc 5<br/>destinatario: ALCALDE<br/>difunda: 0<br/>ejecute: 0<br/>fecha: 2023-05-26<br/>hoja_ruta_id: 6<br/>id: 5<br/>informe: 0<br/>para_conocimiento: 0<br/>responda: 0<br/>updated_at: 2023-05-26 13:23:27<br/>user_id: 1<br/>ver_antecedente: 0<br/>', 'acelere_tramite: 0<br/>archivo: 0<br/>asista: 0<br/>coordine: 0<br/>created_at: 2023-05-26 13:23:27<br/>descripcion: DESC 5<br/>destinatario: ALCALDE<br/>difunda: 0<br/>ejecute: 1<br/>fecha: 2023-05-26<br/>hoja_ruta_id: 6<br/>id: 5<br/>informe: 1<br/>para_conocimiento: 0<br/>responda: 0<br/>updated_at: 2023-06-03 14:54:35<br/>user_id: 1<br/>ver_antecedente: 0<br/>', 'DESTINATARIOS', '2023-06-03', '14:54:35', '2023-06-03 18:54:35', '2023-06-03 18:54:35'),
(83, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN DESTINATARIO EN UNA HOJA DE RUTA', 'acelere_tramite: 1<br/>archivo: 0<br/>asista: 0<br/>coordine: 0<br/>created_at: 2023-06-03 14:55:11<br/>descripcion: DESC SECRETARIA MUNICIPAL<br/>destinatario: SECRETARIA MUNICIPAL ADMINISTRATIVA<br/>difunda: 1<br/>ejecute: 0<br/>fecha: 2023-06-03<br/>hoja_ruta_id: 6<br/>id: 10<br/>informe: 0<br/>para_conocimiento: 0<br/>responda: 0<br/>updated_at: 2023-06-03 14:55:11<br/>user_id: 1<br/>ver_antecedente: 0<br/>', NULL, 'HOJA DE RUTAS', '2023-06-03', '14:55:11', '2023-06-03 18:55:11', '2023-06-03 18:55:11'),
(84, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ EL PORTAL GAMY', '', '', 'PORTAL GAMY', '2023-06-03', '14:57:19', '2023-06-03 18:57:19', '2023-06-03 18:57:19'),
(85, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA NOTICIA', 'archivo: 11685738181.docx<br/>created_at: 2023-06-02 16:32:57<br/>descripcion: DESCRIPCION DE LA NOTICIA<br/>fecha_registro: 2023-06-02<br/>id: 1<br/>tipo: ARCHIVO<br/>titulo: NOTICIA 1<br/>updated_at: 2023-06-02 16:36:21<br/>', 'archivo: 11685738181.docx<br/>created_at: 2023-06-02 16:32:57<br/>descripcion: IT IS A LONG ESTABLISHED FACT THAT A READER WILL BE DISTRACTED BY THE READABLE CONTENT OF A PAGE WHEN LOOKING AT ITS LAYOUT. THE POINT OF USING LOREM IPSUM IS THAT IT HAS A MORE-OR-LESS NORMAL DISTRIBUTION OF LETTERS, AS OPPOSED TO USING<br/>fecha_registro: 2023-06-02<br/>id: 1<br/>tipo: ARCHIVO<br/>titulo: NOTICIA 1<br/>updated_at: 2023-06-03 14:58:02<br/>', 'NOTICIAS', '2023-06-03', '14:58:02', '2023-06-03 18:58:02', '2023-06-03 18:58:02'),
(86, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA NOTICIA', 'archivo: 21685738254.jpg<br/>created_at: 2023-06-02 16:37:34<br/>descripcion: DESCRIPCION NOTICIA 2<br/>fecha_registro: 2023-06-02<br/>id: 2<br/>tipo: IMAGEN<br/>titulo: NOTICIA2<br/>updated_at: 2023-06-02 16:37:34<br/>', 'archivo: 21685738254.jpg<br/>created_at: 2023-06-02 16:37:34<br/>descripcion: THERE ARE MANY VARIATIONS OF PASSAGES OF LOREM IPSUM AVAILABLE, BUT THE MAJORITY HAVE SUFFERED ALTERATION IN SOME FORM, BY INJECTED HUMOUR, OR RANDOMISED WORDS WHICH DON\'T LOOK EVEN SLIGHTLY BELIEVABLE.<br/>fecha_registro: 2023-06-02<br/>id: 2<br/>tipo: IMAGEN<br/>titulo: NOTICIA2<br/>updated_at: 2023-06-03 14:58:21<br/>', 'NOTICIAS', '2023-06-03', '14:58:21', '2023-06-03 18:58:21', '2023-06-03 18:58:21'),
(87, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA CONVOCATORIA', 'archivo: 11685738630.pdf<br/>created_at: 2023-06-02 16:43:50<br/>descripcion: DESC CONVOCATORIA<br/>fecha_registro: 2023-06-02<br/>id: 1<br/>tipo: ARCHIVO<br/>titulo: CONVOCATORIA 1<br/>updated_at: 2023-06-02 16:43:50<br/>', 'archivo: 11685738630.pdf<br/>created_at: 2023-06-02 16:43:50<br/>descripcion: THERE ARE MANY VARIATIONS OF PASSAGES OF LOREM IPSUM AVAILABLE, BUT THE MAJORITY HAVE SUFFERED ALTERATION IN SOME FORM, BY INJECTED HUMOUR, OR RANDOMISED WORDS WHICH DON\'T LOOK EVEN SLIGHTLY BELIEVABLE.<br/>fecha_registro: 2023-06-02<br/>id: 1<br/>tipo: ARCHIVO<br/>titulo: CONVOCATORIA 1<br/>updated_at: 2023-06-03 14:58:32<br/>', 'CONVOCATORIAS', '2023-06-03', '14:58:32', '2023-06-03 18:58:32', '2023-06-03 18:58:32'),
(88, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA ACTIVIDAD', 'archivo: 11685738828.jpg<br/>created_at: 2023-06-02 16:47:08<br/>descripcion: DESC<br/>fecha_registro: 2023-06-02<br/>id: 1<br/>tipo: IMAGEN<br/>titulo: ACTIVIDAD 1<br/>updated_at: 2023-06-02 16:47:08<br/>', 'archivo: 11685738828.jpg<br/>created_at: 2023-06-02 16:47:08<br/>descripcion: LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF<br/>fecha_registro: 2023-06-02<br/>id: 1<br/>tipo: IMAGEN<br/>titulo: ACTIVIDAD 1<br/>updated_at: 2023-06-03 14:58:48<br/>', 'ACTIVIDADES', '2023-06-03', '14:58:48', '2023-06-03 18:58:48', '2023-06-03 18:58:48'),
(89, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'acceso: 1<br/>ci: 1111<br/>ci_exp: SC<br/>correo: <br/>created_at: 2023-06-03 15:08:53<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-06-03<br/>fono: 77777<br/>foto: 1685819333_JPERES.jpg<br/>id: 4<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$.et5EBuuq8qM3J59p9AD2.3MFtdxVXXfASgpSc6bE.1.vc5mWhfHa<br/>paterno: PERES<br/>tipo: SUPER USUARIO<br/>updated_at: 2023-06-03 15:08:53<br/>usuario: <br/>', NULL, 'USUARIOS', '2023-06-03', '15:08:53', '2023-06-03 19:08:53', '2023-06-03 19:08:53'),
(90, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'acceso: 1<br/>ci: 1111<br/>ci_exp: CH<br/>correo: <br/>created_at: 2023-06-03 15:10:36<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-06-03<br/>fono: 77777<br/>foto: 1685819436_JPERES.jpg<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$R8LkM3jPjEmZSze.AWP9hOwLOUahQeRaiG/mvN/Ipvo8Mq7k93Otu<br/>paterno: PERES<br/>tipo: SUPER USUARIO<br/>updated_at: 2023-06-03 15:10:36<br/>usuario: JPERES<br/>', NULL, 'USUARIOS', '2023-06-03', '15:10:36', '2023-06-03 19:10:36', '2023-06-03 19:10:36'),
(91, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'acceso: 1<br/>ci: 2222<br/>ci_exp: LP<br/>correo: <br/>created_at: 2023-06-03 15:12:13<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-06-03<br/>fono: 777777<br/>foto: default.png<br/>id: 7<br/>materno: CONDORI<br/>nombre: ALBERTO<br/>password: $2y$10$Oa2DS.BbOZ/dy4gTtwcB7.HNkM9ubYOfPMW8L/jt5jRj1Wsf2y9v2<br/>paterno: GONZALES<br/>tipo: OPERADOR<br/>updated_at: 2023-06-03 15:12:13<br/>usuario: AGONZALES<br/>', NULL, 'USUARIOS', '2023-06-03', '15:12:13', '2023-06-03 19:12:13', '2023-06-03 19:12:13'),
(92, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'acceso: 1<br/>ci: 2222<br/>ci_exp: LP<br/>correo: <br/>created_at: 2023-06-03 15:12:13<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-06-03<br/>fono: 777777<br/>foto: default.png<br/>id: 7<br/>materno: CONDORI<br/>nombre: ALBERTO<br/>password: $2y$10$Oa2DS.BbOZ/dy4gTtwcB7.HNkM9ubYOfPMW8L/jt5jRj1Wsf2y9v2<br/>paterno: GONZALES<br/>tipo: OPERADOR<br/>updated_at: 2023-06-03 15:12:13<br/>usuario: AGONZALES<br/>', 'acceso: 1<br/>ci: 2222<br/>ci_exp: LP<br/>correo: <br/>created_at: 2023-06-03 15:12:13<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-06-03<br/>fono: 777777<br/>foto: default.png<br/>id: 7<br/>materno: CONDORI<br/>nombre: ALBERTO<br/>password: $2y$10$Oa2DS.BbOZ/dy4gTtwcB7.HNkM9ubYOfPMW8L/jt5jRj1Wsf2y9v2<br/>paterno: GONZALES<br/>tipo: OPERADOR<br/>updated_at: 2023-06-03 15:12:21<br/>usuario: <br/>', 'USUARIOS', '2023-06-03', '15:12:21', '2023-06-03 19:12:21', '2023-06-03 19:12:21'),
(93, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'acceso: 1<br/>ci: 1111<br/>ci_exp: CH<br/>correo: <br/>created_at: 2023-06-03 15:10:36<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-06-03<br/>fono: 77777<br/>foto: 1685819436_JPERES.jpg<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$R8LkM3jPjEmZSze.AWP9hOwLOUahQeRaiG/mvN/Ipvo8Mq7k93Otu<br/>paterno: PERES<br/>tipo: SUPER USUARIO<br/>updated_at: 2023-06-03 15:10:36<br/>usuario: JPERES<br/>', 'acceso: 1<br/>ci: 1111<br/>ci_exp: CH<br/>correo: <br/>created_at: 2023-06-03 15:10:36<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-06-03<br/>fono: 77777<br/>foto: 1685819436_JPERES.jpg<br/>id: 2<br/>materno: MAMANI<br/>nombre: JUAN<br/>password: $2y$10$R8LkM3jPjEmZSze.AWP9hOwLOUahQeRaiG/mvN/Ipvo8Mq7k93Otu<br/>paterno: PERES<br/>tipo: SUPER USUARIO<br/>updated_at: 2023-06-03 15:10:36<br/>usuario: JPERES<br/>', 'USUARIOS', '2023-06-03', '15:12:51', '2023-06-03 19:12:51', '2023-06-03 19:12:51'),
(94, 7, 'CREACIÓN', 'EL USUARIO AGONZALES REGISTRO UNA CONVOCATORIA', 'archivo: <br/>created_at: 2023-06-03 15:21:38<br/>descripcion: LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES<br/>fecha_registro: 2023-06-03<br/>id: 3<br/>tipo: <br/>titulo: CONVOCATORIA #2<br/>updated_at: 2023-06-03 15:21:38<br/>', NULL, 'CONVOCATORIAS', '2023-06-03', '15:21:38', '2023-06-03 19:21:38', '2023-06-03 19:21:38'),
(95, 7, 'CREACIÓN', 'EL USUARIO AGONZALES REGISTRO UNA ACTIVIDAD', 'archivo: 31685820117.jpg<br/>created_at: 2023-06-03 15:21:57<br/>descripcion: LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES<br/>fecha_registro: 2023-06-03<br/>id: 3<br/>tipo: IMAGEN<br/>titulo: ACTIVIDAD #2<br/>updated_at: 2023-06-03 15:21:57<br/>', NULL, 'ACTIVIDADES', '2023-06-03', '15:21:57', '2023-06-03 19:21:57', '2023-06-03 19:21:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoja_rutas`
--

CREATE TABLE `hoja_rutas` (
  `id` bigint UNSIGNED NOT NULL,
  `procedencia` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `hora` time NOT NULL,
  `nro_hojas` int NOT NULL,
  `nro_hoja_ruta` bigint NOT NULL,
  `fecha_registro` date NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `hoja_rutas`
--

INSERT INTO `hoja_rutas` (`id`, `procedencia`, `referencia`, `fecha_recepcion`, `hora`, `nro_hojas`, `nro_hoja_ruta`, `fecha_registro`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 'LA PAZ', 'REF. DE PRUEBA', '2023-05-26', '13:12:00', 1, 1, '2023-05-26', 1, '2023-05-26 17:15:15', '2023-05-26 17:15:15'),
(3, 'HOJA 2 MODIFICADO', 'REF. 2 MODIFICADO', '2023-05-26', '13:20:00', 3, 2, '2023-05-26', 1, '2023-05-26 17:17:51', '2023-05-29 17:13:24'),
(4, 'LA PAZ', 'REF # 3', '2023-05-27', '08:00:00', 3, 3, '2023-05-26', 1, '2023-05-26 17:19:33', '2023-05-26 17:19:33'),
(5, 'PROC. 4', 'REF 4', '2023-05-26', '09:00:00', 2, 4, '2023-05-26', 1, '2023-05-26 17:20:48', '2023-05-26 17:20:48'),
(6, 'PROC. 5', 'REF. 5', '2023-05-26', '10:00:00', 1, 5, '2023-05-26', 1, '2023-05-26 17:23:27', '2023-05-26 17:23:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000002_create_users_table', 1),
(2, '2022_10_13_132625_create_configuracions_table', 2),
(3, '2023_01_26_144253_create_historial_accions_table', 3),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 4),
(5, '2023_05_20_110138_create_hoja_rutas_table', 4),
(6, '2023_05_20_110615_create_destinatarios_table', 4),
(7, '2023_05_20_110713_create_sliders_table', 4),
(8, '2023_05_20_112141_create_portal_gamy_table', 4),
(9, '2023_05_20_112230_create_portal_noticias_table', 4),
(10, '2023_05_20_112254_create_portal_convocatorias_table', 4),
(11, '2023_05_20_112309_create_portal_actividads_table', 4),
(12, '2023_05_20_112325_create_portal_turismo_deportes_table', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portal_actividads`
--

CREATE TABLE `portal_actividads` (
  `id` bigint UNSIGNED NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `portal_actividads`
--

INSERT INTO `portal_actividads` (`id`, `titulo`, `descripcion`, `archivo`, `tipo`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'ACTIVIDAD 1', 'LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE, DISCOVERED THE UNDOUBTABLE SOURCE. LOREM IPSUM COMES FROM SECTIONS 1.10.32 AND 1.10.33 OF', '11685738828.jpg', 'IMAGEN', '2023-06-02', '2023-06-02 20:47:08', '2023-06-03 18:58:48'),
(3, 'ACTIVIDAD #2', 'LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES', '31685820117.jpg', 'IMAGEN', '2023-06-03', '2023-06-03 19:21:57', '2023-06-03 19:21:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portal_convocatorias`
--

CREATE TABLE `portal_convocatorias` (
  `id` bigint UNSIGNED NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `portal_convocatorias`
--

INSERT INTO `portal_convocatorias` (`id`, `titulo`, `descripcion`, `archivo`, `tipo`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'CONVOCATORIA 1', 'THERE ARE MANY VARIATIONS OF PASSAGES OF LOREM IPSUM AVAILABLE, BUT THE MAJORITY HAVE SUFFERED ALTERATION IN SOME FORM, BY INJECTED HUMOUR, OR RANDOMISED WORDS WHICH DON\'T LOOK EVEN SLIGHTLY BELIEVABLE.', '11685738630.pdf', 'ARCHIVO', '2023-06-02', '2023-06-02 20:43:50', '2023-06-03 18:58:32'),
(3, 'CONVOCATORIA #2', 'LOREM IPSUM IS SIMPLY DUMMY TEXT OF THE PRINTING AND TYPESETTING INDUSTRY. LOREM IPSUM HAS BEEN THE INDUSTRY\'S STANDARD DUMMY TEXT EVER SINCE THE 1500S, WHEN AN UNKNOWN PRINTER TOOK A GALLEY OF TYPE AND SCRAMBLED IT TO MAKE A TYPE SPECIMEN BOOK. IT HAS SURVIVED NOT ONLY FIVE CENTURIES, BUT ALSO THE LEAP INTO ELECTRONIC TYPESETTING, REMAINING ESSENTIALLY UNCHANGED. IT WAS POPULARISED IN THE 1960S WITH THE RELEASE OF LETRASET SHEETS CONTAINING LOREM IPSUM PASSAGES', NULL, '', '2023-06-03', '2023-06-03 19:21:38', '2023-06-03 19:21:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portal_gamy`
--

CREATE TABLE `portal_gamy` (
  `id` bigint UNSIGNED NOT NULL,
  `mision` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_mision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vision` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_vision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `historia` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_historia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `portal_gamy`
--

INSERT INTO `portal_gamy` (`id`, `mision`, `img_mision`, `vision`, `img_vision`, `historia`, `img_historia`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(2, 'CONTRARY TO POPULAR BELIEF, LOREM IPSUM IS NOT SIMPLY RANDOM TEXT. IT HAS ROOTS IN A PIECE OF CLASSICAL LATIN LITERATURE FROM 45 BC, MAKING IT OVER 2000 YEARS OLD. RICHARD MCCLINTOCK, A LATIN PROFESSOR AT HAMPDEN-SYDNEY COLLEGE IN VIRGINIA, LOOKED UP ONE OF THE MORE OBSCURE LATIN WORDS, CONSECTETUR, FROM A LOREM IPSUM PASSAGE, AND GOING THROUGH THE CITES OF THE WORD IN CLASSICAL LITERATURE', '21685725892.jpg', 'IT IS A LONG ESTABLISHED FACT THAT A READER WILL BE DISTRACTED BY THE READABLE CONTENT OF A PAGE WHEN LOOKING AT ITS LAYOUT. THE POINT OF USING LOREM IPSUM IS THAT IT HAS A MORE-OR-LESS NORMAL DISTRIBUTION OF LETTERS, AS OPPOSED TO USING \'CONTENT HERE, CONTENT HERE\', MAKING IT LOOK LIKE READABLE ENGLISH. MANY DESKTOP PUBLISHING PACKAGES AND WEB PAGE EDITORS NOW USE LOREM IPSUM AS THEIR DEFAULT MODEL TEXT, AND A SEARCH FOR \'LOREM IPSUM\' WILL UNCOVER MANY WEB SITES STILL IN THEIR INF', '21685725892.jpeg', 'THERE ARE MANY VARIATIONS OF PASSAGES OF LOREM IPSUM AVAILABLE, BUT THE MAJORITY HAVE SUFFERED ALTERATION IN SOME FORM, BY INJECTED HUMOUR, OR RANDOMISED WORDS WHICH DON\'T LOOK EVEN SLIGHTLY BELIEVABLE. IF YOU ARE GOING TO USE A PASSAGE OF LOREM IPSUM, YOU NEED TO BE SURE THERE ISN\'T ANYTHING EMBARRASSING HIDDEN IN THE MIDDLE OF TEXT. ALL THE LOREM IPSUM GENERATORS ON THE INTERNET TEND TO REPEAT PREDEFINED CHUNKS AS NECESSARY, MAKING THIS THE FIRST TRUE GENERATOR ON THE INTERNET', '21685818639.jpg', '2023-06-02', '2023-06-02 17:06:39', '2023-06-03 18:57:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portal_noticias`
--

CREATE TABLE `portal_noticias` (
  `id` bigint UNSIGNED NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `portal_noticias`
--

INSERT INTO `portal_noticias` (`id`, `titulo`, `descripcion`, `archivo`, `tipo`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'NOTICIA 1', 'IT IS A LONG ESTABLISHED FACT THAT A READER WILL BE DISTRACTED BY THE READABLE CONTENT OF A PAGE WHEN LOOKING AT ITS LAYOUT. THE POINT OF USING LOREM IPSUM IS THAT IT HAS A MORE-OR-LESS NORMAL DISTRIBUTION OF LETTERS, AS OPPOSED TO USING', '11685738181.docx', 'ARCHIVO', '2023-06-02', '2023-06-02 20:32:57', '2023-06-03 18:58:02'),
(2, 'NOTICIA2', 'THERE ARE MANY VARIATIONS OF PASSAGES OF LOREM IPSUM AVAILABLE, BUT THE MAJORITY HAVE SUFFERED ALTERATION IN SOME FORM, BY INJECTED HUMOUR, OR RANDOMISED WORDS WHICH DON\'T LOOK EVEN SLIGHTLY BELIEVABLE.', '21685738254.jpg', 'IMAGEN', '2023-06-02', '2023-06-02 20:37:34', '2023-06-03 18:58:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portal_turismo_deportes`
--

CREATE TABLE `portal_turismo_deportes` (
  `id` bigint UNSIGNED NOT NULL,
  `link_turismo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_deportes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `portal_turismo_deportes`
--

INSERT INTO `portal_turismo_deportes` (`id`, `link_turismo`, `link_deportes`, `created_at`, `updated_at`) VALUES
(1, 'https://www.google.com/', 'https://www.google.com/', NULL, '2023-06-02 21:04:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sliders`
--

INSERT INTO `sliders` (`id`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 's1685030319.jpg', '2023-05-25 15:52:25', '2023-05-25 15:58:39'),
(2, 's1685030331.jpg', '2023-05-25 15:58:51', '2023-05-25 15:58:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `materno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci_exp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` enum('SUPER USUARIO','OPERADOR') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `acceso` int NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `correo`, `fono`, `tipo`, `foto`, `password`, `acceso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', NULL, '', '', '', 'admin@gmail.com', '', 'SUPER USUARIO', NULL, '$2y$10$RrCZZySOwPej2gMFWsrjMe6dLzfaL5Q88h4J75I1FesEBRNPwq1x.', 1, '2023-01-11', NULL, NULL),
(2, 'JPERES', 'JUAN', 'PERES', 'MAMANI', '1111', 'CH', 'LOS OLIVOS', '', '77777', 'SUPER USUARIO', '1685819436_JPERES.jpg', '$2y$10$R8LkM3jPjEmZSze.AWP9hOwLOUahQeRaiG/mvN/Ipvo8Mq7k93Otu', 1, '2023-06-03', '2023-06-03 19:10:36', '2023-06-03 19:10:36'),
(7, 'AGONZALES', 'ALBERTO', 'GONZALES', 'CONDORI', '2222', 'LP', 'LOS OLIVOS', '', '777777', 'OPERADOR', 'default.png', '$2y$10$Oa2DS.BbOZ/dy4gTtwcB7.HNkM9ubYOfPMW8L/jt5jRj1Wsf2y9v2', 1, '2023-06-03', '2023-06-03 19:12:13', '2023-06-03 19:12:21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `destinatarios`
--
ALTER TABLE `destinatarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destinatarios_hoja_ruta_id_foreign` (`hoja_ruta_id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hoja_rutas`
--
ALTER TABLE `hoja_rutas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `portal_actividads`
--
ALTER TABLE `portal_actividads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `portal_convocatorias`
--
ALTER TABLE `portal_convocatorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `portal_gamy`
--
ALTER TABLE `portal_gamy`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `portal_noticias`
--
ALTER TABLE `portal_noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `portal_turismo_deportes`
--
ALTER TABLE `portal_turismo_deportes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `destinatarios`
--
ALTER TABLE `destinatarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `hoja_rutas`
--
ALTER TABLE `hoja_rutas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `portal_actividads`
--
ALTER TABLE `portal_actividads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `portal_convocatorias`
--
ALTER TABLE `portal_convocatorias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `portal_gamy`
--
ALTER TABLE `portal_gamy`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `portal_noticias`
--
ALTER TABLE `portal_noticias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `portal_turismo_deportes`
--
ALTER TABLE `portal_turismo_deportes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `destinatarios`
--
ALTER TABLE `destinatarios`
  ADD CONSTRAINT `destinatarios_hoja_ruta_id_foreign` FOREIGN KEY (`hoja_ruta_id`) REFERENCES `hoja_rutas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
