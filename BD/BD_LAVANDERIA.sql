-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Nov 26, 2024 at 05:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lavanderia`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarAccesoEmpleado` (IN `p_login` VARCHAR(80), IN `p_clave` VARCHAR(20))   BEGIN
    UPDATE acceso_empleado
    SET clave = p_clave
    WHERE login = p_login;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarAccesoUsuario` (IN `p_login` VARCHAR(80), IN `p_clave` VARCHAR(20))   BEGIN
    UPDATE acceso_usuario
    SET clave = p_clave
    WHERE login = p_login;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarEmpleado` (IN `p_email` VARCHAR(80), IN `p_nombre` VARCHAR(200), IN `p_apepat` VARCHAR(200), IN `p_apemat` VARCHAR(200), IN `p_dni` VARCHAR(8), IN `p_sexo` INT)   BEGIN
    UPDATE empleado
    SET nombre = p_nombre,
        apepat = p_apepat,
        apemat = p_apemat,
        dni = p_dni,
        sexo = p_sexo
    WHERE email = p_email;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarProducto` (IN `p_codProd` INT(11), IN `p_nombre` VARCHAR(40), IN `p_marca` VARCHAR(40), IN `p_tamaño` VARCHAR(20), IN `p_precio` DECIMAL(12,2), IN `p_calificacion` INT(11), IN `p_cantidad` INT(11))   BEGIN
    UPDATE producto
    SET nombre = p_nombre,
        marca = p_marca,
        tamaño = p_tamaño,
        precio = p_precio,
        calificacion = p_calificacion,
        cantidad = p_cantidad
    WHERE codProd = p_codProd;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarServicio` (IN `p_id` INT, IN `p_tipo_servicio_id` INT, IN `p_email` VARCHAR(80), IN `p_tipo_prenda` VARCHAR(50), IN `p_peso` DECIMAL(5,2), IN `p_fecha_registro` DATE, IN `p_costo` DECIMAL(10,2))   BEGIN
    UPDATE servicio
    SET tipo_servicio_id = p_tipo_servicio_id,
        email = p_email,
        tipo_prenda = p_tipo_prenda,
        peso = p_peso,
        fecha_registro = p_fecha_registro,
        costo = p_costo
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarUsuario` (IN `p_email` VARCHAR(80), IN `p_nombre` VARCHAR(200), IN `p_apepat` VARCHAR(200), IN `p_apemat` VARCHAR(200), IN `p_dni` VARCHAR(8), IN `p_sexo` INT(11))   BEGIN
    UPDATE usuario
    SET nombre = p_nombre,
        apepat = p_apepat,
        apemat = p_apemat,
        dni = p_dni,
        sexo = p_sexo
    WHERE email = p_email;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarServicio` (IN `p_id` INT, IN `p_tipo_servicio_id` INT, IN `p_email` VARCHAR(80), IN `p_tipo_prenda` VARCHAR(50), IN `p_peso` DECIMAL(5,2), IN `p_fecha_registro` DATE, IN `p_costo` DECIMAL(10,2))   BEGIN
    INSERT INTO servicio (id, tipo_servicio_id, email, tipo_prenda, peso, fecha_registro, costo)
    VALUES (p_id, p_tipo_servicio_id, p_email, p_tipo_prenda, p_peso, p_fecha_registro, p_costo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarEmpleado` (IN `p_nombre` VARCHAR(200))   BEGIN
    SELECT nombre, apepat, apemat
    FROM empleado
    WHERE nombre LIKE CONCAT(p_nombre, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarProductoNombre` (IN `p_nombre` VARCHAR(40))   BEGIN
    SELECT * FROM producto WHERE nombre LIKE CONCAT(p_nombre, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarServicioPorEmail` (IN `p_email` VARCHAR(80))   BEGIN
    SELECT * FROM servicio WHERE email LIKE CONCAT(p_email, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarServicioPorFechaRegistro` (IN `p_fecha_registro` DATE)   BEGIN
    SELECT * FROM servicio WHERE fecha_registro = p_fecha_registro;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarServicioPorId` (IN `p_id` INT)   BEGIN
    SELECT * FROM servicio WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarServiciosPorRangoDeFechas` (IN `startDate` DATE, IN `endDate` DATE)   BEGIN
    SELECT *
    FROM servicio
    WHERE fecha_registro BETWEEN startDate AND endDate;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarServiciosPorTipo` (IN `tipoServicioId` INT)   BEGIN
    SELECT id, tipo_servicio_id, email, tipo_prenda, peso, fecha_registro, costo
    FROM servicio
    WHERE tipo_servicio_id = tipoServicioId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarUsuarioNombre` (IN `p_nombre` VARCHAR(200))   BEGIN
    SELECT * FROM usuario WHERE nombre LIKE CONCAT(p_nombre, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAcceso` (IN `p_login` VARCHAR(80))   BEGIN
    DELETE FROM acceso_usuario
    WHERE login = p_login;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarAccesoEmpleado` (IN `p_login` VARCHAR(80))   BEGIN
    DELETE FROM acceso_empleado
    WHERE login = p_login;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarProducto` (IN `p_codProd` INT(11))   BEGIN
    DELETE FROM producto WHERE codProd = p_codProd;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarServicio` (IN `p_id` INT)   BEGIN
    DELETE FROM servicio WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarUsuario` (IN `p_email` VARCHAR(80))   BEGIN
    DELETE FROM usuario WHERE email = p_email;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarUsuarioEmpleado` (IN `p_email` VARCHAR(80))   BEGIN
    DELETE FROM empleado WHERE email = p_email;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `existeEmpleado` (IN `p_login` VARCHAR(80), IN `p_clave` VARCHAR(20), OUT `p_existe` BOOLEAN)   BEGIN
    DECLARE v_count INT;

    -- Contar si hay coincidencias
    SELECT COUNT(*) INTO v_count
    FROM empleado u
    INNER JOIN acceso_empleado a ON u.email = a.login
    WHERE a.login = p_login AND a.clave = p_clave;

    -- Si existe, p_existe se establece a TRUE
    IF v_count > 0 THEN
        SET p_existe = TRUE;
    ELSE
        SET p_existe = FALSE;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `existeUsuarioPorCredenciales` (IN `p_login` VARCHAR(80), IN `p_clave` VARCHAR(80))   BEGIN
    SELECT 1
    FROM usuario u 
    INNER JOIN acceso_usuario a ON u.email = a.login 
    WHERE a.login = p_login AND a.clave = p_clave
    LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarAccesoEmpleado` (IN `p_login` VARCHAR(80), IN `p_clave` VARCHAR(20))   BEGIN
    INSERT INTO acceso_empleado (login, clave)
    VALUES (p_login, p_clave);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarEmpleado` (IN `p_email` VARCHAR(80), IN `p_nombre` VARCHAR(200), IN `p_apepat` VARCHAR(200), IN `p_apemat` VARCHAR(200), IN `p_dni` VARCHAR(8), IN `p_sexo` INT)   BEGIN
    INSERT INTO empleado (email, nombre, apepat, apemat, dni, sexo)
    VALUES (p_email, p_nombre, p_apepat, p_apemat, p_dni, p_sexo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarProducto` (IN `p_codProd` INT(11), IN `p_nombre` VARCHAR(40), IN `p_marca` VARCHAR(40), IN `p_tamaño` VARCHAR(20), IN `p_precio` DECIMAL(12,2), IN `p_calificacion` INT(11), IN `p_cantidad` INT(11))   BEGIN
    INSERT INTO producto (codProd, nombre, marca, tamaño, precio, calificacion, cantidad)
    VALUES (p_codProd, p_nombre, p_marca, p_tamaño, p_precio, p_calificacion, p_cantidad);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarServicio` (IN `p_tipo_servicio_id` INT(11), IN `p_email` VARCHAR(80), IN `p_tipo_prenda` VARCHAR(50), IN `p_peso` DECIMAL(5,2), IN `p_fecha_registro` DATE, IN `p_costo` DECIMAL(10,2))   BEGIN
    INSERT INTO servicio (tipo_servicio_id, email, tipo_prenda, peso, fecha_registro, costo)
    VALUES (p_tipo_servicio_id, p_email, p_tipo_prenda, p_peso, p_fecha_registro, p_costo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario` (IN `p_email` VARCHAR(80), IN `p_nombre` VARCHAR(200), IN `p_apepat` VARCHAR(200), IN `p_apemat` VARCHAR(200), IN `p_dni` VARCHAR(8), IN `p_sexo` INT(11))   BEGIN
    INSERT INTO usuario (email, nombre, apepat, apemat, dni, sexo)
    VALUES (p_email, p_nombre, p_apepat, p_apemat, p_dni, p_sexo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_acceso_usuario` (IN `p_login` VARCHAR(80), IN `p_clave` VARCHAR(20))   BEGIN
    INSERT INTO acceso_usuario (login, clave)
    VALUES (p_login, p_clave);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProductos` ()   BEGIN
    SELECT * FROM producto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUsuarioEmpleado` ()   BEGIN
    SELECT email, nombre, apepat, apemat, dni, sexo
    FROM empleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarUsuarios` ()   BEGIN
    SELECT * FROM usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerEmpleado` (IN `p_login` VARCHAR(80), IN `p_clave` VARCHAR(20))   BEGIN
    SELECT u.email, u.nombre, u.apepat, u.apemat, u.dni, u.sexo
    FROM empleado u
    INNER JOIN acceso_empleado a ON u.email = a.login
    WHERE a.login = p_login AND a.clave = p_clave;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerMisDatosEmpleado` (IN `p_email` VARCHAR(80))   BEGIN
    SELECT email, nombre, apepat, apemat, dni, sexo
    FROM empleado
    WHERE email = p_email;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerTodosLosServicios` ()   BEGIN
    SELECT * FROM servicio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerUsuarioPorCredenciales` (IN `p_login` VARCHAR(80), IN `p_clave` VARCHAR(80))   BEGIN
    SELECT u.*
    FROM usuario u 
    INNER JOIN acceso_usuario a ON u.email = a.login 
    WHERE a.login = p_login AND a.clave = p_clave;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerUsuarioPorEmail` (IN `p_email` VARCHAR(80))   BEGIN
    SELECT * FROM usuario WHERE email = p_email;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerUsuarioPorLog` (IN `p_login` VARCHAR(80), IN `p_clave` VARCHAR(20))   BEGIN
    SELECT u.email, u.nombre, u.apepat, u.apemat, u.dni, u.sexo
    FROM usuario u
    JOIN acceso_usuario a ON u.email = a.login
    WHERE a.login = p_login AND a.clave = p_clave;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `acceso_empleado`
--

CREATE TABLE `acceso_empleado` (
  `login` varchar(80) NOT NULL,
  `clave` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `acceso_empleado`
--

INSERT INTO `acceso_empleado` (`login`, `clave`) VALUES
('jesus@gmail.com', '123'),
('nayeli@gmail.com', '123'),
('andrea@gmail.com', '123'),
('andreaporras@gmail.com', '123'),
('omar@gmail.com', '123'),
('diego@gmail.com', '123'),
('jhordy@gmail.com', '123'),
('gonzalo@gmail.com', '123'),
('nikol@gmail.com', '123'),
('pedro@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `acceso_usuario`
--

CREATE TABLE `acceso_usuario` (
  `login` varchar(80) NOT NULL,
  `clave` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `acceso_usuario`
--

INSERT INTO `acceso_usuario` (`login`, `clave`) VALUES
('estefani@gmail.com', '1234'),
('jorge@gmail.com', '1234'),
('hernan@gmail.com', '1234'),
('barbara@gmail.com.com', '1234'),
('kristhian@gmail.com.com', '1234'),
('luis@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `email` varchar(80) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apepat` varchar(200) DEFAULT NULL,
  `apemat` varchar(200) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`email`, `nombre`, `apepat`, `apemat`, `dni`, `sexo`) VALUES
('jesus@gmail.com', 'jesus', 'sanchez', 'soto', '40832175', 2),
('jhordy@gmail.com', 'Jhordy', 'Asto', 'Trujillo', '1345678', 2),
('andreaporras@gmail.com', 'Andrea', 'Porras', 'Garibay', '87654321', 1),
('nikol@gmail.com', 'Nikol', 'Carrasco', 'De La Cruz', '81818181', 1),
('nayeli@gmail.com', 'Nayeli', 'Daza', 'Canchanya', '86573421', 1),
('diego@gmail.com', 'Diego', 'Poma', 'Felipe', '87878787', 2),
('andrea@gmail.com', 'Andrea', 'Molina', 'Valverde', '84878784', 1),
('gonzalo@gmail.com', 'Gonzalo', 'Calvo', 'Zevallos', '84878787', 2),
('omar@gmail.com', 'Omar', 'Palomino', 'Galvez', '87878785', 2),
('matias@gmail.com', 'matias', 'perez', 'soto', '87878783', 2),
('pedro@gmail.com', 'pedro', 'montes', 'salas', '40404040', 2);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `codProd` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `marca` varchar(40) DEFAULT NULL,
  `tamaño` varchar(20) DEFAULT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`codProd`, `nombre`, `marca`, `tamaño`, `precio`, `calificacion`, `cantidad`) VALUES
(1, 'DETERMAX QUITA MANCHAS', 'Bubble', 'Galonera 5L', 58.50, 5, 20),
(2, 'SUAVISOFT', 'Bubble', 'Galonera 1L', 25.50, 5, 10),
(3, 'DESENGRASANTE SMART', 'Bubble', 'Frasco 1.9L', 35.90, 4, 12),
(4, 'QUITAMANCHAS POWER', 'Bubble', 'Frasco 1.9L', 35.90, 3, 22),
(5, 'EASY CLEAN ALFOMBRAS', 'Bubble', 'Frasco 1.9L', 35.90, 4, 19),
(6, 'DESENGRASANTE EXPERT', 'Bubble', 'Galonera 3L', 40.50, 5, 11),
(7, 'DETERMAX COLOR', 'Bubble', 'Botella 1.2L', 38.90, 4, 8),
(8, 'DETERMAX QUITA OXIDO', 'Bubble', 'Botella 800ml', 35.50, 5, 20);

-- --------------------------------------------------------

--
-- Table structure for table `servicio`
--

CREATE TABLE `servicio` (
  `id` int(11) NOT NULL,
  `tipo_servicio_id` int(11) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `tipo_prenda` varchar(50) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `servicio`
--

INSERT INTO `servicio` (`id`, `tipo_servicio_id`, `email`, `tipo_prenda`, `peso`, `fecha_registro`, `costo`) VALUES
(4, 1, 'estefani@gmail.com', 'Falda', 45.00, '2024-11-15', 90.00),
(5, 1, 'estefani@gmail.com', 'Falda', 45.00, '2024-11-15', 90.00),
(6, 2, 'jorge@gmail.com', 'Funda Almohada', 345.00, '2024-11-23', 690.00),
(7, 2, 'jorge@gmail.com', 'Funda Almohada', 345.00, '2024-11-23', 690.00),
(8, 1, 'estefani@gmail.com', 'Camisa', 50.00, '2024-01-10', 100.00),
(9, 2, 'jorge@gmail.com', 'Pantalón', 300.00, '2024-02-15', 450.00),
(10, 3, 'estefani@gmail.com', 'Mantelería', 200.00, '2024-03-05', 300.00),
(11, 1, 'estefani@gmail.com', 'Cobertor', 500.00, '2024-04-18', 750.00),
(12, 2, 'jorge@gmail.com', 'Vestido', 100.00, '2024-05-22', 200.00),
(13, 3, 'jorge@gmail.com', 'Funda Almohada', 150.00, '2024-06-12', 250.00),
(14, 1, 'estefani@gmail.com', 'Sábana', 400.00, '2024-07-07', 600.00),
(15, 2, 'jorge@gmail.com', 'Toalla', 80.00, '2024-08-14', 120.00),
(16, 3, 'estefani@gmail.com', 'Blusa', 60.00, '2024-09-21', 90.00),
(17, 1, 'jorge@gmail.com', 'Chaleco', 75.00, '2024-10-03', 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_servicio`
--

CREATE TABLE `tipo_servicio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipo_servicio`
--

INSERT INTO `tipo_servicio` (`id`, `nombre`) VALUES
(1, 'Lavado'),
(2, 'Teñido'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `email` varchar(80) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apepat` varchar(200) DEFAULT NULL,
  `apemat` varchar(200) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `sexo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`email`, `nombre`, `apepat`, `apemat`, `dni`, `sexo`) VALUES
('barbara@gmail.com', 'Barbara', 'Millicent', 'Roberts', '74599053', 1),
('estefani@gmail.com', 'Estefani', 'Aguirre', 'Vilca', '12344678', 1),
('hernan@gmail.com', 'Hernan', 'Perez', 'Jimenez', '48878598', 2),
('jorge@gmail.com', 'Luis', 'Quispe', 'Ramos', '46878798', 2),
('kristhian@gmail.com', 'Kristhian', 'Guerra', 'Rodriguez', '71529026', 2),
('luis@gmail.com', 'Luis', 'Quispe', 'Ramos', '46878798', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_servicio_id` (`tipo_servicio_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`tipo_servicio_id`) REFERENCES `tipo_servicio` (`id`),
  ADD CONSTRAINT `servicio_ibfk_2` FOREIGN KEY (`email`) REFERENCES `usuario` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
