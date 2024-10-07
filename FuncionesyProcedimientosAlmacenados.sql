-- Desactivar la verificación de claves foráneas para evitar problemas durante la creación
SET FOREIGN_KEY_CHECKS = 0;

-- Eliminar procedimientos y funciones existentes si los hay
DROP PROCEDURE IF EXISTS ListarVideojuegosPorPlataforma;
DROP PROCEDURE IF EXISTS ProductosBajoStockPorCategoria;
DROP PROCEDURE IF EXISTS VentasClienteRangoFechas;
DROP FUNCTION IF EXISTS TotalVentasEmpleadoMes;
DROP PROCEDURE IF EXISTS ProductosMasVendidosPeriodo;
DROP FUNCTION IF EXISTS StockDisponibleProducto;
DROP PROCEDURE IF EXISTS OrdenesCompraProveedorUltimoAnio;
DROP PROCEDURE IF EXISTS EmpleadosMasDeUnAnio;
DROP FUNCTION IF EXISTS TotalProductosVendidosDia;
DROP PROCEDURE IF EXISTS VentasProductoEspecifico;

-- Reactivar la verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

DELIMITER //

-- 1. Listar todos los videojuegos de una plataforma específica
CREATE PROCEDURE ListarVideojuegosPorPlataforma(IN plataforma_nombre VARCHAR(45))
BEGIN
    SELECT p.nombre AS Videojuego, p.descripcion, p.precio, p.stock
    FROM Producto p
    JOIN Plataforma pl ON p.plataforma_plataforma_Id = pl.plataforma_Id
    JOIN Categoria c ON p.categoria_categoria_Id = c.categoria_Id
    WHERE pl.nombre = plataforma_nombre
    AND c.nombre = 'Videojuegos';
END //

-- 2. Obtener productos con stock inferior a un valor dado en una categoría específica
CREATE PROCEDURE ProductosBajoStockPorCategoria(IN categoria_nombre VARCHAR(45), IN stock_minimo INT)
BEGIN
    SELECT p.nombre AS Producto, p.descripcion, p.precio, p.stock
    FROM Producto p
    JOIN Categoria c ON p.categoria_categoria_Id = c.categoria_Id
    WHERE c.nombre = categoria_nombre
    AND p.stock < stock_minimo;
END //

-- 3. Mostrar ventas de un cliente en un rango de fechas
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
END //

-- 4. Calcular el total de ventas de un empleado en un mes dado
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
END //

-- 5. Listar los productos más vendidos en un período determinado
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
END //

-- 6. Consultar el stock disponible de un producto por su nombre
CREATE FUNCTION StockDisponibleProducto(producto_nombre VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock_actual INT;
    
    SELECT stock INTO stock_actual
    FROM Producto
    WHERE nombre = producto_nombre;
    
    RETURN COALESCE(stock_actual, 0);
END //

-- 7. Mostrar las órdenes de compra realizadas a un proveedor específico en el último año
CREATE PROCEDURE OrdenesCompraProveedorUltimoAnio(IN proveedor_nombre VARCHAR(255))
BEGIN
    SELECT p.nombre AS Proveedor, p.fecha_Orden, p.cantidad, pr.nombre AS Producto
    FROM Proveedor p
    JOIN Proveedor_Producto pp ON p.proveedor_Id = pp.proveedor_proveedor_Id
    JOIN Producto pr ON pp.producto_producto_Id = pr.producto_Id
    WHERE p.nombre = proveedor_nombre
    AND p.fecha_Orden >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    ORDER BY p.fecha_Orden DESC;
END //

-- 8. Listar los empleados que han trabajado más de un año en la tienda
CREATE PROCEDURE EmpleadosMasDeUnAnio()
BEGIN
    SELECT nombre, puesto_Trabajo, fecha_Contratacion,
           DATEDIFF(CURDATE(), fecha_Contratacion) / 365 AS AniosEnLaTienda
    FROM Empleado
    WHERE fecha_Culminacion IS NULL
    AND DATEDIFF(CURDATE(), fecha_Contratacion) > 365
    ORDER BY fecha_Contratacion;
END //

-- 9. Obtener la cantidad total de productos vendidos en un día específico
CREATE FUNCTION TotalProductosVendidosDia(fecha_venta DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_vendido INT;
    
    SELECT COALESCE(SUM(cantidad), 0) INTO total_vendido
    FROM Venta
    WHERE fecha = fecha_venta;
    
    RETURN total_vendido;
END //

-- 10. Consultar las ventas de un producto específico y cuántas unidades se vendieron
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
END //

DELIMITER ;
