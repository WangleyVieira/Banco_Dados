create table customers(
	id serial not null,
	CustomerName varchar(40) not null,
	ContactName varchar(40) not null,
	Address varchar(40) not null,
	City varchar(30),
	PostalCode varchar(15) unique not null,
	Country varchar(15) not null,
	primary key(id)
);
select *
from customers;

insert into customers(CustomerName, ContactName, Address, City, PostalCode, Country)
values('Alfreds Futterkiste', 'Alfred Schmidt', 'Obere Str. 57', 'Frankfurt', '12209', 'Germany'),
('Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico'),
('Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
('Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden');

insert into customers(CustomerName, ContactName, Address, City, PostalCode, Country)
values('Blauer See Delikatessen', 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', '68306', 'Germany'),
('Blondel père et fils', 'Frédérique Citeaux', '24, place Kléber', 'Strasbourg', '67000', 'France');

--selecionar apenas os países
select Country
from customers;

--contagem de países
select count (Country)
from customers;

--selecionar apenas países Germany
select Country
from customers
where Country = 'Germany';

select Country, City
from customers
where Country = 'Germany'and City = 'Frankfurt';

select *
from customers
where Country = 'Germany' and (City = 'Manheim' or City = 'Frankfurt');


create table customers1(
	id serial not null,
	CustomerName varchar(40) not null,
	ContactName varchar(40) not null,
	Address varchar(40) not null,
	City varchar(30),
	PostalCode varchar(15) unique not null,
	Country varchar(15) not null,
	primary key(id)
);
select *
from customers1;

select *
from customers1
limit 3; --seleciona instrução SQL os três primeiros registros da tabela "Clientes"

--ordenar a tabela customers
select *
from customers
order by id;
-------------------
insert into customers1(CustomerName, ContactName, Address, City, PostalCode, Country)
values('Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
('Rancho grande', 'Sergio Gutiérrez', 'Av. del Libertador 900', 'Buenos Aires', '1010', 'Argentina'),
('Blondel père et fils', 'Frédérique Citeaux', '24, place Kléber', 'Strasbourg', '67000', 'France'),
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('The Cracker Box', 'Liu Wong', '55 Grizzly Peak Rd.', 'Butte', '59801', 'USA');

--ordenar CustomerName 
select *
from customers1
order by CustomerName;

--ordem países em ordem decrescente
select Country
from customers1
order by Country desc;

--atualizar registro
update customers1
set ContactName = 'Juan'
where Country = 'France';


update customers1
set City = 'New York'
where id = 5;

select *
from customers1;

--apagar registros da tabela, onde o id = 6
delete 
from customers
where id = 6;

--atualizar o nome da pessoa para Wangley Vieira da tabela customers
update customers
set CustomerName = 'Wangley Vieira'
where id = 2;

create table dependents(
	id_customers int,
	NameDependent varchar(40),
	CountryDependent varchar(15),
	YearDependent date,
	primary key(id_customers),
	foreign key (id_customers) references customers(id)
);

insert into dependents(id_customers, NameDependent, CountryDependent, YearDependent)
values(1, 'Clark Whithers', 'USA', '2005/05/25');
insert into dependents(id_customers, NameDependent, CountryDependent, YearDependent)
values(2, 'Cersei Kallts', 'Germany', '1990/06/30'), 
(3, 'Daniella Grandete', 'Brazil', '1995/03/12'), 
(5, 'Lyanna Vieira', 'Brazil', '1998/09/16'),
(4, 'Darly Flatters', 'Norway', '1900/06/10');

select *
from dependents;

update dependents
set YearDependent = '1980/06/25'
where id_customers = '4';

--adicionar coluna na tabela customers
alter table customers
add Email varchar(30);	

select *
from customers;

insert into customers(email)
values('alfreds@gmail.com');


























