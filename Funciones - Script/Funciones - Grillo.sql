USE concesionaria;

-- 1) Funcion que muestra el monto total recaudado dependiendo el metodo de pago (Efectivo, Cheque o Transferencia).

DELIMITER //
DROP FUNCTION IF EXISTS fn_valor_total_metodo;
CREATE FUNCTION fn_valor_total_metodo (metodo_pago VARCHAR (25)) 
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total_metodo INT;
  SET total_metodo = (SELECT sum(monto) FROM ventas AS v WHERE v.metodo_pago = metodo_pago);
  RETURN total_metodo;
END;
//

-- Verificamos que la funcion funcione correctamente con las distintas formas de pago.

SELECT fn_valor_total_metodo ('Efectivo');

SELECT fn_valor_total_metodo ('Cheque');

SELECT fn_valor_total_metodo ('Transferencia');

-- 2) Funcion que muestra la cantidad de empleados de cada departamento ingresando la ID de cada uno de estos mismos.

DELIMITER //
DROP FUNCTION IF EXISTS fn_cant_empleados;
CREATE FUNCTION fn_cant_empleados (depto_id INT)
RETURNS INT
deterministic
BEGIN
  DECLARE cantidad_empleados INT;
  SELECT cant_empleados INTO cantidad_empleados
  FROM departamentos
  WHERE id_depto = depto_id;
  RETURN cantidad_empleados;
END; 
//

-- Verificamos que la funcion que haya creado correctamente.

SELECT fn_cant_empleados (2);