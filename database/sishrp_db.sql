-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-05-2023 a las 17:25:58
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
(1, 2, 'ALCALDE', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'prueba descripcion', '2023-05-26', 1, '2023-05-26 17:15:15', '2023-05-26 17:15:15'),
(2, 3, 'ALCALDE', 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 'desc. de prueba 2', '2023-05-26', 1, '2023-05-26 17:17:51', '2023-05-26 17:17:51'),
(3, 4, 'ALCALDE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Descripcion 3', '2023-05-26', 1, '2023-05-26 17:19:33', '2023-05-26 17:19:33'),
(4, 5, 'ALCALDE', 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'desc. hoja 4', '2023-05-26', 1, '2023-05-26 17:20:48', '2023-05-26 17:20:48'),
(5, 6, 'ALCALDE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'desc 5', '2023-05-26', 1, '2023-05-26 17:23:27', '2023-05-26 17:23:27'),
(6, 7, 'ALCALDE', 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 'desc 6', '2023-05-26', 1, '2023-05-26 17:24:18', '2023-05-26 17:24:18');

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
(11, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA HOJA DE RUTA', 'id: 7<br/>procedencia: PROC. 6<br/>referencia: REF 6.<br/>fecha_recepcion: 2023-05-26<br/>hora: 11:00<br/>nro_hojas: 2<br/>nro_hoja_ruta: 6<br/>fecha_registro: 2023-05-26<br/>user_id: 1<br/>created_at: 2023-05-26 13:24:18<br/>updated_at: 2023-05-26 13:24:18<br/>', NULL, 'HOJA DE RUTAS', '2023-05-26', '13:24:18', '2023-05-26 17:24:18', '2023-05-26 17:24:18');

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
(3, 'HOJA 2', 'REF. 2', '2023-05-26', '13:17:00', 2, 2, '2023-05-26', 1, '2023-05-26 17:17:51', '2023-05-26 17:17:51'),
(4, 'LA PAZ', 'REF # 3', '2023-05-27', '08:00:00', 3, 3, '2023-05-26', 1, '2023-05-26 17:19:33', '2023-05-26 17:19:33'),
(5, 'PROC. 4', 'REF 4', '2023-05-26', '09:00:00', 2, 4, '2023-05-26', 1, '2023-05-26 17:20:48', '2023-05-26 17:20:48'),
(6, 'PROC. 5', 'REF. 5', '2023-05-26', '10:00:00', 1, 5, '2023-05-26', 1, '2023-05-26 17:23:27', '2023-05-26 17:23:27'),
(7, 'PROC. 6', 'REF 6.', '2023-05-26', '11:00:00', 2, 6, '2023-05-26', 1, '2023-05-26 17:24:18', '2023-05-26 17:24:18');

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
(1, 'admin', 'admin', 'admin', NULL, '', '', '', 'admin@gmail.com', '', 'SUPER USUARIO', NULL, '$2y$10$RrCZZySOwPej2gMFWsrjMe6dLzfaL5Q88h4J75I1FesEBRNPwq1x.', 1, '2023-01-11', NULL, NULL);

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
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `portal_convocatorias`
--
ALTER TABLE `portal_convocatorias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `portal_gamy`
--
ALTER TABLE `portal_gamy`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `portal_noticias`
--
ALTER TABLE `portal_noticias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `portal_turismo_deportes`
--
ALTER TABLE `portal_turismo_deportes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
