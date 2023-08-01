-- DML Piezas y proveedores

CREATE DATABASE DDL_ex08;
USE DDL_ex08;

CREATE TABLE piezas(
	codigo int auto_increment,
    nombre nvarchar(100),
    PRIMARY KEY (codigo)
);

CREATE TABLE proveedores(
	id char(4),
    nombre nvarchar(100),
    PRIMARY KEY (id)
);

CREATE TABLE suministra(
	codigo_pieza int auto_increment,
    id_proveedor char(4),
    precio int,
    PRIMARY KEY (codigo_pieza, id_proveedor),
    FOREIGN KEY (codigo_pieza) REFERENCES piezas(codigo)
    ON DELETE cascade
    ON UPDATE cascade, 
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id)
    ON DELETE cascade
    ON UPDATE cascade
);

SELECT * FROM piezas;
INSERT INTO piezas (nombre) VALUE
('tuercas'),('bugias'),('tornillos'), ('arandelas'), ('clavos'), ('turbina'), ('tubos'), ('llantas'), ('perno'), ('barra');

SELECT * FROM proveedores;
INSERT INTO proveedores VALUE 
('25FD','Concesionario BMW'), ('98EF','Fabrica Metales Aurelio'), ('47AD','Fabrica Metales Manolo'), ('RR55','Concesionario Honda'),
('98FG','Fabrica Metales Juan'), ('11GV','Concesionario Mazda'), ('90QW','Fabrica Metales Martin'), ('63LI','Concesionario Peugeot'),
('111U','Metales Brillantes S.A.'), ('28UY','Metales Juanjo S.A.');

SELECT * FROM suministra;
INSERT INTO suministra (id_proveedor, precio) VALUE 
('25FD', 200), ('25FD', 160), ('98EF', 980), ('98EF', 234), ('47AD', 665), ('90QW', 565), ('63LI', 554), ('63LI', 234), ('28UY', 780), ('111U', 124);

UPDATE piezas SET nombre = 'bobinas'
WHERE codigo = 6;

DELETE FROM proveedores WHERE id = '28UY';