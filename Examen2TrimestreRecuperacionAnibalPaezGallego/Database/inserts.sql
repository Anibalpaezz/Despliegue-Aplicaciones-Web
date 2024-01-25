use serviciosDGT;

insert into usuarios (nombreUser, pass, adm) values ("anibal", "nico", true);
insert into usuarios (nombreUser, pass, adm) values ("nico", "nico", false);

insert into representantes (nombreRepresentante, password, idUsuario) values ("alejandro", "nico", 1);
insert into representantes (nombreRepresentante, password, idUsuario) values ("paco", "nico", 1);
insert into representantes (nombreRepresentante, password, idUsuario) values ("carmen", "nico", 2);
insert into representantes (nombreRepresentante, password, idUsuario) values ("geles", "nico", 2);

insert into multas (tipoInfraccion, cantidad, idUsuario) values ("velocidad", 200.99, 1);
insert into multas (tipoInfraccion, cantidad, idUsuario) values ("aparcar", 400.99, 1);
insert into multas (tipoInfraccion, cantidad, idUsuario) values ("velocidad", 200.99, 2);
insert into multas (tipoInfraccion, cantidad, idUsuario) values ("aparcar", 400.99, 2);