drop database if exists serviciosDGT;

create database if not exists serviciosDGT;

use serviciosDGT;

create table usuarios (
    ID int auto_increment primary key,
    nombreUser varchar(30),
    pass varchar(30),
    adm boolean default false
) engine = InnoDB;

create table representantes (
    ID int auto_increment primary key,
    nombreRepresentante varchar(30),
    password varchar(30),
    idUsuario int,
    FOREIGN KEY (idUsuario) REFERENCES usuarios(ID)
) engine = InnoDB;

create table multas (
    IdMulta int auto_increment primary key,
    tipoInfraccion varchar(100),
    cantidad double,
    idUsuario int,
    FOREIGN KEY (idUsuario) REFERENCES usuarios(ID)
) engine = InnoDB;