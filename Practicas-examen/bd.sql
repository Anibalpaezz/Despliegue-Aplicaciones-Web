drop database if exists examen;
create database if not exists examen;

use examen;

create table usuarios(
    nombre varchar(30),
    pass varchar(30)
);

insert into usuarios (nombre, pass) values ("anibal", "nico");