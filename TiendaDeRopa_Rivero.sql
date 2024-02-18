CREATE SCHEMA Tienda_de_ropa_rivero_1;
USE Tienda_de_ropa_rivero_1;

-- TABLA DE CLIENTES
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    dni INT NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

-- TABLA DE PRODUCTOS
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo_producto VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);
-- TABLA DE PROVEEDORES
CREATE TABLE proveedores(
	nombre VARCHAR (30) PRIMARY KEY NOT NULL,
    tipo_producto VARCHAR (30) NOT NULL,
    email VARCHAR (30) NOT NULL,
    telefono INT(30) NOT NULL
    );
    
-- TABLA DE PEDIDOS A PROVEEDORES
CREATE TABLE pedidos_proveedores(
	id_orden INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT NOT NULL,
    fecha DATE NOT NULL,
    nombre VARCHAR(30) NOT NULL,
	FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (nombre) REFERENCES proveedores(nombre)
    );
    

-- TABLA DE VENTAS
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_venta DATE NOT NULL,
    total_venta DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- TABLA INTERMEDIA PARA ALMACENAR LOS PRODUCTOS DE CADA VENTA
CREATE TABLE detalles_ventas (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    id_cliente INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    total_producto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- TABLA DE DETALLES ESPECIFICOS PARA LOS PRODUCTOS
CREATE TABLE detalles_productos (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    color VARCHAR(15) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    talle VARCHAR(5) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Agregar datos de clientes
INSERT INTO clientes (nombre, email, dni, direccion) 
VALUES
    ('Rodrigo Gamarra', 'rod.gamarra@hotmail.com', 42367831, 'Av Presidente Peron 5636, Santa fe'),
    ('Matias Duarte', 'mati.duarte@email.com', 38902311, 'Peschel 4562, Mendoza'),
    ('Claudia Lopez', 'clau.lopez@yahoo.com', 25678901, 'Calle N37 162, La Plata'),
    ('Miguel Gutierrez', 'migue@gmail.com', '45600200', 'Av Bradley 1240, El Palomar'),
    ('Ana García', 'ana.garcia@example.com', 12345678, 'Calle 1230, Bahia Blanca'),
    ('Pedro Martínez', 'pedro.martinez@example.com', 23456789, 'Av Rosas 4560, Mar del plata '),
    ('Laura Fernández', 'laura.fernandez@example.com', 34567890, 'Los pensamientos 7890, Ciudad Jardin'),
    ('Javier Rodríguez', 'javier.rodriguez@example.com', 45678901, 'Av Marconi 4550, Tucuman'),
    ('Cecilia López', 'cecilia.lopez@example.com', 56789012, 'Manuel Belgrano 345, Moron'),
    ('Carlos González', 'carlos.gonzalez@example.com', 67890123, 'Calle N15 290, La Plata'),
    ('Sofía Pérez', 'sofia.perez@example.com', 78901234, 'Av Santa Fe 901, Capital Federal'),
    ('Alejandro Sánchez', 'alejandro.sanchez@example.com', 89012345, 'La paz 3856, Resistencia'),
    ('Lucía Martín', 'lucia.martin@example.com', 90123456, 'Figueroa Alcorta 567, Santiago del Estero'),
    ('David Hernández', 'david.hernandez@example.com', 11223344, 'Buen viaje 4570, Tandil'),
    ('Elena Gómez', 'elena.gomez@example.com', 44556677, 'Juan B Justo 4567, Mendoza');
    
-- Agregar datos de productos
INSERT INTO productos (tipo_producto, precio, stock) 
VALUES
    ('Pantalones de jean', 19999.99, 50),
    ('Remera de Algodón', 9999.99, 100),
    ('Zapatillas Deportivas', 49999.99, 30),
    ('Camisa Formal', 24999.99, 40),
    ('Vestido de Noche', 35999.99, 20),
    ('Sweater de Lana', 17999.99, 60),
    ('Sombrero de Verano', 8999.99, 80),
    ('Chaqueta de Cuero', 54999.99, 25),
    ('Bufanda de Algodon', 4999.99, 120),
    ('Bolso Elegante', 29999.99, 35),
    ('Gafas de Sol', 12999.99, 70),
    ('Traje de Baño', 21999.99, 15),
    ('Pantalones Deportivos', 15999.99, 55),
    ('Gorra de Béisbol', 6999.99, 90),
    ('Sandalia Casual', 37999.99, 28);
    

-- Agregar datos de proveedores    
INSERT INTO proveedores (nombre, tipo_producto, email, telefono) VALUES
    ('FashionStyle', 'Pantalones de jean', 'fashionstyle@example.com', 1134567896),
    ('EleganceShoes', 'Remera de Algodón', 'eleganceshoes@example.com', 1187654321),
    ('AccessoriesHub', 'Zapatillas Deportivas', 'accessorieshub@example.com', 1167890124),
    ('FormalFashionCo', 'Camisa Formal', 'formalfashionco@example.com', 1145678903),
    ('SportsFootwear', 'Vestido de Noche', 'sportsfootwear@example.com', 1189012345),
    ('TinyTrend', 'Sweater de Lana', 'tinytrend@example.com', 1134567891),
    ('ChicBags', 'Sombrero de Verano', 'chicbags@example.com', 110123567),
    ('BeachwearParadise', 'Chaqueta de Cuero', 'beachwearparadise@example.com', 115678902),
    ('HatHeaven', 'Bufanda de Algodon', 'hatheaven@example.com', 1154321098),
    ('CasualWardrobe', 'Bolso Elegante', 'casualwardrobe@example.com', 1110987654),
    ('ElegantFootsteps', 'Gafas de Sol', 'elegantfootsteps@example.com', 1109876543),
    ('JewelJunction', 'Traje de Baño', 'jeweljunction@example.com', 1176543210),
    ('IntimateStyles', 'Pantalones Deportivos', 'intimatestyles@example.com', 1143210987),
    ('WinterWardrobe', 'Gorra de Béisbol', 'winterwardrobe@example.com', 1121098765),
    ('SummerStyles', 'Sandalia Casual', 'summerstyles@example.com', 1134567890);
    
-- Agregamos datos a la tabla pedidos a proveedores
INSERT INTO pedidos_proveedores (id_producto, fecha, nombre) VALUES
    (1, '2022-06-01', 'FashionStyle'),
    (2, '2022-06-02', 'EleganceShoes'),
    (3, '2023-06-03', 'AccessoriesHub'),
    (4, '2023-06-04', 'FormalFashionCo'),
    (5, '2021-06-05', 'SportsFootwear'),
    (6, '2020-06-06', 'TinyTrend'),
    (7, '2022-06-07', 'ChicBags'),
    (8, '2021-06-08', 'BeachwearParadise'),
    (9, '2021-06-09', 'HatHeaven'),
    (10, '2022-06-10', 'CasualWardrobe'),
    (11, '2023-06-11', 'ElegantFootsteps'),
    (12, '2022-06-12', 'JewelJunction'),
    (13, '2023-06-13', 'IntimateStyles'),
    (14, '2023-06-14', 'WinterWardrobe'),
    (15, '2022-06-15', 'SummerStyles');
    
-- Agregar datos a la tabla ventas
INSERT INTO ventas (id_cliente, fecha_venta, total_venta) 
VALUES
    (1, '2024-01-05', 39999.99),
    (2, '2024-01-07', 29999.97),
    (3, '2024-01-15', 59999.99),
    (4, '2021-02-02', 17999.95),
    (5, '2021-02-10', 24999.98),
    (6, '2022-02-18', 42999.96),
    (7, '2022-03-01', 15999.99),
    (8, '2023-03-09', 31999.94),
    (9, '2023-03-17', 49999.97),
    (10, '2021-03-25', 37999.93),
    (11, '2020-04-03', 28999.98),
    (12, '2021-04-11', 20999.95),
    (13, '2022-04-19', 14999.99),
    (14, '2022-04-27', 56999.92),
    (15, '2023-05-05', 45999.97);
    
-- Agregar datos a la tabla detalles_pedido
INSERT INTO detalles_ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, total_producto) 
VALUES
    (1, 1, 1, 2, 19999.99, 39999.99),
    (2, 2, 2, 3, 9999.99, 29999.97),
    (3, 3, 3, 1, 59999.99, 59999.99),
    (4, 4, 4, 4, 4499.99, 17999.95),
    (5, 5, 5, 2, 12499.99, 24999.98),
    (6, 6, 6, 3, 14333.32, 42999.96),
    (7, 7, 7, 1, 15999.99, 15999.99),
    (8, 8, 8, 2, 15999.97, 31999.94),
    (9, 9, 9, 1, 49999.97, 49999.97),
    (10, 10, 10, 3, 12666.64, 37999.92),
    (11, 11, 11, 2, 14499.99, 28999.98),
    (12, 12, 12, 1, 20999.95, 20999.95),
    (13, 13, 13, 4, 3749.99, 14999.96),
    (14, 14, 14, 2, 28499.96, 56999.92),
    (15, 15, 15, 3, 15333.32, 45999.96);
    
-- Agregar datos a la tabla detalles_productos
INSERT INTO detalles_productos (id_producto, color, marca, talle) 
VALUES
    (1,'Azul', 'Levis', '40'),
    (2,'Negro', 'GAP', 'L'),
    (3,'Gris', 'Nike', '42'),
    (4, 'Rojo', 'Adidas', '38'),
    (5, 'Blanco', 'Puma', 'M'),
    (6, 'Verde', 'Under Armour', '44'),
    (7, 'Amarillo', 'Converse', '39'),
    (8, 'Marrón', 'Reebok', 'XL'),
    (9, 'Celeste', 'New Balance', '41'),
    (10, 'Morado', 'Vans', 'S'),
    (11, 'Rosa', 'Fila', '36'),
    (12, 'Naranja', 'Tommy Hilfiger', '37'),
    (13, 'Beige', 'Calvin Klein', '43'),
    (14, 'Turquesa', 'Guess', '38'),
    (15, 'Azul Marino', 'H&M', '39');
    
    SET SQL_SAFE_UPDATES = 0;
    
-- VISTAS
-- Agregaremos una vista para ver la direccion de cada cliente para el envio de los productos
CREATE OR REPLACE VIEW vista_direcciones_ventas_clientes AS
SELECT c.id_cliente, c.nombre, c.direccion, v.id_venta
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente;

SELECT * FROM vista_direcciones_ventas_clientes;

-- Agregaremos una vista para ver todas las ventas del año 2023
CREATE OR REPLACE VIEW vista_ventas_2023 AS
SELECT *
FROM ventas
WHERE YEAR(fecha_venta) = 2023;
SELECT * FROM vista_ventas_2023;

-- Agregaremos una vista para ver todas las ventas del año 2022
CREATE OR REPLACE VIEW vista_ventas_2022 AS
SELECT *
FROM ventas
WHERE YEAR(fecha_venta) = 2022;
SELECT * FROM vista_ventas_2022;

-- Agregatemos una vista para ver todas las ventas mayores a 30.000,00 
-- ya que iran con un cupon de descuento en una proxima compra
CREATE OR REPLACE VIEW vista_ventas_mayores_30000_con_clientes AS
SELECT v.id_venta, v.id_cliente, c.nombre AS nombre_cliente, c.email, c.dni, c.direccion, v.fecha_venta, v.total_venta
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
WHERE v.total_venta > 30000.00;
SELECT * FROM vista_ventas_mayores_30000_con_clientes;

-- Agregaremos una vista para observar todos los pedidos a proveedores en el año 2023
CREATE OR REPLACE VIEW vista_pedidos_proveedores_2023 AS
SELECT *
FROM pedidos_proveedores
WHERE YEAR(fecha) = 2023;
SELECT * FROM vista_pedidos_proveedores_2023;

-- Agregaremos una vista para observar todos los pedidos a proveedores en el año 2022
CREATE OR REPLACE VIEW vista_pedidos_proveedores_2022 AS
SELECT *
FROM pedidos_proveedores
WHERE YEAR(fecha) = 2022;
SELECT * FROM vista_pedidos_proveedores_2022;

-- FUNCIONES
-- Agregaremos una funcion que permita calcular el total de ingresos de las ventas de 2023
DELIMITER $$

CREATE FUNCTION calcularTotalVentas2023() RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(total_venta) INTO total FROM ventas WHERE YEAR(fecha_venta) = 2023;
    RETURN COALESCE(total, 0);
END $$

DELIMITER ;
SELECT calcularTotalVentas2023() AS total_ventas_2023;

-- Agregaremos una funcion que nos permita calcular el promedio de ventas del año 2023
-- Calculando el monto total anual dividido la cantiad de ventas
DELIMITER $$

CREATE FUNCTION calcularPromedioVentas2023() RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    DECLARE cantidad INT;
    DECLARE promedio DECIMAL(10, 2);

    SELECT SUM(total_venta), COUNT(*) INTO total, cantidad
    FROM ventas
    WHERE YEAR(fecha_venta) = 2023;

    IF cantidad > 0 THEN
        SET promedio = total / cantidad;
    ELSE
        SET promedio = 0;
    END IF;

    RETURN promedio;
END $$

DELIMITER ;
SELECT calcularPromedioVentas2023() AS promedio_ventas_2023;

-- STORED PROCEDURES

-- Agregaremos un stored procedures que advierta cuando algun tipo de producto
-- tenga un stock inferior a 30 unidades
DELIMITER $$

CREATE PROCEDURE notificarStockBajo(producto_id INT)
BEGIN
    DECLARE stock_actual INT;
    
    -- Obtendremos el stock actual del producto
    SELECT stock INTO stock_actual
    FROM productos
    WHERE id_producto = producto_id;

    -- Verificaremos si el stock es menor a 30
    IF stock_actual < 30 THEN
        -- Si el stock es menor a 30
        SELECT CONCAT('¡Advertencia! Stock bajo para el producto ', producto_id, '. Stock actual: ', stock_actual) AS mensaje;
    ELSE
        -- Si el stock es mayor a 30
        SELECT CONCAT('Stock suficiente para el producto ', producto_id, '. Stock actual: ', stock_actual) AS mensaje;
    END IF;
END $$

DELIMITER ;
-- Aqui colocaremos el id_producto del producto 
-- para el cual deseamos obtener la informacion de stock
CALL notificarStockBajo(1);

-- Agregaremos un SP que realizara una actualizacion del stock cada vez por cada venta
DELIMITER $$

CREATE PROCEDURE actualizarStock(
    IN cliente_id INT,
    IN producto_id INT,
    IN cantidad INT,
    OUT total_venta DECIMAL(10, 2)
)
BEGIN
    DECLARE precio_producto DECIMAL(10, 2);
    
    -- Obtendremos el precio del producto
    SELECT precio INTO precio_producto
    FROM productos
    WHERE id_producto = producto_id;

    -- Calcularemos el total de la venta
    SET total_venta = precio_producto * cantidad;

    -- Actualizaremos el stock y registraremos la venta
    UPDATE productos
    SET stock = stock - cantidad
    WHERE id_producto = producto_id;

    INSERT INTO ventas (id_cliente, fecha_venta, total_venta)
    VALUES (cliente_id, CURDATE(), total_venta);
END $$

DELIMITER ;
-- Para llamar al SP deberemos indicar 
-- El id_cliente que realiza la compra
-- El id_producto que identifica que producto compra
-- La cantidad de productos que el cliente esta comprando
-- Y la variable que calculara el valor total de la venta
CALL actualizarStock(1, 1, 2, @total_venta);
SELECT @total_venta AS total_venta;

-- TRIGGERS

-- Agregaremos un trigger que nos permita registrar la fecha de la ultima venta de cada producto
-- esto nos permitira saber que productos no se venden hace mucho tiempo y no son deseados

-- Creamos la tabla para insertar los registros del trigger
CREATE TABLE ultima_venta_producto (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    ultima_fecha_venta DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    UNIQUE (id_producto, ultima_fecha_venta)
);
DELIMITER $$

CREATE TRIGGER actualizarFechaUltimaVenta
AFTER INSERT ON detalles_ventas
FOR EACH ROW
BEGIN
    INSERT INTO ultima_venta_producto (id_producto, ultima_fecha_venta)
    VALUES (NEW.id_producto, CURRENT_DATE)
    ON DUPLICATE KEY UPDATE ultima_fecha_venta = CURRENT_DATE;
END $$

DELIMITER ;


-- Agregaremos un trigger que NO permita la venta de un producto del que no hay stock
-- y que ademas advierta que no hay unidades disponibles
-- Crearemos la esta tabla para insertar los registros de aquellos productos que no tengan stock

CREATE TABLE sin_stock (
    id_stock INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    stock_actual INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

DELIMITER $$
CREATE TRIGGER verificarStockAntesDeVenta
BEFORE INSERT ON detalles_ventas
FOR EACH ROW
BEGIN
    -- Verificaremos si el stock es 0
    IF (SELECT stock FROM productos WHERE id_producto = NEW.id_producto) = 0 THEN
        -- Insertaremos en la tabla sin_stock
        INSERT INTO sin_stock (id_producto, stock_actual)
        VALUES (NEW.id_producto, 0); 

        -- Generar un error para evitar la venta si el stock es 0
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede realizar la venta, no hay unidades disponibles en stock';
    END IF;
END $$
DELIMITER ;