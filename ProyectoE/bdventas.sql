

CREATE TABLE `detalleventa` (
  `iddetalleventa` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidadproducto` int(11) NOT NULL,
  `precioventa` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;



INSERT INTO `detalleventa` (`iddetalleventa`, `idventa`, `idproducto`, `cantidadproducto`, `precioventa`) VALUES
(1, 1, 1, 1, 32000),
(2, 1, 2, 1, 70000),
(3, 2, 1, 1, 32000),
(4, 2, 2, 1, 70000),
(5, 3, 4, 1, 32213),
(6, 3, 1, 1, 32000),
(7, 4, 4, 1, 32213),
(8, 4, 1, 1, 32000),
(9, 4, 2, 5, 70000),
(10, 5, 4, 1, 32213);

-- --------------------------------------------------------

CREATE TABLE `productos` (
  `id` int(10) NOT NULL,
  `nombreproducto` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcionproducto` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `unidad` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;



INSERT INTO `productos` (`id`, `nombreproducto`, `descripcionproducto`, `unidad`, `precio`) VALUES
(1, 'Memoria USB 64Gb Kingston', 'Memoria marca Kingston de 64Gb con carcasa metalica', 'UND', 32000),
(2, 'Mouse Genius', 'Mouse Genius altos DPI gamer', 'UND', 70000),
(3, 'i MAC 27\"', 'Itntel i7 16GB RAm 3Tb Disco', 'UND', 10560000),
(4, 'wsada', 'dsda', 'dssa', 32213),
(5, 'Portatil lenovo', 'e430', 'UND', 3000000),
(6, 'Web Cam Logitech 1080', 'Camra de alta definicion para computador, puerto USB resolucion 1920x1080', 'UND', 230000),
(7, 'Memoria USB 64Gb Kingston', 'Memoria marca Kingston de 64Gb con carcasa metalica', 'UND', 42000),
(8, 'Memoria USB 64Gb Kingston sds', 'Memoria marca Kingston de 64Gb con carcasa metalica', 'UND', 32000);

-- --------------------------------------------------------


CREATE TABLE `usuarios` (
  `id` int(10) NOT NULL,
  `documento` int(10) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Rol` enum('Empleado','Cliente') COLLATE utf8_spanish2_ci NOT NULL,
  `estado` enum('Activo','Inactivo') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


INSERT INTO `usuarios` (`id`, `documento`, `nombre`, `correo`, `password`, `Rol`, `estado`) VALUES
(1, 7728013, 'César Augusto Garcia', 'cperezt@misena.edu.co', '12345', 'Cliente', 'Activo'),
(2, 1075212819, 'Juan Camilo Gonzalez', 'jgonz@mail.com', '123', 'Empleado', 'Activo'),
(10, 7730123, 'Alfonso Martinez Gomez', 'am2@mail.com', '12345', 'Cliente', 'Inactivo');

-- --------------------------------------------------------


CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL,
  `numerofactura` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idclienteventa` int(11) NOT NULL,
  `idempleadoventa` int(11) NOT NULL,
  `fechaventa` date NOT NULL,
  `totalventa` double NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


INSERT INTO `ventas` (`idventa`, `numerofactura`, `idclienteventa`, `idempleadoventa`, `fechaventa`, `totalventa`, `estado`) VALUES
(1, '34', 2, 2, '2020-10-01', 342342, 'A'),
(2, '0', 1, 1, '2020-10-21', 102000, '1'),
(3, '35', 1, 1, '2020-10-21', 64213, '1'),
(4, '36', 2, 1, '2020-10-21', 414213, '1'),
(5, '37', 1, 1, '2020-10-21', 446213, '1'),
(6, '38', 1, 1, '2020-10-21', 478213, '1'),
(7, '38', 1, 1, '2020-10-21', 478213, '1'),
(8, '39', 1, 1, '2020-10-21', 478213, '1'),
(9, '40', 1, 1, '2020-10-21', 211678213, '1'),
(10, '41', 2, 1, '2020-10-21', 253918213, '1');


ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`iddetalleventa`),
  ADD KEY `venta detalle venta` (`idventa`),
  ADD KEY `detalle producto` (`idproducto`);


ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventa`);


ALTER TABLE `detalleventa`
  MODIFY `iddetalleventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;


ALTER TABLE `productos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


ALTER TABLE `usuarios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `ventas`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;


ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalle producto` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `venta detalle venta` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`);
COMMIT;

