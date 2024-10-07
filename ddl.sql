CREATE TABLE `Categoria` (
  `categoria_Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`categoria_Id`),
  UNIQUE KEY `Categoría_id_UNIQUE` (`categoria_Id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Ciudad`
--

DROP TABLE IF EXISTS `Ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ciudad` (
  `ciudad_Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `pais_pais_Id` int NOT NULL,
  PRIMARY KEY (`ciudad_Id`,`pais_pais_Id`),
  UNIQUE KEY `ciudad_id_UNIQUE` (`ciudad_Id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_Ciudad_Pais1_idx` (`pais_pais_Id`),
  CONSTRAINT `fk_Ciudad_Pais1` FOREIGN KEY (`pais_pais_Id`) REFERENCES `Pais` (`país_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Clasificacion`
--

DROP TABLE IF EXISTS `Clasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clasificacion` (
  `clasificación_Id` int NOT NULL AUTO_INCREMENT,
  `PGI` varchar(255) NOT NULL,
  `edad_Minima` int NOT NULL,
  `edad_máxima` int NOT NULL,
  PRIMARY KEY (`clasificación_Id`),
  UNIQUE KEY `clasificación_id_UNIQUE` (`clasificación_Id`),
  UNIQUE KEY `PGI_UNIQUE` (`PGI`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `cliente_Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` int NOT NULL,
  `direccion_direccion_Id` int NOT NULL,
  PRIMARY KEY (`cliente_Id`,`direccion_direccion_Id`),
  UNIQUE KEY `cliente_id_UNIQUE` (`cliente_Id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  UNIQUE KEY `teléfono_UNIQUE` (`telefono`),
  KEY `fk_Cliente_Direccion1_idx` (`direccion_direccion_Id`),
  CONSTRAINT `fk_Cliente_Direccion1` FOREIGN KEY (`direccion_direccion_Id`) REFERENCES `Direccion` (`direccion_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Direccion`
--

DROP TABLE IF EXISTS `Direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Direccion` (
  `direccion_Id` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(45) NOT NULL,
  `ciudad_ciudad_Id` int NOT NULL,
  PRIMARY KEY (`direccion_Id`,`ciudad_ciudad_Id`),
  UNIQUE KEY `dirección_id_UNIQUE` (`direccion_Id`),
  KEY `fk_Direccion_Ciudad1_idx` (`ciudad_ciudad_Id`),
  CONSTRAINT `fk_Direccion_Ciudad1` FOREIGN KEY (`ciudad_ciudad_Id`) REFERENCES `Ciudad` (`ciudad_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleado` (
  `empleado_Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `puesto_Trabajo` varchar(255) NOT NULL,
  `fecha_Contratacion` date NOT NULL,
  `fecha_Culminacion` date DEFAULT NULL,
  PRIMARY KEY (`empleado_Id`),
  UNIQUE KEY `empleado_Id_UNIQUE` (`empleado_Id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `puesto_Trabajo_UNIQUE` (`puesto_Trabajo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Empresa_Proveedor`
--

DROP TABLE IF EXISTS `Empresa_Proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa_Proveedor` (
  `empresa_Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`empresa_Id`),
  UNIQUE KEY `empresa_Id_UNIQUE` (`empresa_Id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Genero`
--

DROP TABLE IF EXISTS `Genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genero` (
  `genero_Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`genero_Id`),
  UNIQUE KEY `género_id_UNIQUE` (`genero_Id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pais` (
  `país_Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`país_Id`),
  UNIQUE KEY `país_id_UNIQUE` (`país_Id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Plataforma`
--

DROP TABLE IF EXISTS `Plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plataforma` (
  `plataforma_Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`plataforma_Id`),
  UNIQUE KEY `plataforma_id_UNIQUE` (`plataforma_Id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producto` (
  `producto_Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` int DEFAULT NULL,
  `stock` int NOT NULL,
  `genero_genero_Id` int NOT NULL,
  `clasificacion_clasificación_Id` int NOT NULL,
  `plataforma_plataforma_Id` int NOT NULL,
  `categoria_categoria_Id` int NOT NULL,
  PRIMARY KEY (`producto_Id`,`genero_genero_Id`,`clasificacion_clasificación_Id`,`plataforma_plataforma_Id`,`categoria_categoria_Id`),
  UNIQUE KEY `producto_id_UNIQUE` (`producto_Id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_Producto_Genero1_idx` (`genero_genero_Id`),
  KEY `fk_Producto_Clasificacion1_idx` (`clasificacion_clasificación_Id`),
  KEY `fk_Producto_Plataforma1_idx` (`plataforma_plataforma_Id`),
  KEY `fk_Producto_Categoria1_idx` (`categoria_categoria_Id`),
  CONSTRAINT `fk_Producto_Categoria1` FOREIGN KEY (`categoria_categoria_Id`) REFERENCES `Categoria` (`categoria_Id`),
  CONSTRAINT `fk_Producto_Clasificacion1` FOREIGN KEY (`clasificacion_clasificación_Id`) REFERENCES `Clasificacion` (`clasificación_Id`),
  CONSTRAINT `fk_Producto_Genero1` FOREIGN KEY (`genero_genero_Id`) REFERENCES `Genero` (`genero_Id`),
  CONSTRAINT `fk_Producto_Plataforma1` FOREIGN KEY (`plataforma_plataforma_Id`) REFERENCES `Plataforma` (`plataforma_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Proveedor`
--

DROP TABLE IF EXISTS `Proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedor` (
  `proveedor_Id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `telefono` int NOT NULL,
  `direccion_direccion_Id` int NOT NULL,
  `direccion_Ciudad_ciudad_Id` int NOT NULL,
  `empresa_empresa_Id` int NOT NULL,
  `fecha_Orden` date NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`proveedor_Id`,`direccion_direccion_Id`,`direccion_Ciudad_ciudad_Id`,`empresa_empresa_Id`),
  UNIQUE KEY `proveedor_Id_UNIQUE` (`proveedor_Id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  KEY `fk_Proveedor_Direccion1_idx` (`direccion_direccion_Id`,`direccion_Ciudad_ciudad_Id`),
  KEY `fk_Proveedor_Empresa1_idx` (`empresa_empresa_Id`),
  CONSTRAINT `fk_Proveedor_Direccion1` FOREIGN KEY (`direccion_direccion_Id`, `direccion_Ciudad_ciudad_Id`) REFERENCES `Direccion` (`direccion_Id`, `ciudad_ciudad_Id`),
  CONSTRAINT `fk_Proveedor_Empresa1` FOREIGN KEY (`empresa_empresa_Id`) REFERENCES `Empresa_Proveedor` (`empresa_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Proveedor_Producto`
--

DROP TABLE IF EXISTS `Proveedor_Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedor_Producto` (
  `proveedor_proveedor_Id` int NOT NULL,
  `producto_producto_Id` int NOT NULL,
  PRIMARY KEY (`proveedor_proveedor_Id`,`producto_producto_Id`),
  KEY `fk_Proveedor_has_Producto_Producto1_idx` (`producto_producto_Id`),
  KEY `fk_Proveedor_has_Producto_Proveedor1_idx` (`proveedor_proveedor_Id`),
  CONSTRAINT `fk_Proveedor_has_Producto_Producto1` FOREIGN KEY (`producto_producto_Id`) REFERENCES `Producto` (`producto_Id`),
  CONSTRAINT `fk_Proveedor_has_Producto_Proveedor1` FOREIGN KEY (`proveedor_proveedor_Id`) REFERENCES `Proveedor` (`proveedor_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Venta`
--

DROP TABLE IF EXISTS `Venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Venta` (
  `venta_Id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `cantidad` int NOT NULL,
  `empleado_empleado_Id` int NOT NULL,
  `cliente_cliente_Id` int NOT NULL,
  PRIMARY KEY (`venta_Id`,`empleado_empleado_Id`,`cliente_cliente_Id`),
  UNIQUE KEY `venta_Id_UNIQUE` (`venta_Id`),
  KEY `fk_Venta_Empleado_idx` (`empleado_empleado_Id`),
  KEY `fk_Venta_Cliente1_idx` (`cliente_cliente_Id`),
  CONSTRAINT `fk_Venta_Cliente1` FOREIGN KEY (`cliente_cliente_Id`) REFERENCES `Cliente` (`cliente_Id`),
  CONSTRAINT `fk_Venta_Empleado` FOREIGN KEY (`empleado_empleado_Id`) REFERENCES `Empleado` (`empleado_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Venta_Producto`
--

DROP TABLE IF EXISTS `Venta_Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Venta_Producto` (
  `Venta_venta_Id` int NOT NULL,
  `Producto_producto_Id` int NOT NULL,
  PRIMARY KEY (`Venta_venta_Id`,`Producto_producto_Id`),
  KEY `fk_Venta_has_Producto_Producto1_idx` (`Producto_producto_Id`),
  KEY `fk_Venta_has_Producto_Venta1_idx` (`Venta_venta_Id`),
  CONSTRAINT `fk_Venta_has_Producto_Producto1` FOREIGN KEY (`Producto_producto_Id`) REFERENCES `Producto` (`producto_Id`),
  CONSTRAINT `fk_Venta_has_Producto_Venta1` FOREIGN KEY (`Venta_venta_Id`) REFERENCES `Venta` (`venta_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
