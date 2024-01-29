CREATE SCHEMA Tienda_ropa;
USE Tienda_ropa;

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
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- TABLA DE PEDIDOS
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_pedido DATE NOT NULL,
    total_pedido DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- TABLA INTERMEDIA PARA ALMACENAR LOS PRODUCTOS DE CADA PEDIDO
CREATE TABLE detalles_pedidos (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_cliente INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    total_producto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
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
    ('Claudia Lopez', 'clau.lopez@yahoo.com', 25678901, 'Calle N37 162, La Plata');
    
-- Agregar datos de productos
INSERT INTO productos (nombre_producto, precio, stock) 
VALUES
    ('Pantalones de jean', 19999.99, 50),
    ('Remera de Algodón', 9999.99, 100),
    ('Zapatillas Deportivas', 49999.99, 30);
    
-- Agregar datos a la tabla pedidos
INSERT INTO pedidos (id_cliente, fecha_pedido, total_pedido) 
VALUES
    (1, '2024-01-05', 39999.99),
    (2, '2024-01-07', 29999.97),
    (3, '2024-01-15', 59999.99);
    
-- Agregar datos a la tabla detalles_pedido
INSERT INTO detalles_pedidos (id_pedido, id_cliente, id_producto, cantidad, precio_unitario, total_producto) 
VALUES
    (1, 1, 1, 2, 19999.99, 39999.99),
    (2, 2, 2, 3, 9999.99, 29999.97),
    (3, 3, 3, 1, 59999.99, 59999.99);
    
-- Agregar datos a la tabla detalles_productos
INSERT INTO detalles_productos (id_producto, color, marca, talle) 
VALUES
    (1,'Azul', 'Levis', '40'),
    (2,'Negro', 'GAP', 'L'),
    (3,'Gris', 'Nike', '42');
    
    