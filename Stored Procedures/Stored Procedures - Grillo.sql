USE concesionaria;

-- 1) S.P. para ordenar una tabla mediante el nombre, el campo deseado a ordenar y el tipo de ordenamiento (ASC o DESC).

DELIMITER //
DROP PROCEDURE IF EXISTS sp_ordenar_tabla;
CREATE PROCEDURE sp_ordenar_tabla (
								   IN sp_nombre_tabla VARCHAR(100),
								   IN sp_campo_orden VARCHAR(100),
								   IN sp_tipo_orden VARCHAR(10)
								   )
BEGIN
  SET @query = CONCAT('SELECT * FROM ', sp_nombre_tabla, ' ORDER BY ', sp_campo_orden, ' ', sp_tipo_orden);
  PREPARE stmt FROM @query;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

-- Verificamos que el SP se haya creado correctamente.

CALL sp_ordenar_tabla ('ventas', 'monto', 'desc');

-- 2) S.P. para ingresar y eliminar datos de la tabla "proveedores".

DELIMITER //
DROP PROCEDURE IF EXISTS sp_insert_delete_proveedor;
CREATE PROCEDURE sp_insert_delete_proveedor (
											 IN sp_id_prov INT,
											 IN sp_nombre VARCHAR(100),
											 IN sp_telefono INT,
											 IN sp_mail VARCHAR(100),
											 IN sp_action VARCHAR(10)
                                             )
BEGIN
  IF sp_action = 'insert' THEN
    INSERT INTO proveedores (id_prov, nombre, telefono, mail)
    VALUES (sp_id_prov, sp_nombre, sp_telefono, sp_mail);
  ELSEIF sp_action = 'delete' THEN
    DELETE FROM proveedores WHERE id_prov = sp_id_prov;
  END IF;
END //
DELIMITER ;

-- Sintaxis para llamar al S.P. "sp_insert_delete_proveedor" e ingresar datos a la tabla proveedores.

CALL sp_insert_delete_proveedor (NULL, 'Proveedor 21', 55559208, 'proveedor21@gmail.com', 'insert');

-- Consulta para verificar que la insercion de datos se haya realizado correctamente.

SELECT * FROM proveedores WHERE id_prov = 21;

-- Sintaxis para llamar al S.P. "sp_insert_delete_proveedor" y eliminar datos a la tabla proveedores.

CALL sp_insert_delete_proveedor (21, NULL, NULL, NULL, 'delete');

-- Consulta para verificar que la eliminacion de registros se haya realizado correctamente.

SELECT * FROM proveedores;