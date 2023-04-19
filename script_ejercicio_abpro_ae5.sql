/*

													Ejercicios ABPro AE5
												“Te lo vendo” – Iteración 5
											 Bases de datos relacionales – DDL

Nombres: Gustavo Ruiz Saumon, Juan Pino Contreras,Jorge Moraga Calvo, Harold Klapp.
*/                                        
/*-------------------------------------------------------------------------------------------------------------------*/
                                        -- Parte 1: Crear entorno de trabajo
/*-------------------------------------------------------------------------------------------------------------------*/
                                        
-- Crear una base de datos

CREATE DATABASE bdabpro5;


-- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.

CREATE USER 'adminbdabpro5'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON bdabpro5.* TO 'adminbdabpro5'@'localhost';
FLUSH PRIVILEGES;
USE bdabpro5;


/*-------------------------------------------------------------------------------------------------------------------*/
							-- Parte 2: Crear dos tablas.
/*-------------------------------------------------------------------------------------------------------------------*/

/* 
La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido,
contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).
*/
CREATE TABLE Usuarios (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	contraseña VARCHAR(50),
	zona_horaria VARCHAR(50) DEFAULT 'UTC-3',
	genero VARCHAR(30),
	telefono_contacto VARCHAR(15)
);
DESCRIBE usuarios;


/*La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los
usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la
fecha-hora actual)).
*/

CREATE TABLE Ingresos (
	id_ingreso INT PRIMARY KEY AUTO_INCREMENT,
	id_usuario INT,
	fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
DESCRIBE ingresos;
/*-------------------------------------------------------------------------------------------------------------------*/
										-- Parte 3: Modificación de la tabla
/*-------------------------------------------------------------------------------------------------------------------*/                                        
                                        
-- Modifique el UTC por defecto.Desde UTC-3 a UTC-2.


ALTER TABLE Usuarios MODIFY zona_horaria VARCHAR(50) DEFAULT 'UTC-2';
DESCRIBE usuarios;

/*-------------------------------------------------------------------------------------------------------------------*/
										-- Parte 4: Creación de registros.
/*-------------------------------------------------------------------------------------------------------------------*/
                                        
-- Para cada tabla crea 8 registros.

INSERT INTO Usuarios (nombre, apellido, contraseña, genero, telefono_contacto)
VALUES ('Juan', 'Pérez', 'contraseña123', 'Masculino', '123456789'),
	('María', 'González', 'clave456', 'Femenino','123456789'),
	('Pedro', 'Rodríguez', 'password789', 'Masculino','123456789'),
	('Ana', 'Sánchez', 'clave1234', 'Femenino','123456789'),
	('Carlos', 'Fernández', 'password567', 'Masculino','123456789'),
	('Gustavo', 'Ruiz', '123456', 'Masculino','123456789'),
	('Juan', 'Pino', 'clave123456', 'Masculino','123456789'),
	('Lorena', 'Chandia', 'contrasena', 'Femenino','123456789');
		   
SELECT * from usuarios;


/*-------------------------------------------------------------------------------------------------------------------*/
INSERT INTO Ingresos (id_usuario) VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8);
SELECT * from ingresos;

/*-------------------------------------------------------------------------------------------------------------------*/
					-- Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
/*-------------------------------------------------------------------------------------------------------------------*/
/*                    
INT para el id_usuario porque es un número entero y se utilizará como clave primaria.
VARCHAR(50) para nombre, apellido, contraseña y zona_horaria porque son cadenas de caracteres de longitud variable.
VARCHAR(30) para género porque puede variar segun sea el caso Ejemplo: Masculino, femenino u otro.
VARCHAR(15) para telefono_contacto porque es un número de teléfono que puede variar en longitud.
INT para id_ingreso y id_usuario porque son números enteros y se utilizarán como claves primarias y foráneas, respectivamente.
DATETIME para fecha_hora_ingreso porque almacena la fecha y la hora exacta del ingreso del usuario.
FOREIGN KEY se utiliza para establecer una relación entre la tabla Usuarios y la tabla Ingresos utilizando el campo id_usuario.
*/
/*-------------------------------------------------------------------------------------------------------------------------------------------------*/
					-- Parte 6: Creen una nueva tabla llamada Contactos (id_contacto numero de telefono, correo electronico).
/*-------------------------------------------------------------------------------------------------------------------------------------------------*/
                    
	  CREATE TABLE Contactos (
	  id_contacto INT  PRIMARY KEY AUTO_INCREMENT,
	  numero_telefono VARCHAR(20) NOT NULL,
	  correo_electronico VARCHAR(50) NOT NULL
	 );
     
DESCRIBE contactos;  
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
					-- Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos. 
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 /*
 Para crear un vínculo entre la tabla Usuarios y la tabla Contactos a través del campo teléfono de contacto,
 debemos agregar una nueva columna a la tabla Usuarios que haga referencia a la tabla Contactos. 
 Esta nueva columna será una clave foránea que apunte al campo número_telefono de la tabla Contactos.
Para lograr esto, primero debemos agregar la columna id_contacto a la tabla Usuarios:                   
*/

-- Se elimina la columna telefono_contaco de la tabla usuarios.
ALTER TABLE usuarios DROP COLUMN telefono_contacto ;
DESCRIBE usuarios;

-- se agrega la columna id_contacto en la tabla usuarios.    
ALTER table usuarios ADD Column id_contacto INT NOT NULL;
DESCRIBE usuarios;

-- se agrega la referencia de la foreign key a la tabla usuarios
ALTER TABLE usuarios ADD CONSTRAINT id_contacto FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto);

-- El ejercicio debe ser subido a github y al Nodo Virtual.

-- GitHub
