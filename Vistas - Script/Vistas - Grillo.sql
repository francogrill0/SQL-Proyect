USE concesionaria;

-- 1) Vista que muestra todos los autos que son nuevos.

CREATE OR REPLACE VIEW vw_estado_nuevo AS
  (SELECT * FROM autos 
   WHERE estado = 'Nuevo');

-- Verificamos que la vista se haya creado correctamente.

SELECT * FROM vw_estado_nuevo;

-- 2) Vista que muestra todos los autos que son usados.

CREATE OR REPLACE VIEW vw_estado_usado AS
  (SELECT * FROM autos 
   WHERE estado = 'Usado');
   
-- Verificamos que la vista se haya creado correctamente.

SELECT * FROM vw_estado_usado;

-- 3) Vista que muestra la lista de ventas realizadas en efectivo.

CREATE OR REPLACE VIEW vw_ventas_efectivo AS
  (SELECT v.fecha_venta, c.nombre AS cliente, v.id_auto, v.monto, v.metodo_pago
   FROM ventas AS v JOIN clientes AS c
   ON v.id_cliente = c.id_cliente
   WHERE v.metodo_pago like 'Efec%');
   
-- Verificamos que la vista se haya creado correctamente.

SELECT * FROM vw_ventas_efectivo;

-- 4) Vista que muestra el nombre de cada departamento, la cantidad de empleados y el nombre de los gerentes de estos mismos.

CREATE OR REPLACE VIEW vw_info_departamentos AS
  (SELECT d.nombre AS departamento,  d.cant_empleados, g.nombre AS gerentes
   FROM departamentos AS d JOIN gerentes AS g
   ON d.id_gerente = g.id_gerente);
   
-- Verificamos que la vista se haya creado correctamente.

SELECT * FROM vw_info_departamentos;

-- 5) Vista que muestra las ventas realizadas en un periodo de tiempo determinado junto con la información del auto y el cliente.

CREATE OR REPLACE VIEW vw_ventas_2018_2023 AS
  (SELECT v.fecha_venta, a.marca, a.modelo, c.nombre as cliente, v.monto
   FROM ventas AS v 
   JOIN autos AS a ON v.id_auto = a.id_auto
   JOIN clientes AS c ON v.id_cliente = c.id_cliente
   WHERE v.fecha_venta between '2018-01-01' AND '2023-12-31');
   
-- Verificamos que la vista se haya creado correctamente.
   
SELECT * FROM vw_ventas_2018_2023;

-- 6) Vista que muestra los servicve realizados junto con la informacion de los autos, el cliente y el empleado que lo atendio.

CREATE OR REPLACE VIEW vw_info_service AS
  (SELECT s.fecha_service, a.marca, a.modelo, c.nombre AS cliente, e.nombre AS empleado, s.service
   FROM service AS s
   JOIN autos AS a ON s.id_auto = a.id_auto
   JOIN empleados AS e ON s.id_empleado = e.id_empleado
   JOIN clientes AS c ON s.id_cliente = c.id_cliente);

-- Verificamos que la vista se haya creado correctamente.

SELECT * FROM vw_info_service;