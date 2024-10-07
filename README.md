# 👾 PLUS GAMES 🎮

El diseño de la base de datos para una tienda especializada en la venta de videojuegos, consolas y accesorios debe ser robusto y flexible para almacenar adecuadamente la información clave sobre productos, clientes, ventas, empleados y proveedores. Esta base de datos permitirá gestionar de forma eficiente los inventarios, ventas, relaciones con clientes y proveedores, así como el seguimiento de las órdenes de compra y la atención proporcionada por los empleados. La base de datos será relacional, lo que facilitará la organización de los datos en diferentes entidades relacionadas entre sí para asegurar la integridad y consistencia de la información. ✨

## 🏁 Requerimientos

- Tener mínimo 10 entidades
- Se deben plantear 40 consultas DISTINTAS
- Cada consulta con su descripción y solución
-  Anexar los respectivos archivos:
   - ddL.sql -> creaciones (base de datos y tablas)
   - dML.sql -> Inserciones (Minimo 20 registros por entidad principales) 🎉

## 📋 Entidades - Relaciones

1. Producto
- bproducto_Id 
- nombre
- descripcion
- precio
- stock
Relaciones con:
- Género
- Clasificación
- Plataforma
- Categoría

2. Cliente
- cliente_Id 
- nombre
- correo
- telefono
Relación con:
- Dirección

3. Empleado
- empleado_Id 
- nombre
- puesto_Trabajo
- fecha_Contratacion
- fecha_Culminacion

4. Venta
venta_Id 
- fecha
- cantidad
- Relaciones con:

5. Empleado
- Cliente
- Producto (mediante tabla intermedia)

6. Categoría
- categoria_Id 
- nombre
- Valores: Videojuegos, Accesorios, Merchandising

7. Plataforma
- plataforma_Id 
- nombre
- Valores: PC, PlayStation 5, Xbox Series X

8. Género
- genero_Id 
- nombre
- Valores: Acción, Aventura, Deportes

9. Clasificación
- clasificacion_Id 
- PGI
- edad_Minima
- edad_Maxima

10. País
- pais_Id 
- nombre

11. Ciudad
- ciudad_Id (PK)
- nombre
- Relación con País

12. Dirección
- direccion_Id (PK)
- direccion
- Relación con Ciudad

13. Empresa_Proveedor
- empresa_Id (PK)
- nombre

14. Proveedor
- proveedor_Id (PK)
- nombre
- telefono
- fecha_Orden
- cantidad
Relaciones con:
- Dirección
- Empresa
- Producto (mediante tabla intermedia)

## 🚀 Tecnologias utilizadas

 Las tecnologías que se utilizaron para este proyecto fueron MySQL como la base de datos relacional, Drawio.io para la realización de diagramas y MySQL Workbench como entorno de desarrollo. 🌟

## Diagrama ER - Modelo Relacional

![Diagrama_Modelo_Relacional](https://github.com/user-attachments/assets/4d2970a6-fa21-4c12-b449-d610989dc6a7)

Este diagrama representa un diseño detallado y estructurado de una base de datos relacional con múltiples entidades interrelacionadas.

1. Se creó un esquema de base de datos relacional con múltiples tablas interconectadas.
2. Las columnas de cada tabla están listadas con sus nombres y tipos de datos (como INT, NVARCHAR, etc.).
3. Se establecieron relaciones entre las tablas mediante líneas de conexión, lo que indica las claves foráneas y las asociaciones entre entidades.
4. Algunas tablas parecen ser tablas de unión, lo que indica relaciones muchos a muchos entre otras entidades.
5. La organización visual del diagrama sugiere una jerarquía o agrupación lógica de las entidades relacionadas.
6. La presencia de múltiples tablas interconectadas sugiere un sistema de base de datos normalizado, diseñado para minimizar la redundancia y mantener la integridad de los datos.

## Consultas
# 1. Listar todos los videojuegos de una plataforma específica (por ejemplo, "PlayStation").
```sql
CREATE PROCEDURE ListarVideojuegosPorPlataforma(IN plataforma_nombre VARCHAR(45))
BEGIN
    SELECT p.nombre AS Videojuego, p.descripcion, p.precio, p.stock
    FROM Producto p
    JOIN Plataforma pl ON p.plataforma_plataforma_Id = pl.plataforma_Id
    JOIN Categoria c ON p.categoria_categoria_Id = c.categoria_Id
    WHERE pl.nombre = plataforma_nombre
    AND c.nombre = 'Videojuegos';
END
```


# 2. Obtener todos los productos en una categoría (videojuegos, consolas o accesorios) cuyo stock sea inferior a un valor dado.
```sql
CREATE PROCEDURE ProductosBajoStockPorCategoria(IN categoria_nombre VARCHAR(45), IN stock_minimo INT)
BEGIN
    SELECT p.nombre AS Producto, p.descripcion, p.precio, p.stock
    FROM Producto p
    JOIN Categoria c ON p.categoria_categoria_Id = c.categoria_Id
    WHERE c.nombre = categoria_nombre
    AND p.stock < stock_minimo;
END
```


# 3. Mostrar todas las ventas realizadas por un cliente específico en un rango de fechas.
```sql
CREATE PROCEDURE VentasClienteRangoFechas(
    IN cliente_nombre VARCHAR(255),
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    SELECT v.venta_Id, v.fecha, v.cantidad, p.nombre AS Producto, p.precio
    FROM Venta v
    JOIN Cliente c ON v.cliente_cliente_Id = c.cliente_Id
    JOIN Venta_Producto vp ON v.venta_Id = vp.Venta_venta_Id
    JOIN Producto p ON vp.Producto_producto_Id = p.producto_Id
    WHERE c.nombre = cliente_nombre
    AND v.fecha BETWEEN fecha_inicio AND fecha_fin;
END
```

# 4. Calcular el total de ventas de un empleado en un mes dado.
```sql
CREATE FUNCTION TotalVentasEmpleadoMes(
    empleado_nombre VARCHAR(255),
    anio INT,
    mes INT
) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_ventas DECIMAL(10,2);
    
    SELECT COALESCE(SUM(p.precio * v.cantidad), 0) INTO total_ventas
    FROM Venta v
    JOIN Empleado e ON v.empleado_empleado_Id = e.empleado_Id
    JOIN Venta_Producto vp ON v.venta_Id = vp.Venta_venta_Id
    JOIN Producto p ON vp.Producto_producto_Id = p.producto_Id
    WHERE e.nombre = empleado_nombre
    AND YEAR(v.fecha) = anio
    AND MONTH(v.fecha) = mes;
    
    RETURN total_ventas;
END
```

# 5. Listar los productos más vendidos en un período determinado.
```sql
CREATE PROCEDURE ProductosMasVendidosPeriodo(
    IN fecha_inicio DATE,
    IN fecha_fin DATE,
    IN limite INT
)
BEGIN
    SELECT p.nombre AS Producto, SUM(v.cantidad) AS TotalVendido
    FROM Producto p
    JOIN Venta_Producto vp ON p.producto_Id = vp.Producto_producto_Id
    JOIN Venta v ON vp.Venta_venta_Id = v.venta_Id
    WHERE v.fecha BETWEEN fecha_inicio AND fecha_fin
    GROUP BY p.producto_Id
    ORDER BY TotalVendido DESC
    LIMIT limite;
END
```

# 6. Consultar el stock disponible de un producto por su nombre.
```sql
CREATE FUNCTION StockDisponibleProducto(producto_nombre VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock_actual INT;
    
    SELECT stock INTO stock_actual
    FROM Producto
    WHERE nombre = producto_nombre;
    
    RETURN COALESCE(stock_actual, 0);
END
```

# 7. Mostrar las órdenes de compra realizadas a un proveedor específico en el último año.
```sql
CREATE PROCEDURE OrdenesCompraProveedorUltimoAnio(IN proveedor_nombre VARCHAR(255))
BEGIN
    SELECT p.nombre AS Proveedor, p.fecha_Orden, p.cantidad, pr.nombre AS Producto
    FROM Proveedor p
    JOIN Proveedor_Producto pp ON p.proveedor_Id = pp.proveedor_proveedor_Id
    JOIN Producto pr ON pp.producto_producto_Id = pr.producto_Id
    WHERE p.nombre = proveedor_nombre
    AND p.fecha_Orden >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    ORDER BY p.fecha_Orden DESC;
END
```

# 8. Listar los empleados que han trabajado más de un año en la tienda.
```sql
CREATE PROCEDURE EmpleadosMasDeUnAnio()
BEGIN
    SELECT nombre, puesto_Trabajo, fecha_Contratacion,
           DATEDIFF(CURDATE(), fecha_Contratacion) / 365 AS AniosEnLaTienda
    FROM Empleado
    WHERE fecha_Culminacion IS NULL
    AND DATEDIFF(CURDATE(), fecha_Contratacion) > 365
    ORDER BY fecha_Contratacion;
END
```

# 9. Obtener la cantidad total de productos vendidos en un día específico.
```sql
CREATE FUNCTION TotalProductosVendidosDia(fecha_venta DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_vendido INT;
    
    SELECT COALESCE(SUM(cantidad), 0) INTO total_vendido
    FROM Venta
    WHERE fecha = fecha_venta;
    
    RETURN total_vendido;
END
```

# 10. Consultar las ventas de un producto específico (por nombre o ID) y cuántas unidades se vendieron.
```sql
CREATE PROCEDURE VentasProductoEspecifico(IN producto_nombre VARCHAR(255))
BEGIN
    SELECT p.nombre AS Producto, v.fecha, v.cantidad
    FROM Producto p
    JOIN Venta_Producto vp ON p.producto_Id = vp.Producto_producto_Id
    JOIN Venta v ON vp.Venta_venta_Id = v.venta_Id
    WHERE p.nombre = producto_nombre
    ORDER BY v.fecha DESC;
    
    SELECT p.nombre AS Producto, SUM(v.cantidad) AS TotalUnidadesVendidas
    FROM Producto p
    JOIN Venta_Producto vp ON p.producto_Id = vp.Producto_producto_Id
    JOIN Venta v ON vp.Venta_venta_Id = v.venta_Id
    WHERE p.nombre = producto_nombre
    GROUP BY p.producto_Id;
END
```

## ✍️ Autor
- Alvaro Martinez 
- Juliana Numa 💻
- Juan David Conde
