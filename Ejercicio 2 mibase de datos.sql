--- EJERCICIO 2

-- 1  Crear una base de datos llamada "MiBaseDeDatos"


-- 2 Crea una tabla llamada "Usuarios" con las columnas: "id"(entero, clave primaria), "nombre"(texto), "edad"(entero)

CREATE TABLE Usuarios (
id SERIAL PRIMARY KEY, 
nombre VARCHAR (255),
edad INT

);

-- 3 Inserta dos registros en la tabla "Usuarios"

INSERT INTO Usuarios (id,nombre,edad)
VALUES (1,'Juan',45), (2,'María', 20); 


-- 4 Actualiza la edad de un usurario de la tabla "Usuarios"

UPDATE Usuarios 
SET EDAD=32
WHERE ID=1 ;


-- 5 Elimina un usuario de la tabla "Usuarios"

DELETE FROM Usuarios
WHERE ID=2;


-- 6 Crea una tabla llamada "Ciudades" con las columnas "id" (entero, clave primaria), "nombre" (texto) y país (texto)

CREATE TABLE Ciudades (
id INT PRIMARY KEY,
nombre VARCHAR (255),
país VARCHAR (255)
);


-- 7 inserta al menos 3 registros en la tabla "Ciudades"

INSERT INTO Ciudades (id,nombre, país)
VALUES(1,'Dublín', 'Irlanda'), (2,'Lisboa', 'Portugal'), (3, 'Madrid', 'España');


-- 8 Crea una foreign key en la tabla "Usuarios" que se relaciones con la columna "id de la tabla "Ciudades"

ALTER TABLE usuarios
ADD COLUMN ciudad_id INT,
ADD CONSTRAINT FK_ciudad 
FOREIGN KEY (ciudad_id)
REFERENCES ciudades(id); 


-- 9 Realiza una consulta que muestre los nombre de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN)

SELECT u."nombre" AS "Nommbre_Usuario",
    c."nombre" AS "Ciudad", 
    c."país" AS "País"
FROM CIUDADES AS C
LEFT JOIN USUARIOS AS U 
ON u."ciudad_id" = c."id";

-- 10 Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN)


SELECT u."nombre" AS "Nommbre_Usuario",
    c."nombre" AS "Ciudad"
FROM USUARIOS AS U 
INNER JOIN CIUDADES AS C 
ON u."ciudad_id" = c."id";
