create database naruto;
use naruto;

create table cla (
	id int primary key auto_increment,
    nome varchar(30) not null
) auto_increment = 100;

create table jutsu (
	id int primary key auto_increment,
    nome varchar(30) not null,
    custoChakra int
) auto_increment = 1000;

create table classeNinja (
	id int primary key auto_increment,
    nome varchar(30)
);

create table aldeia (
	id int primary key auto_increment,
    nome varchar(30) not null,
    pais varchar(30) not null,
    dtFundacao date not null
);

create table personagem (
	id int primary key auto_increment,
    nome varchar(30) not null,
    qtdChakra int not null,
    fkclasseNinja int not null,
    fkcla int,
    fkaldeia int not null,
    fksensei int,
    dtNascimento date,
    
    constraint personagem_cla_fk foreign key(fkcla) references cla(id),
    constraint personagem_classeNinja_fk foreign key(fkclasseNinja) references classeNinja(id),
    constraint personagem_aldeia_fk foreign key(fkaldeia) references aldeia(id),
    constraint personagem_sensei_fk foreign key(fksensei) references personagem(id)
);

create table bijus (
	id int primary key auto_increment,
    nome varchar(40) not null,
    fkportador int,
    
    constraint biju_portador_fk foreign key(fkportador) references personagem(id),
    constraint uk_fkportador unique key(fkportador)
);

create table personagemJutsu (
	fkpersonagem int,
    fkjutsu int,
    
    primary key (fkpersonagem, fkjutsu)
);

-- INSERTS
insert into cla(nome)
values('Uzumaki'),
('Uchiha'),
('Hyuga'),
('Kaguya'),
('Kazekage'),
('Hatake'),
('Yakushi'),
('Senju');

insert into jutsu(nome, custoChakra)
values('Rasengan', 70),
('Chidori', 45),
('Jutsu Clone Das Sombras', 40),
('Amaterasu', 210),
('Susanoo', 400),
('Bola de Fogo', 30),
('Dragão de Água', 50),
('Parede de Terra', 60),
('Foice de Vento', 35),
('Lâmina Relâmpago', 60);

insert into classeNinja(nome)
values('Genin'),
('Jonin'),
('Anbu'),
('Kage'),
('Sannin'),
('Jinchuuriki');

insert into aldeia(nome, pais, dtFundacao)
values ('Konohagakure', 'País do Fogo', '1180-09-15'),
('Sunagakure', 'País do Vento', '1190-06-03'),
('Iwagakure', 'País da Terra', '1188-04-14'),
('Amegakure', 'País da Chuva', '1195-05-01'),
('Otogakure', 'País do Som', '1198-08-28');

select * from aldeia;

insert into personagem(nome, qtdChakra, fkclasseNinja, fkcla, fkaldeia, fksensei, dtNascimento)
values('Madara', 9999, 5, 101, 1, NULL, '1890-01-15'),
('Itachi', 4800, 4, 101, 1, NULL, '1992-03-26'),
('Obito', 4000, 4, 101, 1, 1, '1970-07-19'),
('Kakashi', 3000, 4, 105, 1, NULL, '1970-05-03'),
('Sasuke', 3500, 1, 101, 1, 4, '1997-08-12'),
('Naruto', 3800, 6, 100, 1, 4, '1997-10-10'),
('Neji', 2000, 2, 102, 1, NULL, '1990-07-08'),
('Hinata', 2500, 2, 102, 1, NULL, '1990-12-27'),
('Jiraiya', 7000, 5, NULL, 1, NULL, '1960-11-03'),
('Tsunade', 6500, 5, 107, 1, NULL, '1955-08-02'),
('Orochimaru', 6800, 5, 106, 5, NULL, '1965-10-27'),
('Kabuto', 5500, 2, 106, 5, 11, '1980-02-29'),
('Kimimaro', 4500, 1, 103, 5, 11, '1983-06-15'),
('Pain', 6000, 1, 100, 4, 9, '1980-03-09'),
('Konan', 5200, 1, NULL, 4, 9, '1983-02-20'),
('Yahiko', 4000, 1, NULL, 4, 9, '1980-06-02'),
('Gaara', 4000, 6, 104, 2, NULL, '1989-01-19'),
('Temari', 3500, 2, 104, 2, NULL, '1985-08-23'),
('Kankuro', 2900, 2, 104, 2, NULL, '1987-05-15'),
('Han', 4600, 6, NULL, 3, NULL, '1977-02-22'),
('Roshi', 4200, 6, NULL, 3, NULL, '1973-12-02');

insert into personagemjutsu(fkpersonagem, fkjutsu)
values(1, 1003),
(1, 1004),
(1, 1005),
(2, 1003),
(2, 1005),
(3, 1000),
(3, 1001),
(3, 1002),
(3, 1004),
(3, 1005),
(3, 1009),
(4, 1001),
(4, 1002),
(4, 1008),
(4, 1009),
(6, 1000),
(6, 1002),
(6, 1008),
(9, 1000),
(9, 1002),
(9, 1005),
(9, 1006),
(9, 1007),
(9, 1009),
(12, 1001),
(12, 1005),
(12, 1007);

insert into bijus(nome, fkportador)
values('Kurama', 6),
('Shukaku', 17),
('Kokuou', 20),
('Son Gokuu', 21);

select 
pers.id,
pers.nome,
clnj.nome 
from personagem pers
inner join classeNinja clnj on pers.fkclasseNinja = clnj.id
where clnj.nome = 'Jinchuuriki';

select * from aldeia;
select * from bijus;
select * from cla;
select * from classeNinja;
select * from jutsu;
select * from personagem;
select * from personagemJutsu;
