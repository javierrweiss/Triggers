-- -------- Trabajo Práctico No. 2 Disparadores ------------------

USE negocioWebRopa;


-- -------------------- CLIENTES -------------------------------------

DROP TRIGGER IF EXISTS TR_clientes_insert_log; 

DELIMITER //
CREATE TRIGGER TR_clientes_insert_log
AFTER INSERT ON clientes
FOR EACH ROW
  BEGIN
  INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
  VALUES('clientes', 'insert', curdate(), curtime(), current_user(), NEW.id); 
  END; //
DELIMITER ; 

INSERT INTO clientes(nombre, apellido, edad) VALUES('Juan', 'Manaus', 79);  

SELECT * FROM control;


DROP TRIGGER IF EXISTS TR_clientes_delete_log; 

DELIMITER //
CREATE TRIGGER TR_clientes_delete_log
AFTER DELETE ON clientes
FOR EACH ROW
  BEGIN
  INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
  VALUES('clientes', 'delete', curdate(), curtime(), current_user(), OLD.id);
  END; //
DELIMITER ; 

DELETE FROM clientes WHERE id = 8; 

SELECT * FROM control; 

DROP TRIGGER IF EXISTS TR_clientes_update_log; 

DELIMITER //
CREATE TRIGGER TR_clientes_update_log
AFTER UPDATE ON clientes
FOR EACH ROW
  BEGIN
  INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
  VALUES('clientes', 'update', curdate(), curtime(), current_user(), OLD.id);
  END; //
DELIMITER ; 

UPDATE clientes SET direccion = 'Finisterra 2000' WHERE id = 19; 

SELECT * FROM control;

-- -------------------------- ARTICULOS ----------------------------------

DROP TRIGGER IF EXISTS TR_articulos_insert_log;

DELIMITER //
CREATE TRIGGER TR_articulos_insert_log 
AFTER INSERT ON articulos
FOR EACH ROW
  BEGIN
  INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
  VALUES('articulos', 'insert', curdate(), curtime(), current_user(), NEW.id);
  END; //
DELIMITER ; 

INSERT INTO articulos(descripcion,tipo, color, talle_num, stock, costo, precio)
VALUES('pantalon','ROPA','verde', 'XL', 100, 5060, 7900); 

SELECT * FROM control; 

DROP TRIGGER IF EXISTS TR_articulos_update_log; 

DELIMITER //
CREATE TRIGGER TR_articulos_update_log
AFTER UPDATE ON articulos
FOR EACH ROW
  BEGIN
  INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
  VALUES('articulos', 'update', curdate(), curtime(), current_user(), OLD.id);
  END; //
DELIMITER ;

UPDATE articulos SET color = 'mostaza' WHERE id = 5;

SELECT * FROM control;

DROP TRIGGER IF EXISTS TR_articulos_delete_log; 

DELIMITER //
CREATE TRIGGER TR_articulos_delete_log
AFTER DELETE ON articulos
FOR EACH ROW
  BEGIN
  INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
  VALUES('articulos', 'delete', curdate(), curtime(), current_user(), OLD.id);
  END; //
DELIMITER ; 

DELETE FROM articulos WHERE id = 8;

SELECT * FROM control;

-- ----------------------------- DETALLES --------------------------------------

DROP TRIGGER IF EXISTS TR_detalles_insert_log;

DELIMITER //
CREATE TRIGGER TR_detalles_insert_log
AFTER INSERT ON detalles
FOR EACH ROW
BEGIN
INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
VALUES('detalles', 'insert', curdate(), curtime(), current_user(), NEW.id);
END; //
DELIMITER ; 

INSERT INTO detalles(idArticulo, idFactura, precio, cantidad) VALUES(1, 3, 4883, 210); 

SELECT * FROM control; 

DROP TRIGGER IF EXISTS TR_detalles_update_log; 

DELIMITER //
CREATE TRIGGER TR_detalles_update_log
AFTER UPDATE ON detalles
FOR EACH ROW
  BEGIN
  INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
  VALUES('detalles', 'update', curdate(), curtime(), current_user(), OLD.id);
  END; //
DELIMITER ; 

UPDATE detalles SET precio= 29904 WHERE id = 10; 

SELECT * FROM control;

DROP TRIGGER IF EXISTS TR_detalles_delete_log;

DELIMITER //
CREATE TRIGGER TR_detalles_delete_log
AFTER DELETE ON detalles
FOR EACH ROW
BEGIN
INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
VALUES('detalles', 'delete', curdate(), curtime(), current_user(), OLD.id);
END; //
DELIMITER ; 

DELETE FROM detalles WHERE id = 19;

SELECT * FROM control;

-- ------------------------- FACTURAS --------------------------------------------

DROP TRIGGER IF EXISTS TR_facturas_insert_log;

DELIMITER //
CREATE TRIGGER TR_facturas_insert_log
AFTER INSERT ON facturas
FOR EACH ROW
  BEGIN
  INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
  VALUES('facturas', 'insert', curdate(), curtime(), current_user(), NEW.id);
  END; //
DELIMITER ; 

INSERT INTO facturas(letra, numero, fecha, medioDePago,idCliente)
VALUES('B', 233, curdate(), 'DEBITO', 1);

SELECT * FROM control;

DROP TRIGGER IF EXISTS TR_facturas_delete_log; 

DELIMITER //
CREATE TRIGGER TR_facturas_delete_log
AFTER DELETE ON facturas
FOR EACH ROW
BEGIN
INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
VALUES('facturas', 'delete', curdate(), curtime(), current_user(), OLD.id);
END; //
DELIMITER ;

DELETE FROM facturas WHERE id = 2;

SELECT * FROM control;

DROP TRIGGER IF EXISTS TR_facturas_update_log; 

DELIMITER //
CREATE TRIGGER TR_facturas_update_log
AFTER UPDATE ON facturas
FOR EACH ROW
  BEGIN
  INSERT INTO control(tabla, accion, fecha, hora, usuario, idRegistro)
  VALUES('facturas', 'update', curdate(), curtime(), current_user(), OLD.id);
  END; //
DELIMITER ; 

UPDATE facturas SET medioDePago='TARJETA' WHERE id=1; 

SELECT * FROM control; 
