set serveroutput on;

create table trabajador(seguro_social integer, nombre varchar2(80), paterno varchar2(80), constraint pk_trabajador primary key(seguro_social));

--creamos la secuencia para la nomina

create sequence sec_nomina
start with 1
increment by 1
nomaxvalue;

--creamos la segunda tabla nomina

create table nomina(id_nomina integer, seguro_social integer, horas_laboradas integer, 
fecha_pago date, saldo float, constraint pk_id_nomina primary key(id_nomina), 
constraint fk1_seguro_social foreign key (seguro_social) references trabajador(seguro_social));

--procedimiento para guardar trabajadro

create or replace procedure guarda_trabajador(my_id in integer, my nombre, in varchar2, my paterno in varchar2) as
begin
insert into trabajador(my_id, my_nombre, my_paterno);
end;
/

CREATE TABLE TRABAJADOR(SEGURO_SOCIAL INTEGER, NOMBRE VARCHAR2(80), PATERNO VARCHAR2(80), CONSTRAINT PK_TRABAJADOR PRIMARY KEY(SEGURO_SOCIAL));

--CREAMOS LA SECUENCIA PARA LA NOMINA

CREATE SEQUENCE SEC_NOMINA
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--CREAMOS LA SEGUNDA TABLA NOMINA

CREATE TABLE NOMINA(ID_NOMINA INTEGER, SEGURO_SOCIAL INTEGER, HORAS_LABORADAS INTEGER, 
FECHA_PAGO DATE, SALDO FLOAT, CONSTRAINT PK_ID_NOMINA PRIMARY KEY(ID_NOMINA), 
CONSTRAINT FK1_SEGURO_SOCIAL FOREIGN KEY (SEGURO_SOCIAL) REFERENCES TRABAJADOR(SEGURO_SOCIAL));

--PROCEDIMIENTO PARA GUARDAR TRABAJADRO

CREATE OR REPLACE PROCEDURE GUARDA_TRABAJADOR(MY_ID IN INTEGER, MY_NOMBRE IN VARCHAR2, MY_PATERNO IN VARCHAR2) AS
BEGIN
INSERT INTO TRABAJADOR values(MY_ID, MY_NOMBRE, MY_PATERNO);
END;
/

CREATE OR REPLACE PROCEDURE GUARDAR_NOMINA(MY_ID_NOMINA OUT INTEGER, MY_SEGURO_SOCIAL IN INTEGER)
AS
BEGIN
SELECT SEC_NOMINA.NEXTVAL INTO MY_ID_NOMINA FROM DUAL;
INSERT INTO NOMINA(ID_NOMINA, SEGURO_SOCIAL)
VALUES(MY_ID_NOMINA, MY_SEGURO_SOCIAL);
END;
/

--GUARDAS LOS SIGUIENTES DOS TRABAJADORES JUNTO CON SU NOMINA

DECLARE

VALOR INTEGER;
BEGIN
GUARDA_TRABAJADOR(777, 'ANA ','LOPEZ' );
GUARDAR_NOMINA(VALOR,777);
END;
/
SELECT * FROM TRABAJADOR;
SELECT * FROM NOMINA;

DELETE FROM TRABAJADOR;
