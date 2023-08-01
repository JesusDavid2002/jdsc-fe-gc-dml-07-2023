-- DML directores

CREATE DATABASE DDL_ex07;
USE DDL_ex07;

CREATE TABLE despachos(
	Numero int,
    Capacidad int,
    PRIMARY KEY (Numero)
);

CREATE TABLE directores(
	DNI varchar(8),
    NomApels nvarchar(255),
    DNIJefe varchar (8),
    Despacho int,
    PRIMARY KEY (DNI),
    FOREIGN KEY (DNIJefe) REFERENCES directores(DNI)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (Despacho) REFERENCES despachos(Numero)
    ON DELETE cascade
    ON UPDATE cascade
);

SELECT * FROM despachos;
INSERT INTO despachos VALUES(5, 50), (20, 70), (2, 80), (53, 90), (12, 100), (15, 60), (26, 56), (11, 42), (10, 98), (9, 75);

SELECT * FROM directores;
REPLACE INTO directores VALUES
('1234567D', 'Juan Ramón Martinez', '1234567D', 20),
('5468725G', 'Marta Gonzalez Martinez', '1234567D', 9),
('9874512R', 'Maria Gomez Rodriguez', '1234567D', 10),
('6534127E', 'Juanjo Lopez Fernandez', '1234567D', 20),
('9856452Y', 'Alejandro Lopez Martinez', '9856452Y', 53),
('1245968E', 'Marcos Garcia Sanchez', '9856452Y', 53),
('6598745H', 'Lucia Fernandez Lopez', '5468725G', 9),
('3262345T', 'Iker Fernandez Carrascosa', '1234567D', 2),
('1248785J', 'Manuel Gutierrez Martinez', '1234567D', 2),
('3205406N', 'David Ramón Lopez', '1248785J', 20);

UPDATE despachos SET capacidad = 95
WHERE numero = 5;

DELETE FROM directores WHERE DNI = '1234567D'