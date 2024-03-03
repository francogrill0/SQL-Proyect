USE concesionaria;

SELECT @@AUTOCOMMIT;
SET @@AUTOCOMMIT = 0;

-- 1) Elimincaion de registros de la tabla "gerentes".

START TRANSACTION; 

DELETE FROM gerentes WHERE id_gerente IN (16, 17, 18);

-- ROLLBACK;
COMMIT;

-- Verificamos que la eliminacion de registros se ralizo correctamente.

SELECT * FROM gerentes;

-- Sentencias para insertar nuevamente los registros eliminados:

/*

INSERT INTO gerentes VALUES
(NULL, 85012395, 'Juan Cruz Rondon', 1152018936, '1989-05-06', 'Gerente de servicio y postventa', 400000, '2014-04-16'),
(NULL, 23017895, 'Alejandra Farias', 1123054789, '1994-12-19', 'Gerente de operaciones', 350000, '2017-11-15'),
(NULL, 12503854, 'Juana Lopez', 1198752512, '1984-04-21', 'Gerente financiero', 375000, '2011-07-04');

*/

-- 2) Insercion de 8 registros en la tabla "clientes".

START TRANSACTION;

INSERT INTO clientes (id_cliente, nombre, telefono, dni, mail) VALUES (NULL, 'Alejandro Guzman', 1124930018, 82032715, 'ale_guzman@hotmail.com');
INSERT INTO clientes (id_cliente, nombre, telefono, dni, mail) VALUES (NULL, 'Sofia Ramirez', 1136810574, 23501830, 'sofi_ramirez@hotmail.com');
INSERT INTO clientes (id_cliente, nombre, telefono, dni, mail) VALUES (NULL, 'Lucas Fernandez', 1191025213, 42014785, 'lucas_fernandez@hotmail.com');
INSERT INTO clientes (id_cliente, nombre, telefono, dni, mail) VALUES (NULL, 'Valentina Herrera', 1159460213, 79012836, 'valen_herrera@hotmail.com');
SAVEPOINT sp1;
INSERT INTO clientes (id_cliente, nombre, telefono, dni, mail) VALUES (NULL, 'Juan Carlos Rodriguez', 1168970021, 25401987, 'juan_rodriguez@hotmail.com');
INSERT INTO clientes (id_cliente, nombre, telefono, dni, mail) VALUES (NULL, 'Camila Martinez', 1102368501, 36698701, 'camila.martinez@hotmail.com');
INSERT INTO clientes (id_cliente, nombre, telefono, dni, mail) VALUES (NULL, 'Sebastian Lopez', 1189136652, 85465914, 'seba.lopez@hotmail.com');
INSERT INTO clientes (id_cliente, nombre, telefono, dni, mail) VALUES (NULL, 'Isabella Gonzalez', 1102854625, 48985012, 'isabella.gonzalez@hotmail.com');
SAVEPOINT sp2;

-- RELEASE SAVEPOINT sp1;

ROLLBACK;
COMMIT;

-- Verificamos que la insercion se realizo correctamente.

SELECT * FROM clientes;