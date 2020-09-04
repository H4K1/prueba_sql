CREATE DATABASE prueba;

TABLE facturas(n_factura SERIAL PRIMARY KEY, fecha_factura DATE, subtotal FLOAT NOT NULL, iva FLOAT NOT NULL, total FLOAT NOT NULL);

CREATE TABLE clientes(id SERIAL PRIMARY KEY, nombre VARCHAR(100), rut VARCHAR(10), direccion VARCHAR(100));

CREATE TABLE categorias(id SERIAL PRIMARY KEY, nombre VARCHAR(100) UNIQUE, descripcion VARCHAR(200));

CREATE TABLE productos(id SERIAL PRIMARY KEY, nombre VARCHAR(100) UNIQUE, valor_unitario FLOAT);

CREATE TABLE clientes_facturas(cliente_id INT, factura_id int, FOREIGN KEY(cliente_id) REFERENCES clientes(id), FOREIGN KEY(factura_id) REFERENCES facturas(n_factura));

CREATE TABLE listado_productos(factura_id INT, producto_id INT, FOREIGN KEY(factura_id) REFERENCES facturas(n_factura), FOREIGN KEY(producto_id) REFERENCES productos(id));

CREATE TABLE producto_categoria(categoria_id INT, producto_id INT, FOREIGN KEY(producto_id) REFERENCES productos(id), FOREIGN KEY(categoria_id) REFERENCES categorias(id));


INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2019-02-02', 3800, 722, 4522), ('2019-02-02', 21870, 4155, 26025), ('2019-02-02', 8970, 1704, 10674), ('2019-02-02', 3800, 722, 4522), ('2019-02-02', 21870, 4155, 26025), ('2019-02-02', 4990, 948, 5938), ('2019-02-02', 3980, 756, 4736), ('2019-02-02', 13790, 2620, 16410), ('2010-02-02', 18860, 3583, 22443), ('2019-02-02', 1990, 378, 2368);


INSERT INTO clientes(nombre, rut, direccion) VALUES('Pedro', '11111111-1', 'Arturo Prat 55'), ('Diego', '22222222-2', 'Localhost 80'), ('Mirson', '33333333-3', 'Universo 2'), ('Juanito', '44444444-4', 'Namekusei 303'), ('Pablo', '55555555-5', 'Gotham 21');

 INSERT INTO categorias(nombre, descripcion) VALUES('Bebidas', 'Jugos y refrescos'), ('Juguetes', 'Entretenimiento para niños'), ('Lacteos', 'Productos derivados de la leche');

INSERT INTO productos(nombre, valor_unitario) VALUES('Coca cola', 2300), ('Watts de naranja', 1500), ('Cubo rubik', 9990), ('Monopolio', 10990), ('Leche entera', 890), ('Leche en polvo', 4990), ('Lipton de limon', 1990), ('Fanta', 1990);

INSERT INTO clientes_facturas VALUES(1,1),(1,2),(2,3),(2,4),(2,5),(3,6),(4,7),(4,8),(4,9),(5,10);

INTO listado_productos VALUES(1,1),(1,2),(2,3),(2,4),(2,5),(3,6),(3,7),(3,8),(4,1),(4,2),(5,3),(5,4),(5,5),(6,6),(7,7),(7,8),(8,1),(8,2),(8,3),(9,4),(9,5),(9,6),(9,7),(10,8);

INSERT INTO producto_categoria VALUES(1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(1,7),(1,8);


-- consultas

SELECT clientes.nombre FROM clientes INNER JOIN clientes_facturas ON clientes.id=clientes_facturas.cliente_id INNER JOIN facturas ON clientes_facturas.cliente_id=facturas.n_factura ORDER BY precio_total DESC LIMIT 1;

SELECT DISTINCT(clientes.nombre) FROM clientes INNER JOIN clientes_facturas ON clientes.id=clientes_facturas.cliente_id INNER JOIN facturas ON clientes_facturas.cliente_id=facturas.n_factura WHERE precio_total > 100;

SELECT count(nombre) FROM clientes INNER JOIN clientes_facturas ON clientes.id=clientes_facturas.cliente_id INNER JOIN facturas ON facturas.n_factura=clientes_facturas.factura_id INNER JOIN listado_productos ON facturas.n_factura=listado_productos.factura_id WHERE producto_id=6;


