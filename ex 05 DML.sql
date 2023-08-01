-- DML Investigadores

CREATE DATABASE DDL_ex11;
USE DDL_ex11;

CREATE TABLE facultades(
	codigo int,
    nombre varchar(100) unique,
    PRIMARY KEY (codigo)
);

CREATE TABLE investigadores(
	DNI varchar(8),
    nom_apels varchar(255),
    facultad int,
    PRIMARY KEY (DNI),
    FOREIGN KEY (facultad) REFERENCES facultades (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE equipos(
	num_serie char(4),
    nombre varchar(100),
    facultad int,
    PRIMARY KEY (num_serie),
    FOREIGN KEY (facultad) REFERENCES facultades (codigo) 
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE reservas (
	DNI varchar(8),
    num_serie char(4),
    comienzo datetime,
    fin datetime,
    PRIMARY KEY (DNI, num_serie),
    FOREIGN KEY (DNI) REFERENCES investigadores (DNI) 
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (num_serie) REFERENCES equipos (num_serie) 
    ON DELETE cascade
    ON UPDATE cascade
);

SELECT * FROM facultades;
REPLACE INTO facultades VALUES 
(1, 'Ciencias Biologicas'), (12, 'Ciencias Quimicas'), (34, 'Farmacia'), (21, 'Medicina'), (2, 'ADE'), 
(18, 'Derecho'), (5, 'Filosofia'), (23, 'Informatica'), (39, 'Veterinaria'), (8, 'Odontologia');

SELECT * FROM equipos;
INSERT INTO equipos VALUES
(1, 'biologicos junior', 1), (7, 'breaking bad team', 12), (12, 'blancos siempre', 8), 
(17, 'los jueces', 18), (21, 'los aristotelicos', 5), (42, 'code juniors', 23), (64, 'save pets', 39);

SELECT * FROM investigadores;
INSERT INTO investigadores VALUES 
('2457836E', 'Juan Perez Martinez', 39), ('7536401H', 'Marta Gutierrez Perez', 5), ('9874563T', 'Maria Garcia Martinez', 1), 
('9632107I', 'Pedro Navarro Perez', 18), ('7642301H', 'Xavier Gutierrez Fernandez', 34), ('9874563V', 'Maria Martinez Hernandez', 23), 
('1201235Y', 'Sebastian Gomez Lopez', 2), ('1258309B', 'Juan Ruiz Sanchez', 12), ('9852016Q', 'Alex Rodriguez Lopez', 12), ('1247509Q', 'Juan Perez Lopez',5);

SELECT * FROM reservas;
REPLACE INTO reservas VALUES 
('2457836E', 1, '2022-12-5 11:50' , '2023-3-12 18:00'), ('7536401H', 7, '2022-4-1 15:23', '2022-12-12 3:15'), ('9874563T', 17, '2021-1-25 9:00', '2021-4-20 17:30'),
('9632107I', 17, '2021-1-25 9:00', '2021-4-20 15:00'), ('7642301H', 12, '2022-10-8 9:36', '2023-1-2 21:26'), ('9874563V', 42, '2020-11-30 7:30', '2021-2-22 21:12'),
('1201235Y', 1, '2022-12-5 9:30', '2023-3-12 18:15'), ('1258309B', 21, '2023-2-19 8:25', '2023-6-20 15:00'), ('9852016Q', 64, '2022-2-9 6:30', '2022-8-17 5:15'), 
('1247509Q', 21, '2023-2-19 12:00', '2023-6-20 23:59');

UPDATE reservas SET comienzo = '2022-9-12 9:15:20'
WHERE DNI = '2457836E';

DELETE FROM investigadores WHERE DNI = '65' OR DNI = '6';