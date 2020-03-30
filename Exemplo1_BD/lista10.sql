/*Banco de dados para as questões:
	profissao(codigo,nome)
	pessoa (codigo, nome, cpf, salario, data_nascimento,codigo_profissao)
	produto( codigo, nome, preco)
	compra (codigo, valor_total, data, codigo_pessoa)
	compra_produto (codigo_compra, codigo_produto, quantidade)
*/
CREATE TABLE profissao(
	codigo serial NOT NULL,
	nome varchar(50) NOT NULL,
	primary key (codigo)
);

CREATE TABLE pessoa(
	codigo serial NOT NULL,
	nome varchar(50) NOT NULL,
	cpf varchar(11) UNIQUE NOT NULL,
	salario numeric(10,2),
	data_nascimento date,
	codigo_profissao int,
	primary key (codigo),
	FOREIGN KEY(codigo_profissao) REFERENCES profissao(codigo)
);

CREATE TABLE compra(
	codigo serial NOT NULL,
	valor_total numeric(10,2),
	data timestamp,
	codigo_pessoa int,
	primary key (codigo),
	FOREIGN KEY(codigo_pessoa) REFERENCES pessoa(codigo)
);

CREATE TABLE produto(
	codigo serial NOT NULL,
	nome varchar(50) NOT NULL,
	preco numeric(10,2),
	primary key (codigo)
);

CREATE TABLE compra_produto(
	codigo_compra int,
 	codigo_produto int,
 	quantidade int,
	primary key (codigo_compra, codigo_produto),
	FOREIGN KEY(codigo_compra) REFERENCES compra(codigo),
	FOREIGN KEY(codigo_produto) REFERENCES produto(codigo)
);


insert into profissao (nome) values ('Tecnologia da Informação');
insert into profissao (nome) values ('Pedreiro');
insert into profissao (nome) values ('DBA');
insert into profissao (nome) values ('Professor');

insert into pessoa(nome, cpf, salario, data_nascimento, codigo_profissao)
values ('Tomas','11133344422', 5500.00, '12/09/1990', 1);
insert into pessoa(nome, cpf, salario, data_nascimento, codigo_profissao)
values ('Jaqueline', '22233344411', 70000.00, '25/10/1985', 3);
insert into pessoa(nome, cpf, salario, data_nascimento, codigo_profissao)
values ('Pedro', '99233344411', 3000.00, '25/10/1960', 3);
insert into pessoa(nome, cpf, salario, data_nascimento, codigo_profissao)
values ('João Silva','44133344422', 7000.00, '12/09/1977', 1);
insert into pessoa(nome, cpf, salario, data_nascimento, codigo_profissao)
values ('Fulano','14133344422', 1500.00, '12/09/1988', 4);

insert into produto( nome, preco)
values('Refrigerante', 7.70);
insert into produto ( nome, preco)
values('Cerveja', 10.0);
insert into produto ( nome, preco)
values('Picanha', 75 );
insert into produto ( nome, preco)
values('Frango', 20);
insert into produto ( nome, preco)
values('Molho de tomate', 4);
insert into produto ( nome, preco)
values('Chocolate', 100);

insert into compra (valor_total, data, codigo_pessoa)
values(175, current_timestamp(0), 1 );
insert into compra (valor_total, data, codigo_pessoa)
values(400, current_timestamp(0), 1 );

insert into compra_produto( codigo_compra, codigo_produto,quantidade)
values(1,6, 1);
insert into compra_produto( codigo_compra, codigo_produto, quantidade)
values(1,3, 1);
insert into compra_produto( codigo_compra, codigo_produto, quantidade)
values(2,6, 4); 

--1) Selecione o nome, o cpf e o valor total das compras das pessoas.

select pes.nome, pes.cpf, com.valor_total
from pessoa pes inner join compra com on pes.codigo = com.codigo_pessoa;

--2) Selecione o nome, salario e o nome da profissão das pessoas que tem salario maior do que 1000.
select pes.nome, pes.salario, prof.nome
from pessoa pes inner join profissao prof on  prof.codigo = pes.codigo_profissao 
where pes.salario > 1000;

--3) Selecione o valor total das compras, a data, os produtos comprados e as quantidades.
select com.valor_total, com.data, prod.nome, com_prod.quantidade
from compra com, produto prod, compra_produto com_prod
where com.codigo = com_prod.codigo_compra and prod.codigo = com_prod.codigo_produto;

	--INNER JOIN
select com.valor_total, com.data, prod.nome, com_prod.quantidade
from pessoa pes inner join compra com on pes.codigo = com.codigo_pessoa
	inner join compra_produto com_prod on com.codigo = com_prod.codigo_compra
	inner join produto prod on prod.codigo = com_prod.codigo_produto;
	


--4) Selecione o nome da pessoa, seu cpf, sua profissão, data das compras, valor_total das compras, os produtos comprados e as quantidades.
select pes.nome, pes.cpf, prof.nome, com.data, com.valor_total, prod.nome, com_prod.quantidade
from pessoa pes, profissao prof, compra com, produto prod, compra_produto com_prod
where prof.codigo = pes.codigo_profissao and
	pes.codigo = com.codigo_pessoa and
	prod.codigo = com_prod.codigo_produto and
	com.codigo = com_prod.codigo_compra;
	
	--INNER JOIN
select pes.nome, pes.cpf, prof.nome, com.data, com.valor_total, prod.nome, com_prod.quantidade
from profissao prof inner join pessoa pes on prof.codigo = pes.codigo_profissao
	inner join compra com on pes.codigo = com.codigo_pessoa
	inner join compra_produto com_prod on com.codigo = com_prod.codigo_compra
	inner join produto prod on prod.codigo = com_prod.codigo_produto;

	
--5) Selecione as pessoas com mais de 18 anos (considere a data de hoje a o calculo), suas profissões, valor total e data de suas compras. Selecione somente as
--compras com valor_total maior que o salário da pessoa

select pes.nome, prof.nome, com.data
from pessoa pes, profissao prof, compra com
where prof.codigo = pes.codigo_profissao and pes.data_nascimento < '13/11/2001'; --calculo da idade data de hoje subrai com 18 


--6) Selecione os dados dos professores que possuem salário entre R$ 1000,00 e R$ 2000,00
select pes.nome, pes.cpf, pes.salario, pes.salario, pes.data_nascimento, prof.nome
from pessoa pes, profissao prof
where prof.codigo = pes.codigo_profissao and (salario >= 1000 and salario <= 2000);

	--INNER JOIN
select pes.nome, pes.cpf, pes.salario, pes.salario, pes.data_nascimento, prof.nome
from profissao prof inner join pessoa pes on prof.codigo = pes.codigo_profissao
where salario >= 1000 and salario <= 2000;



















































