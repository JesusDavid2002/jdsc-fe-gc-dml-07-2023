-- DML Grandes Almacenes

CREATE DATABASE DDL_ex10;
USE DDL_ex10;

CREATE TABLE cajeros(
	codigo int,
    nom_apels varchar(225),
    PRIMARY KEY (codigo)
);

CREATE TABLE productos(
	codigo int,
    nombre varchar(100),
    precio int,
    PRIMARY KEY (codigo)
);

CREATE TABLE maquinas_registradas(
	codigo int auto_increment,
    piso int,
    PRIMARY KEY (codigo)
);

CREATE TABLE ventas(
	cajero int,
    maquina int,
    producto int,
    PRIMARY KEY (cajero, maquina, producto),
    FOREIGN KEY (cajero) REFERENCES cajeros (codigo)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (producto) REFERENCES productos (codigo)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (maquina) REFERENCES maquinas_registradas (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);

SELECT * FROM cajeros;
INSERT INTO cajeros VALUES (12, 'Pedro Navarro Perez'), (25, 'Juan Perez Martinez'), (03,'Marta Gonzalez Martinez'), (36, 'Maria Gomez Rodriguez'), (06, 'David Ramón Lopez'), 
(42, 'Maria Martinez Hernandez'), (23, 'Alex Rodriguez Lopez'), (16, 'Alejandro Lopez Martinez'), (18, 'Sebastian Gomez Lopez'), (65, 'Manuel Gutierrez Martinez');

SELECT * FROM productos;
INSERT INTO productos VALUES (125, 'Papel higenico', 60), (94, 'Limpiacristales', 35), (12, 'Mantas', 84), (34, 'Coca Colas', 15), 
(51, 'Papel cocina', 65), (65, 'Vinaje', 35), (39, 'Aceite girasol', 50), (84, 'Huevos L', 18), (46, 'Huevos M', 16), (90, 'Nesquik', 20);

SELECT * FROM maquinas_registradas;
INSERT INTO maquinas_registradas (piso) VALUES (1), (1), (1), (2), (2), (3), (3), (4), (5), (5);

SELECT * FROM ventas;
INSERT INTO ventas VALUES (12, 11, 125), (25, 15, 46), (03, 12, 84), (36, 19, 94), (06, 16, 12), (42, 13, 39), (23, 17, 34), (16, 18, 51), (18, 20, 90), (65, 14, 65);

UPDATE productos SET nombre = 'Huevos de Avestruz'
WHERE codigo = 84;

DELETE FROM maquinas_registradas WHERE codigo = 9 OR codigo = 10