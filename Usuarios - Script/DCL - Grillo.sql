USE mysql;

SHOW TABLES;

-- Sentencia de cracion del primer usuario.

CREATE USER IF NOT EXISTS 'Usuario 1'@'localhost' IDENTIFIED BY '11aa22bb33cc';

-- Sentencia de cracion del segundo usuario.

CREATE USER IF NOT EXISTS 'Usuario 2'@'localhost' IDENTIFIED BY '44dd55ee66ff';

-- Verificamos que se hayan creado.

SELECT * FROM user;

-- Le asignamos permisos solo de lectura al primer usuario.

GRANT SELECT ON concesionaria.* TO 'Usuario 1'@'localhost';

-- Verificamos que los permisos se hayan asignado correctamente.

SHOW GRANTS FOR 'Usuario 1'@'localhost';

-- Le asignamos permisos de lectura, insercion y modificaion al segundo usuario.

GRANT SELECT, INSERT, UPDATE ON concesionaria.* TO 'Usuario 2'@'localhost';

-- Verificamos una vez mas que los permisos se hayan asignado correctamente.

SHOW GRANTS FOR 'Usuario 2'@'localhost';