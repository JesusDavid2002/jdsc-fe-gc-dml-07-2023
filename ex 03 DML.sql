-- DML cientificos

CREATE DATABASE DDL_ex09;
USE DDL_ex09;

CREATE TABLE cientificos(
	DNI varchar(8),
    nom_apels varchar(225),
    PRIMARY KEY (DNI)
);

CREATE TABLE proyectos(
	id char(4),
    nombre varchar(225) unique,
    horas int,
    PRIMARY KEY (id)
);

CREATE TABLE asignado_a(
	cientifico varchar(8),
    proyecto char(4),
    PRIMARY KEY (cientifico, proyecto),
    FOREIGN KEY (cientifico) REFERENCES cientificos (DNI)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (proyecto) REFERENCES proyectos (id)
    ON DELETE cascade
    ON UPDATE cascade
);

SELECT * FROM cientificos;
REPLACE INTO cientificos VALUES ('2457836E', 'Juan Perez Martinez'), ('7536401H', 'Marta Gutierrez Perez'),('9874563T', 'Maria Garcia Martinez'), 
('9632107I', 'Pedro Navarro Perez'), ('7536401H', 'Xavier Gutierrez Fernandez'),('9874563V', 'Maria Martinez Hernandez'), ('1201235Y', 'Sebastian Gomez Lopez'),
('1258309B', 'Juan Ruiz Sanchez'), ('9852016Q', 'Alex Rodriguez Lopez'),('1247509Q', 'Juan Perez Lopez');

SELECT * FROM proyectos;
REPLACE INTO proyectos VALUES ('24FE', 'HotelPlanet', 150), ('30QV','Discord Web', 340), ('549H', 'TecnoVision', 550), ('02PO','FitFusion', 365),
('F6F5', 'ArtScape', 85), ('AQ12','BrainBoost', 180), ('36F6', 'GreenEco', 420), ('23ZA','DataSphere', 694), ('84GT', 'HeritageQuest', 257), ('07RT','CommuniHelp', 264);

SELECT * FROM asignado_a;
REPLACE INTO asignado_a VALUES ('2457836E', '24FE'), ('7536401H', '30QV'), ('9874563T', '07RT'), ('1201235Y', '02PO'), ('9874563V', '02PO'), ('7536401H', '84GT'),
 ('9632107I', 'F6F5'), ('1258309B', 'AQ12'), ('1258309B', '36F6'), ('1247509Q', '36F6');
 
UPDATE proyectos SET horas = 312
WHERE id = '24FE';

DELETE FROM proyectos WHERE id = '23ZA';