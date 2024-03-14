DROP DATABASE Usuarios;
Create Database Usuarios;
Use Usuarios;

ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'Vale0401*';

-- Creacion de la Tabla de Usuarios
Create table USUARIO(
	Carnet BIGINT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Correo VARCHAR(50),
    Contrasena VARCHAR(50)
);

 -- Creacion de la Tabla de curos
Create table CATEDRATICO(
	idcatedratico INT AUTO_INCREMENT PRIMARY KEY,
	Nombre  VARCHAR(100)
);

 -- Creacion de la Tabla de curos
Create table CURSO(
	idcurso INT AUTO_INCREMENT PRIMARY KEY,
	Nombre  VARCHAR(100),
	Creditos INT
);

-- Creacion de la Tabla de Publicacion
Create table PUBLICACION(
	idpublicacion INT AUTO_INCREMENT PRIMARY KEY,
	Descripcion VARCHAR(500),
	Fecha DATE,
    FK_Catedratico INT,
    Fk_Usuario BIGINT,
    Fk_Curso INT,
    FOREIGN KEY (Fk_Usuario) REFERENCES USUARIO(Carnet),
    FOREIGN KEY (FK_Catedratico) REFERENCES CATEDRATICO(idcatedratico),
    FOREIGN KEY (Fk_Curso) REFERENCES CURSO(idcurso)
);

-- Creacion de la Tabla de comentario
Create table COMENTARIO(
	idcomentario INT AUTO_INCREMENT PRIMARY KEY,
	Fk_idpublicacion INT,
	Fk_Usuario BIGINT,
	comentario VARCHAR(500),
	Fecha DATE,
	FOREIGN KEY (Fk_Usuario) REFERENCES USUARIO(Carnet),
    FOREIGN KEY (Fk_idpublicacion) REFERENCES PUBLICACION(idpublicacion)
);

 -- Creacion de la Tabla de asignacion
Create table ASIGNACION(
	idasignacion INT AUTO_INCREMENT PRIMARY KEY,
	Fecha DATE,
	Fk_Usuario BIGINT,
    Fk_Curso INT,
    FOREIGN KEY (Fk_Usuario) REFERENCES USUARIO(Carnet),
    FOREIGN KEY (Fk_Curso) REFERENCES CURSO(idcurso)
);


Insert into USUARIO(Carnet, Nombre, Apellido, Correo, Contrasena)VALUES(201608897, 'Luis', 'Ordonez', 'pedro@gmail.com', '123');

Insert into CURSO(Nombre, Creditos)VALUES('Logica de sistemas', 2);
Insert into CURSO(Nombre, Creditos)VALUES('Introduccion a la programacion y computacion 1', 4);
Insert into CURSO(Nombre, Creditos)VALUES('Lenguajes formales y de programacion', 3);
Insert into CURSO(Nombre, Creditos)VALUES('Introduccion a la programacion y computacion 2', 5);
Insert into CURSO(Nombre, Creditos)VALUES('Organizacion computacional', 3);

Insert into CATEDRATICO(Nombre)VALUES('Pepito');

INSERT INTO PUBLICACION(Descripcion, Fecha, FK_Catedratico, Fk_Usuario)VALUES('Prueba 1', DATE_FORMAT(DATE_SUB(now(), INTERVAL 6 HOUR), '%Y-%m-%d'), 1, 201701187);

Select * from USUARIO WHERE Carnet != 201701187;
select * from PUBLICACION;
select * from Comments;
INSERT INTO PUBLICACION(Descripcion, Fecha, FK_Catedratico, Fk_Usuario)VALUES('Prueba 1 de publicidad sin curso y catedratico existente', DATE_FORMAT(DATE_SUB(now(), INTERVAL 6 HOUR), '%Y-%m-%d'), 1, 201701187);

UPDATE USUARIO SET Contrasena = '123' WHERE Carnet = 201701187 AND Correo = 'pedro@gmail.com';

DELETE FROM PUBLICACION;
    SET SQL_SAFE_UPDATES= 0;DROP DATABASE IF EXISTS Usuarios;
CREATE DATABASE Usuarios;
USE Usuarios;

-- Creación de la tabla 'USUARIO'
CREATE TABLE IF NOT EXISTS USUARIO (
    Carnet BIGINT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Correo VARCHAR(50),
    Contrasena VARCHAR(50)
);

-- Creación de la tabla 'CATEDRATICO'
CREATE TABLE IF NOT EXISTS CATEDRATICO (
    idcatedratico INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100)
);

-- Creación de la tabla 'CURSO'
CREATE TABLE IF NOT EXISTS CURSO (
    idcurso INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Creditos INT
);

-- Creación de la tabla 'PUBLICACION'
CREATE TABLE IF NOT EXISTS PUBLICACION (
    idpublicacion INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(500),
    Fecha DATE,
    FK_Catedratico INT,
    Fk_Usuario BIGINT,
    Fk_Curso INT,
    FOREIGN KEY (Fk_Usuario) REFERENCES USUARIO(Carnet),
    FOREIGN KEY (FK_Catedratico) REFERENCES CATEDRATICO(idcatedratico),
    FOREIGN KEY (Fk_Curso) REFERENCES CURSO(idcurso)
);

-- Creación de la tabla 'COMENTARIO'
CREATE TABLE IF NOT EXISTS COMENTARIO (
    idcomentario INT AUTO_INCREMENT PRIMARY KEY,
    Fk_idpublicacion INT,
    Fk_Usuario BIGINT,
    Comentario VARCHAR(500),
    Fecha DATE,
    FOREIGN KEY (Fk_Usuario) REFERENCES USUARIO(Carnet),
    FOREIGN KEY (Fk_idpublicacion) REFERENCES PUBLICACION(idpublicacion)
);

-- Creación de la tabla 'ASIGNACION'
CREATE TABLE IF NOT EXISTS ASIGNACION (
    idasignacion INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Fk_Usuario BIGINT,
    Fk_Curso INT,
    FOREIGN KEY (Fk_Usuario) REFERENCES USUARIO(Carnet),
    FOREIGN KEY (Fk_Curso) REFERENCES CURSO(idcurso)
);

-- Insertar datos de ejemplo
INSERT INTO USUARIO (Carnet, Nombre, Apellido, Correo, Contrasena) VALUES (201701187, 'Luis', 'Ordoñez', 'pedro@gmail.com', '123');
INSERT INTO CURSO (Nombre, Creditos) VALUES ('Logica de sistemas', 2);
INSERT INTO CURSO (Nombre, Creditos) VALUES ('Introduccion a la programacion y computacion 1', 4);
INSERT INTO CURSO (Nombre, Creditos) VALUES ('Lenguajes formales y de programacion', 3);
INSERT INTO CURSO (Nombre, Creditos) VALUES ('Introduccion a la programacion y computacion 2', 5);
INSERT INTO CURSO (Nombre, Creditos) VALUES ('Organizacion computacional', 3);
INSERT INTO CATEDRATICO (Nombre) VALUES ('Pepito');
INSERT INTO PUBLICACION (Descripcion, Fecha, FK_Catedratico, Fk_Usuario) VALUES ('Prueba 1', CURDATE(), 1, 201701187);

