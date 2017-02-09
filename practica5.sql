set serveroutput on;

--Se crea la primer tabla Pelicula
create table pelicula(id_pelicula integer, titulo varchar2(80), sinopsis varchar2(80),  constraint pk_id_pelicula primary key(id_pelicula));

--Se crea la segunda tabla Sala
create table sala(num_sala integer, id_pelicula integer,  constraint pk_num_sala primary key(num_sala), 
constraint fk_id_pelicula foreign key(id_pelicula ) references pelicula(id_pelicula));

--Se crea la tercer tabla Horario
create table horario(id_horario integer, fecha date, id_pelicula integer,  constraint pk_id_horario primary key(id_horario), 
constraint fk1_id_pelicula foreign key(id_pelicula) references pelicula (id_pelicula));

--Se crea la secuencia para la tabla Pelicula
create sequence sec_pelicula
start with 1
increment by 1
nomaxvalue;

--Se crea la secuencia para la tabla Horario
create sequence sec_horario
start with 1
increment by 1
nomaxvalue;

--se crean los procedimiento para guardar pelicula
create or replace procedure guardar_pelicula(my_id_pelicula out integer, my_titulo in varchar2, my_sinopsis in varchar2) 
as
begin
select sec_pelicula.nextval into my_id_pelicula from dual;
insert into pelicula values(my_id_pelicula, my_titulo, my_sinopsis);
end;
/

--Se crean los procedimientos para guardar sala
create or procedure guardar_sala(my_num_sala in integer, my_id_pelicula in integer)
as
begin
insert into sala values(my_num_sala, my_id_pelicula);
end;
/

--Se crean los procedimientos para guardar horario
create or procedure guardar_horario(my_id_horario out integer, my_id_pelicula out integer, my_fecha in date)
as
begin
select sec_horario.nextval into my_id_horario from dual;
insert into horario values(my_id_horario, my_id_pelicula, my_fecha);
end;
/

