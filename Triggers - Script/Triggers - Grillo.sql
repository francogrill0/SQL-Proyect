USE concesionaria;

-- 1) Creación de la tablas de auditoría.

DROP TABLE IF EXISTS log_ventas;
CREATE TABLE IF NOT EXISTS log_ventas (
  id_log INT NOT NULL AUTO_INCREMENT,
  accion VARCHAR(10),
  nombre_tabla VARCHAR(50),
  campo_nuevo VARCHAR(100), 
  campo_viejo VARCHAR(100), 
  usuario VARCHAR(100),
  hora_log TIME,
  fecha_upd DATE,
  fecha_ins DATE,
  fecha_del DATE,
  PRIMARY KEY (id_log)
);

DROP TABLE IF EXISTS log_empleados;
CREATE TABLE IF NOT EXISTS log_empleados (
  id_log INT NOT NULL AUTO_INCREMENT,
  accion VARCHAR(10),
  nombre_tabla VARCHAR(50),
  campo_nuevo VARCHAR(100), -- solo updates
  campo_viejo VARCHAR(100), -- solo updates
  usuario VARCHAR(100),
  hora_log TIME,
  fecha_upd DATE,
  fecha_ins DATE,
  fecha_del DATE,
  PRIMARY KEY (id_log)
);

-- 2) Creacion de trigger para la actualizacion de datos en la tabla "empleados".

DELIMITER //
CREATE TRIGGER trg_update_empleados
BEFORE UPDATE ON empleados
FOR EACH ROW
BEGIN

  INSERT INTO log_empleados (accion, nombre_tabla, campo_viejo, campo_nuevo, usuario, hora_log, fecha_upd)
  VALUES ('Update', 'Empleados', OLD.sueldo , NEW.sueldo, CURRENT_USER(), CURRENT_TIME(), CURDATE());

END//
DELIMITER ;

-- Actualizacion de datos en la tabla "empleados".

UPDATE empleados SET sueldo = 200000 WHERE id_empleado = 22;

-- Consulta para verificar que la actualizacion de registros se realizo correctamente.

select * from empleados;

-- Consulta para verificar la tabla de auditoria.

select * from log_empleados;

-- 3) Creación de trigger para la insercion de datos en la tabla "ventas".

DELIMITER //
CREATE TRIGGER trg_insert_ventas
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN

  INSERT INTO log_ventas (accion, nombre_tabla, campo_nuevo, usuario, hora_log, fecha_ins)
  VALUES ('Insert', 'Ventas', NEW.id_venta, CURRENT_USER(), CURRENT_TIME(), CURDATE());

END//
DELIMITER ;

-- Insercion de datos a la tabla "ventas".
select * from ventas;
INSERT INTO ventas VALUES
(NULL, '2023-02-15', 14, 6, 850000, 'Efectivo', 'Retiro', 'Entrega pendiente');

-- Consulta para verificar que la insercion se realizo correctamente.

select * from ventas;

-- Consulta para verificar la tabla de auditoria.

select * from log_ventas;