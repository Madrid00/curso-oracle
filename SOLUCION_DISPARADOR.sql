SET SERVEROUTPUT ON;

CREATE TABLE TRABAJADOR_INI(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(40), SUELDO_BASE FLOAT);
CREATE TABLE RESPALDO(ID INTEGER , NOMBRE VARCHAR2(40), SUELDO_BASE FLOAT);

INSERT INTO TRABAJADOR_INI VALUES(1,'JUAN', 10000);
INSERT INTO TRABAJADOR_INI VALUES(2,'CHETO', 15000);
INSERT INTO TRABAJADOR_INI VALUES(3,'ANA', 20000);

CREATE OR REPLACE PROCEDURE CONTAR(NUMERO OUT INTEGER)
AS
BEGIN
SELECT COUNT(*) INTO NUMERO FROM TRABAJADOR_INI;

DBMS_OUTPUT.PUT_LINE('ENCONTRADOS  '||NUMERO);
END;
/

DECLARE 
VALOR INTEGER;
BEGIN
CONTAR(VALOR);
END;
/

-- EL QUE COPIA
CREATE OR REPLACE PROCEDURE COPIAR 
AS
CURSOR CUR_TRABAJADOR_INI IS SELECT * FROM TRABAJADOR_INI;
BEGIN
FOR REC IN CUR_TRABAJADOR_INI LOOP
INSERT INTO RESPALDO VALUES(REC.ID, REC.NOMBRE, REC.SUELDO_BASE);
END LOOP;
END;
/

CREATE OR REPLACE TRIGGER DISP_TRABAJADOR_INI BEFORE INSERT ON TRABAJADOR_INI FOR EACH ROW
DECLARE
VALOR INTEGER;
BEGIN
CONTAR(VALOR);
IF  VALOR = 3 THEN
COPIAR();
DELETE FROM TRABAJADOR_INI;
END IF;
END;
/
------------------------------------------------------
INSERT INTO TRABAJADOR_INI VALUES(4,'PELUSIN', 1000);
INSERT INTO TRABAJADOR_INI VALUES(5,'CHANO', 20000);
INSERT INTO TRABAJADOR_INI VALUES(6,'LUPE', 3000);
INSERT INTO TRABAJADOR_INI VALUES(7,'ELVER', 4000);

SELECT * FROM TRABAJADOR_INI;
SELECT * FROM RESPALDO;