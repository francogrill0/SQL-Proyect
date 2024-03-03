DROP SCHEMA IF EXISTS concesionaria;
CREATE SCHEMA concesionaria;
USE concesionaria;

CREATE TABLE IF NOT EXISTS proveedores (
  id_prov INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  telefono INT NOT NULL,
  mail VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_prov)
);

CREATE TABLE IF NOT EXISTS gerentes (
  id_gerente INT NOT NULL AUTO_INCREMENT,
  dni INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  telefono INT NOT NULL,
  fech_nac DATE NOT NULL,
  puesto VARCHAR(100) NOT NULL,
  sueldo INT NOT NULL,
  alta DATE NOT NULL,
  PRIMARY KEY (id_gerente)
);

CREATE TABLE IF NOT EXISTS departamentos (
  id_depto INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  id_gerente INT NOT NULL,
  cant_empleados INT NOT NULL,
  PRIMARY KEY (id_depto)
);

CREATE TABLE IF NOT EXISTS empleados (
  id_empleado INT NOT NULL AUTO_INCREMENT,
  id_depto INT NOT NULL,
  dni INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  telefono INT NOT NULL,
  fech_nac DATE NOT NULL,
  puesto VARCHAR(100) NOT NULL,
  sueldo INT NOT NULL,
  alta DATE NOT NULL,
  PRIMARY KEY (id_empleado)
);

CREATE TABLE IF NOT EXISTS autos (
  id_auto INT NOT NULL AUTO_INCREMENT,
  id_prov INT NOT NULL,
  marca VARCHAR(100) NOT NULL,
  modelo VARCHAR(100) NOT NULL,
  color VARCHAR(100) NOT NULL,
  fabricacion DATE NOT NULL,
  estado VARCHAR(100) NOT NULL,
  stock INT NOT NULL,
  precio INT NOT NULL,
  PRIMARY KEY (id_auto)
);

CREATE TABLE IF NOT EXISTS clientes (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  telefono INT,
  dni INT NOT NULL,
  mail VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_cliente)
);

CREATE TABLE IF NOT EXISTS ventas (
  id_venta INT NOT NULL AUTO_INCREMENT,
  fecha_venta DATE NOT NULL,
  id_auto INT NOT NULL,
  id_cliente INT NOT NULL,
  monto INT NOT NULL,
  metodo_pago VARCHAR(100),
  metodo_entrega VARCHAR(100),
  estado VARCHAR(100),
  PRIMARY KEY (id_venta)
);

CREATE TABLE IF NOT EXISTS compras (
  id_compra INT NOT NULL AUTO_INCREMENT,
  fecha_compra DATE NOT NULL,
  articulos VARCHAR(100) NOT NULL,
  unidades INT NOT NULL,
  id_prov INT NOT NULL,
  metodo_pago VARCHAR(100) NOT NULL,
  monto INT NOT NULL,
  estado VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_compra)
);

CREATE TABLE IF NOT EXISTS service (
  id_service INT NOT NULL AUTO_INCREMENT,
  id_auto INT NOT NULL,
  id_empleado INT NOT NULL,
  id_cliente INT NOT NULL,
  service VARCHAR(300) NOT NULL,
  fecha_service DATE NOT NULL,
  PRIMARY KEY (id_service)
);

ALTER TABLE departamentos ADD CONSTRAINT fk_id_gerente_depto FOREIGN KEY (id_gerente) REFERENCES gerentes (id_gerente) ON DELETE NO ACTION;
ALTER TABLE empleados ADD CONSTRAINT fk_id_departamento FOREIGN KEY (id_depto) REFERENCES departamentos (id_depto) ON DELETE NO ACTION;
ALTER TABLE autos ADD CONSTRAINT fk_id_prov_autos FOREIGN KEY (id_prov) REFERENCES proveedores (id_prov) ON DELETE NO ACTION;
ALTER TABLE ventas ADD CONSTRAINT fk_id_auto_ventas FOREIGN KEY (id_auto) REFERENCES autos (id_auto) ON DELETE NO ACTION;
ALTER TABLE ventas ADD CONSTRAINT fk_id_cli_ventas FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) ON DELETE NO ACTION;
ALTER TABLE compras ADD CONSTRAINT fk_id_prov_compras FOREIGN KEY (id_prov) REFERENCES proveedores (id_prov) ON DELETE NO ACTION;
ALTER TABLE service ADD CONSTRAINT fk_id_auto_serv FOREIGN KEY (id_auto) REFERENCES autos (id_auto) ON DELETE NO ACTION;
ALTER TABLE service ADD CONSTRAINT fk_id_empleado_serv FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado) ON DELETE NO ACTION;
ALTER TABLE service ADD CONSTRAINT fk_id_cliente_serv FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente) ON DELETE NO ACTION;