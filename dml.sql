USE Plus_Games; 

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (2,'Accesorios'),(3,'Merchandising'),(1,'Videojuegos');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ciudad`
--


/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ciudad`
--

LOCK TABLES `Ciudad` WRITE;
/*!40000 ALTER TABLE `Ciudad` DISABLE KEYS */;
INSERT INTO `Ciudad` VALUES (2,'Ciudad de México',2),(1,'Los Ángeles',1),(3,'Madrid',3);
/*!40000 ALTER TABLE `Ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clasificacion`


--
-- Dumping data for table `Clasificacion`
--

LOCK TABLES `Clasificacion` WRITE;
/*!40000 ALTER TABLE `Clasificacion` DISABLE KEYS */;
INSERT INTO `Clasificacion` VALUES (1,'E',0,100),(2,'T',10,15),(3,'M',18,100);
/*!40000 ALTER TABLE `Clasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--


--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'Carlos Fernández','carlos@example.com',123,1),(2,'Ana Gómez','ana@example.com',234,2);
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `Direccion`
--

LOCK TABLES `Direccion` WRITE;
/*!40000 ALTER TABLE `Direccion` DISABLE KEYS */;
INSERT INTO `Direccion` VALUES (1,'123 Main St',1),(2,'456 Elm St',2),(3,'789 Oak St',3);
/*!40000 ALTER TABLE `Direccion` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
INSERT INTO `Empleado` VALUES (1,'Juan Pérez','Vendedor','2023-01-15',NULL),(2,'María López','Gerente','2022-03-22',NULL);
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `Empresa_Proveedor`
--

LOCK TABLES `Empresa_Proveedor` WRITE;
/*!40000 ALTER TABLE `Empresa_Proveedor` DISABLE KEYS */;
INSERT INTO `Empresa_Proveedor` VALUES (1,'GameCorp'),(2,'TechAccessories');
/*!40000 ALTER TABLE `Empresa_Proveedor` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `Genero`
--

LOCK TABLES `Genero` WRITE;
/*!40000 ALTER TABLE `Genero` DISABLE KEYS */;
INSERT INTO `Genero` VALUES (1,'Acción'),(2,'Aventura'),(3,'Deportes');
/*!40000 ALTER TABLE `Genero` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
INSERT INTO `Pais` VALUES (3,'España'),(1,'Estados Unidos'),(2,'México');
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `Plataforma`
--

LOCK TABLES `Plataforma` WRITE;
/*!40000 ALTER TABLE `Plataforma` DISABLE KEYS */;
INSERT INTO `Plataforma` VALUES (1,'PC'),(2,'PlayStation 5'),(3,'Xbox Series X');
/*!40000 ALTER TABLE `Plataforma` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
INSERT INTO `Producto` VALUES (1,'Juego de Aventura','Un emocionante juego de aventura.',59,100,2,1,2,1),(2,'Accesorio Gamer','Un accesorio para mejorar la experiencia de juego.',29,50,1,1,3,2);
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `Proveedor`
--

LOCK TABLES `Proveedor` WRITE;
/*!40000 ALTER TABLE `Proveedor` DISABLE KEYS */;
INSERT INTO `Proveedor` VALUES (1,'Proveedor A',345,1,1,1,'2023-10-01',100),(2,'Proveedor B',456,2,2,2,'2023-10-02',200);
/*!40000 ALTER TABLE `Proveedor` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `Proveedor_Producto`
--

LOCK TABLES `Proveedor_Producto` WRITE;
/*!40000 ALTER TABLE `Proveedor_Producto` DISABLE KEYS */;
INSERT INTO `Proveedor_Producto` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `Proveedor_Producto` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping data for table `Venta`
--

LOCK TABLES `Venta` WRITE;
/*!40000 ALTER TABLE `Venta` DISABLE KEYS */;
INSERT INTO `Venta` VALUES (5,'2024-10-01',1,1,1),(6,'2024-10-02',2,2,2);
/*!40000 ALTER TABLE `Venta` ENABLE KEYS */;
UNLOCK TABLES;

