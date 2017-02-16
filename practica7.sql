SET SERVEROUTPUT ON;

CREATE TABLE TRABAJADORES(SEGURO INTEGER PRIMARY KEY, NOMBRE VARCHAR(25), EDAD INTEGER);

CREATE TABLE NOMINAS(ID_NOMINAS INTEGER, SEGURO INTEGER, SUELDO_BASE FLOAT, HORAS_LABORADAS INTEGER, 
FECHA_PAGO DATE, CONSTRAINT PK_ID_NOMINAS PRIMARY KEY (ID_NOMINAS), CONSTRAINT FK1_SEGURO FOREIGN KEY(SEGURO) REFERENCES
TRABAJADORES(SEGURO));

CREATE SEQUENCE SEC_NOMINAS
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE OR REPLACE PROCEDURE GUARDAR_NOMINAS(MY_ID_NOMINAS OUT INTEGER, MY_SEGURO IN INTEGER, MY_SUELDO_BASE IN INTEGER) AS
BEGIN
SELECT SEC_NOMINAS.NEXTVAL INTO MY_ID_NOMINAS FROM DUAL;
INSERT INTO NOMINAS(ID_NOMINAS, SEGURO, SUELDO_BASE)
VALUES(MY_ID_NOMINAS, MY_SEGURO, MY_SUELDO_BASE);
END;
/

SELECT * FROM NOMINAS;

CREATE OR REPLACE ASIGNAR_HORAS(MY_SEGURO IN INTEGER, MY_HORAS_LABORADAS IN INTEGER) AS
BEGIN
SELECT SEC_NOMINAS.NEXTVAL INTO MY_ID_NOMINAS FROM DUAL;
INSERT INTO NOMINAS(ID_NOMINAS, SEGURO, SUELDO_BASE, HORAS_LABORADAS)
VALUES (MY_ID_NOMINAS, MY_SEGURO, MY_SUELDO_BASE, MY_HORAS_LABORADAS);
END;
7
