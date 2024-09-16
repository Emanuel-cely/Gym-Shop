-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2024 a las 18:19:55
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gym_shop`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarCarritoCompras` ()  BEGIN
    SELECT 
        carrito_id,
        usuario_id,
        fecha_creacion
    FROM 
        carrito_compras;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_compras`
--

CREATE TABLE `carrito_compras` (
  `carrito_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrito_compras`
--

INSERT INTO `carrito_compras` (`carrito_id`, `usuario_id`, `fecha_creacion`) VALUES
(1, 1, '2024-09-16 13:13:38'),
(2, 2, '2024-09-16 13:13:38'),
(3, 3, '2024-09-16 13:13:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_detalles`
--

CREATE TABLE `carrito_detalles` (
  `detalle_id` int(11) NOT NULL,
  `carrito_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrito_detalles`
--

INSERT INTO `carrito_detalles` (`detalle_id`, `carrito_id`, `producto_id`, `cantidad`, `precio`) VALUES
(1, 1, 1, 2, '39.99'),
(2, 1, 7, 1, '29.99'),
(3, 2, 10, 1, '99.99'),
(4, 3, 12, 3, '24.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `nombre`, `descripcion`) VALUES
(1, 'Proteínas', 'Suplementos de proteínas para deportistas'),
(2, 'Vitaminas', 'Suplementos vitamínicos para mejorar la salud'),
(3, 'Aminoácidos', 'Suplementos con aminoácidos esenciales para el cuerpo'),
(4, 'Energéticos', 'Productos para aumentar la energía y el rendimiento físico'),
(5, 'Anabólicos', 'Productos para mejorar el crecimiento muscular'),
(6, 'Creatina', 'Suplementos para mejorar la fuerza y el rendimiento muscular');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupones`
--

CREATE TABLE `cupones` (
  `cupon_id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descuento` decimal(5,2) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cupones`
--

INSERT INTO `cupones` (`cupon_id`, `codigo`, `descuento`, `fecha_inicio`, `fecha_fin`, `activo`) VALUES
(1, 'SUPLE10', '10.00', '2024-01-01', '2024-12-31', 1),
(2, 'PROTEINA15', '15.00', '2024-06-01', '2024-08-31', 1),
(3, 'ANABOLICOS5', '5.00', '2024-01-01', '2024-03-31', 1),
(4, 'CREATINA20', '20.00', '2024-05-01', '2024-12-31', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `notificacion_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `fecha_notificacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `leido` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`notificacion_id`, `usuario_id`, `mensaje`, `fecha_notificacion`, `leido`) VALUES
(1, 1, 'Tu orden ha sido confirmada.', '2024-09-16 13:13:38', 0),
(2, 2, 'Nueva promoción disponible: 10% en tu próxima compra.', '2024-09-16 13:13:38', 0),
(3, 3, 'Tu pedido está en camino.', '2024-09-16 13:13:38', 0),
(4, 4, 'Producto Proteína Whey en oferta.', '2024-09-16 13:13:38', 0),
(5, 1, 'La Hormona de Crecimiento está de vuelta en stock.', '2024-09-16 13:13:38', 0),
(6, 1, 'Tu pedido ha sido procesado con éxito.', '2024-09-16 13:13:38', 0),
(7, 2, 'Recuerda usar tu cupón PROTEINA15 antes de que expire.', '2024-09-16 13:13:38', 0),
(8, 3, 'Tu orden ha sido enviada y está en camino.', '2024-09-16 13:13:38', 0),
(9, 1, '¡Nuevo descuento disponible en productos anabólicos!', '2024-09-16 13:13:38', 0),
(10, 2, 'Tu carrito aún tiene productos pendientes, finaliza tu compra.', '2024-09-16 13:13:38', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `orden_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha_orden` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','procesada','enviada','cancelada') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`orden_id`, `usuario_id`, `total`, `fecha_orden`, `estado`) VALUES
(1, 1, '109.97', '2024-09-16 13:13:38', 'procesada'),
(2, 2, '99.99', '2024-09-16 13:13:38', 'pendiente'),
(3, 3, '74.97', '2024-09-16 13:13:38', 'enviada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalles`
--

CREATE TABLE `orden_detalles` (
  `detalle_id` int(11) NOT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden_detalles`
--

INSERT INTO `orden_detalles` (`detalle_id`, `orden_id`, `producto_id`, `cantidad`, `precio`) VALUES
(1, 1, 1, 2, '39.99'),
(2, 1, 7, 1, '29.99'),
(3, 2, 10, 1, '99.99'),
(4, 3, 12, 3, '24.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `nombre`, `descripcion`, `precio`, `stock`, `categoria_id`, `imagen_url`) VALUES
(1, 'Proteína Whey Isolate', 'Proteína de suero aislada para deportistas', '39.99', 100, 1, 'images/whey_isolate.jpg'),
(2, 'Proteína Caseína', 'Proteína de digestión lenta ideal para la noche', '34.99', 50, 1, 'images/caseina.jpg'),
(3, 'Multivitamínico Complejo', 'Vitaminas esenciales para la salud diaria', '19.99', 150, 2, 'images/multivitaminico.jpg'),
(4, 'Vitamina C 1000mg', 'Suplemento para mejorar el sistema inmune', '9.99', 200, 2, 'images/vitamina_c.jpg'),
(5, 'BCAA 2:1:1', 'Aminoácidos esenciales para la recuperación muscular', '24.99', 120, 3, 'images/bcaa.jpg'),
(6, 'Glutamina', 'Aminoácido que favorece la recuperación post-entreno', '14.99', 80, 3, 'images/glutamina.jpg'),
(7, 'Pre-entreno con cafeína', 'Suplemento energético para mejorar el rendimiento', '29.99', 60, 4, 'images/pre_entreno.jpg'),
(8, 'Bebida energética natural', 'Bebida para aumentar la energía de forma natural', '19.99', 100, 4, 'images/energetico_natural.jpg'),
(9, 'Testosterona Enantato', 'Esteroide para el aumento de masa muscular', '79.99', 30, 5, 'images/testosterona_enantato.jpg'),
(10, 'Dianabol', 'Esteroide oral para crecimiento muscular rápido', '99.99', 15, 5, 'images/dianabol.jpg'),
(11, 'Creatina Monohidratada', 'Suplemento para mejorar la fuerza y resistencia', '19.99', 150, 6, 'images/creatina_monohidratada.jpg'),
(12, 'Creatina Micronizada', 'Creatina de rápida absorción para mejor rendimiento', '24.99', 120, 6, 'images/creatina_micronizada.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomendaciones`
--

CREATE TABLE `recomendaciones` (
  `recomendacion_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `razon` varchar(255) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recomendaciones`
--

INSERT INTO `recomendaciones` (`recomendacion_id`, `usuario_id`, `producto_id`, `razon`, `fecha`) VALUES
(1, 1, 5, 'Basado en tus compras previas de anabólicos.', '2024-09-16 13:13:38'),
(2, 2, 1, 'Usuarios similares compraron Proteína Whey.', '2024-09-16 13:13:38'),
(3, 3, 9, 'Interesado en productos para pérdida de grasa.', '2024-09-16 13:13:38'),
(4, 4, 6, 'Mejor venta en productos anabólicos.', '2024-09-16 13:13:38'),
(5, 1, 2, 'Basado en tu compra de Proteínas.', '2024-09-16 13:13:38'),
(6, 2, 10, 'Usuarios que compraron Dianabol también compraron Testosterona.', '2024-09-16 13:13:38'),
(7, 3, 6, 'Basado en tus intereses en productos de fuerza.', '2024-09-16 13:13:38'),
(8, 1, 9, 'Productos anabólicos recomendados según tus preferencias.', '2024-09-16 13:13:38'),
(9, 2, 1, 'Proteínas recomendadas para complementar tu rutina.', '2024-09-16 13:13:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testimonio`
--

CREATE TABLE `testimonio` (
  `id` int(11) NOT NULL,
  `contenido` text DEFAULT NULL,
  `autor` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `testimonio`
--

INSERT INTO `testimonio` (`id`, `contenido`, `autor`) VALUES
(1, 'Un ambiente increíble para entrenar, me siento motivado cada día.', 'María L.'),
(2, 'Gracias a este gimnasio, he alcanzado mis metas de fitness en tiempo récord.', 'Juan P.'),
(3, 'Los entrenadores son muy atentos y siempre están dispuestos a ayudar.', 'Sofía G.'),
(4, 'Una experiencia transformadora, tanto en lo físico como en lo mental.', 'Andrés R.'),
(5, 'La variedad de clases y horarios me ha permitido adaptar el entrenamiento a mi rutina.', 'Carla M.'),
(6, 'Los suplementos que ofrecen son de alta calidad y realmente marcan la diferencia.', 'Diego V.'),
(7, 'Entrenar aquí es más que un ejercicio; es un estilo de vida que he adoptado felizmente.', 'Paula S.'),
(8, 'Desde que me uní a este gimnasio, he mejorado no solo mi físico sino también mi confianza.', 'Luis T.'),
(9, 'El equipamiento es moderno y siempre está limpio y disponible para su uso.', 'Natalia F.'),
(10, 'He probado varios gimnasios en la ciudad, pero este es el mejor por mucho.', 'Roberto C.'),
(11, 'La comunidad de miembros y entrenadores es como una gran familia.', 'Lorena D.'),
(12, 'Aquí he encontrado el apoyo que necesitaba para cambiar mi vida.', 'Daniel A.'),
(13, 'Los planes personalizados de entrenamiento realmente se adaptan a mis objetivos.', 'Fernanda K.'),
(14, 'Me encanta la energía positiva que se siente en cada rincón del gimnasio.', 'Sergio W.'),
(15, 'Los precios son justos y el valor que recibes es insuperable.', 'Gabriela N.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('cliente','admin') DEFAULT 'cliente',
  `latitud` decimal(10,8) DEFAULT NULL,
  `longitud` decimal(11,8) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `apellido`, `correo`, `direccion`, `password`, `rol`, `latitud`, `longitud`, `fecha_registro`) VALUES
(1, 'Juan', 'Pérez', 'juan.perez@email.com', 'Calle 158 # 66 - 74', 'password123', 'cliente', '19.43260800', '-99.13320900', '2024-09-16 13:13:38'),
(2, 'María', 'García', 'maria.garcia@email.com', 'Calle 37 # 11- 36', 'password123', 'cliente', '40.71277600', '-74.00597400', '2024-09-16 13:13:38'),
(3, 'Carlos', 'Martínez', 'carlos.martinez@email.com', 'Calle 73 # 44- 68', 'password123', 'cliente', '34.05223500', '-118.24368300', '2024-09-16 13:13:38'),
(4, 'Laura', 'Lopez', 'laura.lopez@email.com', 'Calle 71 # 38- 45', 'password123', 'cliente', '51.50735100', '-0.12775800', '2024-09-16 13:13:38'),
(5, 'Admin', 'User', 'admin@ecommerce.com', 'Calle 48 # 35- 15', 'adminpass', 'admin', '0.00000000', '0.00000000', '2024-09-16 13:13:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variantes_productos`
--

CREATE TABLE `variantes_productos` (
  `variante_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD PRIMARY KEY (`carrito_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `carrito_detalles`
--
ALTER TABLE `carrito_detalles`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `carrito_id` (`carrito_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `cupones`
--
ALTER TABLE `cupones`
  ADD PRIMARY KEY (`cupon_id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`notificacion_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`orden_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `orden_detalles`
--
ALTER TABLE `orden_detalles`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `recomendaciones`
--
ALTER TABLE `recomendaciones`
  ADD PRIMARY KEY (`recomendacion_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `testimonio`
--
ALTER TABLE `testimonio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `variantes_productos`
--
ALTER TABLE `variantes_productos`
  ADD PRIMARY KEY (`variante_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  MODIFY `carrito_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `carrito_detalles`
--
ALTER TABLE `carrito_detalles`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cupones`
--
ALTER TABLE `cupones`
  MODIFY `cupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `notificacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `orden_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `orden_detalles`
--
ALTER TABLE `orden_detalles`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `recomendaciones`
--
ALTER TABLE `recomendaciones`
  MODIFY `recomendacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `testimonio`
--
ALTER TABLE `testimonio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `variantes_productos`
--
ALTER TABLE `variantes_productos`
  MODIFY `variante_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD CONSTRAINT `carrito_compras_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `carrito_detalles`
--
ALTER TABLE `carrito_detalles`
  ADD CONSTRAINT `carrito_detalles_ibfk_1` FOREIGN KEY (`carrito_id`) REFERENCES `carrito_compras` (`carrito_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carrito_detalles_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `orden_detalles`
--
ALTER TABLE `orden_detalles`
  ADD CONSTRAINT `orden_detalles_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`orden_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orden_detalles_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `recomendaciones`
--
ALTER TABLE `recomendaciones`
  ADD CONSTRAINT `recomendaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recomendaciones_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `variantes_productos`
--
ALTER TABLE `variantes_productos`
  ADD CONSTRAINT `variantes_productos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
