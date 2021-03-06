SET SERVEROUTPUT ON;

--RECAPITULANDO LO QUE ES UN BLOQUE PL/SQL

DECLARE

--CALCULAR MI EDAD EN DIAS

EDAD INTEGER:=20;
DIAS INTEGER;
ESTATUS VARCHAR2(30);

BEGIN
DIAS:=EDAD *365;
IF DIAS > 10000 THEN
ESTATUS:='VIEJO';
ELSE 
ESTATUS:='JOVEN';

END IF;
DBMS_OUTPUT.PUT_LINE('TU EDAD EN DIAS ES: ' || ' ' || DIAS || ' ' || 'TU ESTATUS ES: ' || ESTATUS);
END ;
/

-- VEREMOS NUESTRO PRIMER PROCEDIMIENTO ALMACENADO

CREATE OR REPLACE PROCEDURE SALUDAR(MENSAJE IN VARCHAR2)
AS
BEGIN
DBMS_OUTPUT.PUT_LINE('HOLA BUENAS NOCHES' || MENSAJE);
END;
/

-- EJECUTAMOS EL PROCEDIMIENTO

EXEC SALUDAR(' CESAR MADRID');

--GENERANDO LA SECUENCIA PARA EL EJEMPLO DE CLASE

CREATE SEQUENCE SEC_PERSONA
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE TABLE PERSONA(ID_PERSONA INTEGER, NOMBRE VARCHAR2(20), EDAD INTEGER, CONSTRAINT PK_ID_PERSONA PRIMARY KEY (ID_PERSONA));
