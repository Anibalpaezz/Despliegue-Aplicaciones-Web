create database elBuenTe;
use elBuenTe;

create table usuarios(
    id int auto_increment primary key,
    nombreUser varchar(30),
    password varchar(20),
    adm boolean default false
)engine=InnoDB;

insert into usuarios (nombreUser, password, adm) values ("admin", "1234", true);
insert into usuarios (nombreUser, password, adm) values ("usuario1", "1234", false);

create table TiposDeTe(
    IDTe varchar(5) primary key,
    nombre varchar(30),
    tipo varchar(30),
    aroma varchar(30),
    precio varchar(30)
)engine=InnoDB;

insert into TiposDeTe (IDTe, nombre, tipo, aroma, precio) values ("T001", "Darjeeling", "Negro", "Floral", "10.99");
insert into TiposDeTe (IDTe, nombre, tipo, aroma, precio) values ("T002", "Sencha", "Verde", "Frutal", "8.50");
insert into TiposDeTe (IDTe, nombre, tipo, aroma, precio) values ("T003", "Tie Guan Yin", "Oolong", "Herbal", "12.75");