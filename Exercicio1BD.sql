create database imovelnet;
 
use imovelnet;
 
create table vendedor 
(
cd_vendedor int not null primary key,
nm_vendedor varchar (40),
nm_endereco varchar (40),
nr_cpf decimal (11),
nm_cidade varchar (20),
nm_bairro varchar (20),
sg_estado char (2),
telefone varchar (20),
email varchar (80),
);
 
create table comprador
(
cd_comprador int not null primary key,
nm_comprador varchar (40),
nm_endereco varchar (40),
nr_cpf decimal (11),
nm_cidade varchar (20),
nm_bairro varchar (20),
sg_estado varchar (2),
telefone varchar (20),
email varchar (80)
);
 
create table estado
(
sg_estado char (2) not null primary key,
nm_estado varchar (20),
);
 
create table cidade
(
cd_cidade int not null,
sg_estado char (2) not null,
nm_cidade varchar (20),
primary key (cd_cidade, sg_estado)
foreign key (sg_estado) references estado (sg_estado)
);
 
create table bairro
(
cd_bairro int not null,
cd_cidade int not null,
sg_estado char (2),
nm_bairro varchar (20),
primary key (cd_bairro, cd_cidade, sg_estado),
foreign key (cd_cidade, sg_estado) references cidade (cd_cidade, sg_estado)
);
 
create table imovel
(
cd_imovel int not null primary key,
cd_vendedor int,
cd_bairro int,
cd_cidade int,
sg_estado int,
nm_endereco int,
nr_area_util decimal (10,2),
ds_imovel varchar (300),
vl_preco decimal (16,2),
nr_ofertas int,
st_vendido char (1),
dt_lancamento date,
imovel_indicado int,
foreign key (cd_vendedor) references vendedor (cd_vendedor),
foreign key (cd_bairro, cd_cidade, sg_estado) references bairro (cd_bairro, cd_cidade, sg_estado),
foreign key (imovel_indicado) references imovel (imovel_indicado)
);
 
create table oferta
(
cd_imovel int not null,
cd_comprador int not null,
vl_oferta decimal (16,2),
dt_oferta date,
primary key (cd_imovel, cd_comprador),
foreign key (cd_imovel) references imovel (cd_imovel),
foreign key (cd_comprador) references comprador (cd_comprador)
);
 
create table faixa_imovel
(
cd_faixa int not null primary key,
nm_faixa varchar (30),
vl_minimo decimal (14,2),
vl_maximi decimal (14,2)
);
 
insert into estado values
('SP', 'São Paulo'),
('RJ', 'Rio de Janeiro');
 
insert into cidade values
(1, 'São Paulo', 'SP'),
(2, 'Santo André', 'SP'),
(3, 'Campinas', 'SP'),
(1, 'Rio de Janeiro', 'RJ'),
(2, 'Niterói', 'RJ');
 
insert into bairro values
(1, 'Jardins', 1, 'SP'),
(2, 'Morumbi', 1, 'SP'),
(3, 'Aeroporto', 1, 'SP'),
(1, 'Aeroporto', 1, 'RJ'),
(2, 'Flamengo', 1, 'RJ');
 
insert into vendedor values (cd_vendedor, nm_vendedor, nm_endereco, email)
(1, 'Maria da Silva', 'Rua do Grito, 45', 'msilva@novatec.com.br'),
(2, 'Marcos Andrade', 'Av. da Saudade, 325', 'mandrade@novatec.com.br'),
(3, 'Andre Cardoso', 'Av. Brasil, 401', 'acardoso@novatec.com.br'),
(4, 'Tatiana Souza', 'Rua do Imperador, 778', 'tsouza@novatec.com.br');
 
insert into imovel values
(1, 1, 1, 1, 'SP', 'Av. Tietê, 3304 AP 101', 250, 400, 180000, null),
(2, 1, 2, 1, 'SP', 'Av. Morumbi, 2230', 150, 250, 135000, 1),
(3, 2, 1, 1, 'RJ', 'R. Gal Osório, 445 AP 34', 250, 400, 185000, 2),
(4, 2, 2, 1, 'RJ', 'R. D. Pedro I, 882', 120, 200, 110000, 1),
(5, 3, 3, 1, 'SP', 'Av. Ruben Berta, 2355', 110, 200, 95000, 4),
(6, 4, 1, 1, 'RJ', 'R. Getúlio Vargas, 552', 200, 300, 99000, 5);
 
insert into comprador values
(1, 'Emmanuel Antunes', 'R. Saraiva, 452', 'eantunes@novatec.com.br'),
(2, 'Joana Pereira', 'Av. Portugal, 52', 'jpereira@novatec.com.br'),
(3, 'Ronaldo Campelo', 'R. Estados Unidos, 790', 'rcampelo@novatec.com.br'),
(4, 'Manfred Augusto', 'Av. Brasil, 351', 'maugusto@novatec.com.br');
 
insert into oferta values
(1, 1, 170000, '10/01/02'),
(1, 3, 180000, '10/01/02'),
(2, 2, 135000, '15/02/02'),
(2, 4, 100000, '15/02/02'),
(3, 1, 160000, '05/01/02'),
(3, 2, 140000, '20/02/02');
 
update imovel set
vl_preco=198000
where cd_imovel=1;
 
update imovel set
vl_preco=148500
where cd_imovel=2;
 
update imovel set
vl_preco=203500
where cd_imovel=3;
 
update imovel set
vl_preco=121000
where cd_imovel=4;
 
update imovel set
vl_preco=104500
where cd_imovel=5;
 
update imovel set
vl_preco=108900
where cd_imovel=6;
 
update imovel set
vl_preco=188100
where cd_imovel=1;
 
update imovel set
vl_preco=141075
where cd_imovel=2;
 
update oferta set
vl_oferta=vl_oferta+5%
where cd_comprador=2;
 
update comprador set
nm_endereco='R. Ananás, 45', sg_estado='RJ'
where cd_comprador=3;
 
update oferta set
vl_oferta=101000
where cd_comprador=2 && cd_imovel=4;
 
delete from oferta
where cd_comprador=3 && cd_imovel=1;
 
delete from cidade
where cd_cidade=3;
 
insert into faixa_imovel values
(1, 'Baixo', 0, 105000),
(2, 'Médio', 105001, 180000),
(3, 'Alto', 180001, 999999);
 
select * from bairro;
 
select cd_comprador, nm_comprador, email from comprador;
 
select cd_vendedor, nm_vendedor, email from vendedor;
 
select cd_vendedor, nm_vendedor, email from vendedor
order by nome desc;
 
select bairro from estado
where estado = 'SP';
 
select cd_imovel, cd_vendedor, vl_preco from imovel
where cd_vendedor=2;
 
select cd_imovel, cd_vendedor, vl_preco, sg_estado from imovel
where vl_preco between(0 and 149999) AND sg_estado='RJ';
 
select cd_imovel, cd_vendedor, vl_preco, sg_estado from imovel
where vl_preco between(0 and 149999) AND cd_vendedor=1;
 
select cd_imovel, cd_vendedor, vl_preco, sg_estado from imovel
where vl_preco between(0 and 149999) AND cd_vendedor <> 2;
 
select cd_comprador, nm_comprador, nm_endereco, sg_estado from comprador
where estado is null;
 
select cd_comprador, nm_comprador, nm_endereco, sg_estado from comprador
where estado is not null;
 
select * from oferta
where vl_oferta between(100000 and 150000);
 
select * from oferta
where dt_oferta between('01/02/02' and '01/03/02');
 
select * from vendedor
where nm_vendedor like 'M%';
 
select * from vendedor
where nm_vendedor like '_a%';
 
select * from comprador
where nm_endereco like '%u%';
 
select * from oferta
where cd_imovel = 1 OR cd_imovel = 2;
 
select * from imovel
where cd_imovel = 2 OR cd_imovel = 3
order by nm_endereco;
 
select * from oferta
where cd_imovel = 2 AND cd_imovel = 3 AND vl_oferta between(140000 and 999999)
order by dt_oferta desc;
 
select * from imovel
where vl_preco between(110000 and 200000) OR cd_vendedor = 1
order by nr_area_util;

select current_date;

select cd_imovel, vl_preco, vl_preco*1.10 from imovel;

select cd_imovel, vl_preco, vl_preco*1.10, vl_preco*1.10-vl_preco from imovel;

select UPPER(nm_vendedor), LOWER(email) from vendedor;

select nm_comprador '-' nm_cidade from comprador;

select * from comprador
where nm_comprador like '%a%';

select SUBSTRING(nm_comprador from 1 for 1), nm_bairro from comprador;

select cd_imovel, day(current_date)-day(dt_oferta) from imovel;

select cd_imovel, dt_lancamento, day(current_date)-day(dt_lancamento) from imovel;

select cd_imovel, dt_lancamento, day(current_date)-day(dt_lancamento), day(dt_lancamento)+15 from imovel;;