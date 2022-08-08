-- AULA 3

/*

-- drop schema Cadastro;

create schema Cadastro
default character set utf8
default collate utf8_general_ci; -- UTF-8

use Cadastro;

create table Pessoas(
	idPessoas int not null primary key auto_increment,
	nome varchar(30) not null,
    nascimento date not null,
    sexo enum('M', 'F') not null, -- Valores aceitos: M ou F
    peso decimal(5, 2) not null, -- 5 dígitos sendo 2 dígitos casas decimais e os 3 antes da vírgula
    altura decimal(3, 2) not null, -- 3 dígitos: 1 antes da vírgula e dois decimais
    nacionalidade varchar(30) default 'Brasil' -- Valor padrão 'Brasil'
) default charset = utf8;

*/

-- AULA 4

/*

insert into Pessoas values
(1, 'Maxsuel', '2004-10-26', 'M', '49.6', '1.66', 'Brasil'), -- o valor do id é opcional caso não seja not null
(2, 'Andreza', '2000-09-14', 'F', '54.2', '1.60', 'Brasil'), -- o valor da nacionalidade tem um valor padrão caso não preenchido caso não for not null
(3, 'Marivaldo', '1968-01-31', 'M', '53.32', '1.7', 'Brasil'),
(4, 'Elenice', '1982-01-08', 'F', '65.7', '1.58', 'Brasil');

select * from Pessoas; 

*/

-- AULA 5

/*

describe Pessoas; -- Descreve a tabela pessoas / describe/desc

alter table Pessoas add column profissao varchar(10); -- alter table 'nomedatabela' add column 'nome da/do coluna/atributo' 'tipo primitivo' -> Adiciona um atributo a uma tabela já criada, porém esse atributo será o último na ordem

select * from Pessoas;

alter table Pessoas drop column profissao; -- Apaga/Elimina um(a) coluna/atributo de uma tabela

alter table Pessoas add column profissao varchar(10) after nome; -- Adiciona uma coluna depois de uma colunaespecífica, usadno o after 'nome da coluna'

alter table Pessoas add column codigo int first; -- Adiciona a coluna como primeira de todas as colunas, usando o first

alter table Pessoas modify column profissao varchar(20); -- Modificou o tamanho do varchar da coluna, usando o modify que modifica o tipo primitivo e as constrantes (not null, primary key e etc)

alter table Pessoas modify column profissao varchar(20) not null default ''; -- Modificou o tamanho do varchar da coluna, usando o modify. Só que ela não pode ser nula e dá erro se colocar sem os dados, por isso colocou-se o default vazio como valor padrão

alter table Pessoas change column profissao prof varchar(20) not null; -- Renomeou a coluna, usando o change + 'nome da coluna' + 'novo nome da coluna' + 'tipo primitivo' + o resto que se não colocado, será perdido, não será herdado

alter table Pessoas rename to Gafanhotos; -- Renomeia uma tabela, usando o rename to

*/

-- EX AULA 5

/*

create table if not exists Cursos(  -- 'if not exists' -> só cria a tabela se ela não existir, assim não corre riscos de sobrescrever
	nome varchar(30) not null unique, -- unique é único, ou seja, o nome é único e não existem dois nomes iguais na tabela
    descricao text,
    carga int unsigned,
    totAulas int,
    ano year default '2022'
) default charset = utf8; 

alter table Cursos add column idCurso int first;

alter table Cursos add primary key (idCurso);

desc Cursos;

select * from Cursos;

-- drop table Cursos; -- Cuidado ao usar drop, pois se apagar já era, some tudo

*/

-- AULA 7

/*

use cadastro;

-- Linha(horizontal) => Registro/Tupla // Coluna(vertical) => Campo/Atributo
-- alter table => manipula coluna
-- update => manipula linha


insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2021'),
('2', 'Algoritmos', 'Lógica de programação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
('5', 'Jarva', 'Introdução à linguagem Java', '10', '29', '2000'),
('6', 'MySQL', 'Banco de dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de Word', '40', '30', '2016'),
('8', 'Sapateado', 'Danças Rítmicas', '40', '30', '2018'),
('9', 'Cozinha Árabe', 'Aprenda a fazer kibe', '40', '30', '2018'),
('10', 'YouTuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2018');

select * from cursos;

update cursos           -- atualize a tabela cursos 
set nome = 'HTML5' 		-- e configure o atributo nome para 'HTML5'
where idCurso = '1';	-- onde o idCurso é = a 1

-- (ACIMA) mudei um valor de um atributo. Foi preciso selecionar a tabela, o atributo e atribuir o valor e identificar a chave primária na linha

-- update = atualize / set = configure / where = onde

update cursos
set nome = 'PHP', ano = '2015' -- Aqui selecionei duas coisas para alterar, dois atriburos da mesma tabela, só usei uma vírgula para separá-las
where idCurso = '4';

update cursos
set nome = 'Java', ano = '2015', carga = '40'
where idCurso = '5'
limit 1; -- O limit serve para limitar a ação para afetar uma só linha, é bom usar isso caso vc erre o comando, só afeta uma linha

select * from cursos;

delete from cursos		-- Delete da tabela cursos
where idCurso = '8'; 	-- Onde o idCurso for = a 8

-- (ACIMA) Deletei da tabela cursos, a linha cujo id é 8, apaguei uma linha de dados de cursos.

delete from cursos where idCurso = '9';
delete from cursos where idCurso = '10';

select * from cursos;

truncate table cursos; -- apaga todos os dados da tabela.
-- truncate cursos;

*/

-- AULA 8

/* Backup da base de dados

Cópias de Segurança no WorkBench (Backup):

Passo a Passo:
Server > Data Export > “Marque o(s) banco(s) de dado(s) e as tabelas que você quer fazer o backup” > “Você pode escolher se você quer os dados exportados e valores ou só a estrutura sem os dados nas opções que aparecem ‘dump’” > Export to Self-Contained File > Include Create Schema > Start Export.

*/

show tables; -- Mostra as tabelas existentes
show table status; -- Mostra o status das tabelas, como os dados preenchidos, armazenamento gasto, língua e etc

drop schema if exists sys; -- Apagando uma base de dados se ela existe.

-- AULA 09














