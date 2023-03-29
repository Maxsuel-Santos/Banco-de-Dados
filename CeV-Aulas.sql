-- AULA 3



-- drop schema Cadastro;

create schema Cadastro
default character set utf8
default collate utf8_general_ci; 					-- UTF-8

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

CREATE TABLE Pessoa(
	idPessoas INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE
) DEFAULT CHARSET = utf8;

-- AULA 4



insert into Pessoas values
(1, 'Maxsuel', '2004-10-26', 'M', '49.6', '1.66', 'Brasil'), -- o valor do id é opcional caso não seja not null
(2, 'Andreza', '2000-09-14', 'F', '54.2', '1.60', 'Brasil'), -- o valor da nacionalidade tem um valor padrão caso não preenchido caso não for not null
(3, 'Marivaldo', '1968-01-31', 'M', '53.32', '1.7', 'Brasil'),
(4, 'Elenice', '1982-01-08', 'F', '65.7', '1.58', 'Brasil');

select * from Pessoas; 



-- AULA 5



#describe Pessoas; -- Descreve a tabela pessoas / describe/desc

ALTER TABLE Pessoas 
ADD COLUMN profissao varchar(10);                                                          -- alter table 'nomedatabela' add column 'nome da/do coluna/atributo' 'tipo primitivo' -> Adiciona um atributo a uma tabela já criada, porém esse atributo será o último na ordem

#select * from Pessoas;

ALTER TABLE Pessoas 
DROP COLUMN profissao;                                                                                                                     -- Apaga/Elimina um(a) coluna/atributo de uma tabela

ALTER TABLE Pessoas 
ADD COLUMN profissao VARCHAR(10) 
AFTER nome;                                                                                                                     -- Adiciona uma coluna depois de uma colunaespecífica, usadno o after 'nome da coluna'

ALTER TABLE Pessoas 
ADD COLUMN codigo INT FIRST;                                                                                                                     -- Adiciona a coluna como primeira de todas as colunas, usando o first

ALTER TABLE Pessoas 
MODIFY COLUMN profissao VARCHAR(20);                                                           -- Modificou o tamanho do varchar da coluna, usando o modify que modifica o tipo primitivo e as constrantes (not null, primary key e etc)

ALTER TABLE Pessoas 
MODIFY COLUMN profissao VARCHAR(20) NOT NULL DEFAULT '';                                                           -- Modificou o tamanho do varchar da coluna, usando o modify. Só que ela não pode ser nula e dá erro se colocar sem os dados, por isso colocou-se o default vazio como valor padrão

ALTER TABLE Pessoas 
CHANGE COLUMN profissao prof VARCHAR(20) NOT NULL;                                                           -- Renomeou a coluna, usando o change + 'nome da coluna' + 'novo nome da coluna' + 'tipo primitivo' + o resto que se não colocado, será perdido, não será herdado

ALTER TABLE Pessoas 
RENAME TO Gafanhotos;                                                                                                                     -- Renomeia uma tabela, usando o rename to



-- EX AULA 5



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



-- AULA 7



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

TRUNCATE TABLE Curso; 				-- apaga todos os dados da tabela.

TRUNCATE Curso;



-- AULA 8

/* Backup da base de dados

Cópias de Segurança no WorkBench (Backup):

Passo a Passo:
Server > Data Export > “Marque o(s) banco(s) de dado(s) e as tabelas que você quer fazer o backup” > “Você pode escolher se você quer os dados exportados e valores ou só a estrutura sem os dados nas opções que aparecem ‘dump’” > Export to Self-Contained File > Include Create Schema > Start Export.

*/

-- show tables; -- Mostra as tabelas existentes
-- show table status; -- Mostra o status das tabelas, como os dados preenchidos, armazenamento gasto, língua e etc

-- drop schema if exists sys; -- Apagando uma base de dados se ela existe.


SHOW TABLES;


SHOW TABLE STATUS;


-- AULA 11

DROP DATABASE IF EXISTS Cadastro;

CREATE DATABASE IF NOT EXISTS Cadastro;
USE Cadastro;

DROP TABLE IF EXISTS Cursos;

CREATE TABLE Cursos (
  idCurso INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome varchar(30) NOT NULL UNIQUE KEY,
  descricao text,
  carga int(10) unsigned DEFAULT NULL,
  totaulas int(10) unsigned DEFAULT NULL,
  ano year(4) DEFAULT '2016'
) DEFAULT CHARSET = utf8;

LOCK TABLES Cursos WRITE;

INSERT INTO Cursos VALUES 
(1,'HTML5','Curso de HTML5',40,37,2014),
(2,'Algoritmos','Lógica de Programação',20,15,2014),
(3,'Photoshop5','Dicas de Photoshop CC',10,8,2014),
(4,'PHP','Curso de PHP para iniciantes',40,20,2015),
(5,'Java','Introdução à Linguagem Java',40,29,2015),
(6,'MySQL','Bancos de Dados MySQL',30,15,2016),
(7,'Word','Curso completo de Word',40,30,2016),
(8,'Python','Curso de Python',40,18,2017),
(9,'POO','Curso de Programação Orientada a Objetos',60,35,2016),
(10,'Excel','Curso completo de Excel',40,30,2017),
(11,'Responsividade','Curso de Responsividade',30,15,2018),
(12,'C++','Curso de C++ com Orientação a Objetos',40,25,2017),
(13,'C#','Curso de C#',30,12,2017),
(14,'Android','Curso de Desenvolvimento de Aplicativos para Android',60,30,2018),
(15,'JavaScript','Curso de JavaScript',35,18,2017),
(16,'PowerPoint','Curso completo de PowerPoint',30,12,2018),
(17,'Swift','Curso de Desenvolvimento de Aplicativos para iOS',60,30,2019),
(18,'Hardware','Curso de Montagem e Manutenção de PCs',30,12,2017),
(19,'Redes','Curso de Redes para Iniciantes',40,15,2016),
(20,'Segurança','Curso de Segurança',15,8,2018),
(21,'SEO','Curso de Otimização de Sites',30,12,2017),
(22,'Premiere','Curso de Edição de Vídeos com Premiere',20,10,2017),
(23,'After Effects','Curso de Efeitos em Vídeos com After Effects',20,10,2018),
(24,'WordPress','Curso de Criação de Sites com WordPress',60,30,2019),
(25,'Joomla','Curso de Criação de Sites com Joomla',60,30,2019),
(26,'Magento','Curso de Criação de Lojas Virtuais com Magento',50,25,2019),
(27,'Modelagem de Dados','Curso de Modelagem de Dados',30,12,2020),
(28,'HTML4','Curso Básico de HTML, versão 4.0',20,9,2010),
(29,'PHP7','Curso de PHP, versão 7.0',40,20,2020),
(30,'PHP4','Curso de PHP, versão 4.0',30,11,2010);

UNLOCK TABLES;

DROP TABLE IF EXISTS Gafanhotos;

CREATE TABLE Gafanhotos (
  idGafanhotos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome varchar(30) NOT NULL,
  profissao varchar(20) DEFAULT NULL,
  nascimento date DEFAULT NULL,
  sexo enum('M','F') DEFAULT NULL,
  peso decimal(5,2) DEFAULT NULL,
  altura decimal(3,2) DEFAULT NULL,
  nacionalidade varchar(20) DEFAULT 'Brasil'
) DEFAULT CHARSET = utf8;

LOCK TABLES Gafanhotos WRITE; --  Comando LOCK TABLE é utilizado para bloquear uma ou mais tabelas, partições de tabela, ou subpartições de tabela no modo especificado. O bloqueio manual substitui o bloqueio automático e permite ou nega acesso à tabela ou visão pelos outros usuários pela duração de sua operação.

INSERT INTO Gafanhotos VALUES 
(1,'    Daniel Morais      ','Auxiliar Administrat','1984-01-02','M',78.50,1.83,'Brasil'),
(2,'Talita Nascimento','Farmacêutico','1999-12-30','F',55.20,1.65,'Portugal'),
(3,'Emerson Gabriel','Programador','1920-12-30','M',50.20,1.65,'Moçambique'),
(4,'Lucas Damasceno','Auxiliar Administrat','1930-11-02','M',63.20,1.75,'Irlanda'),
(5,'Leila Martins','Farmacêutico','1975-04-22','F',99.00,2.15,'Brasil'),
(6,'Letícia Neves','Programador','1999-12-03','F',87.00,2.00,'Brasil'),
(7,'Janaína Couto','Auxiliar Administrat','1987-11-12','F',75.40,1.66,'EUA'),
(8,'Carlisson Rosa','Professor','2010-08-01','M',78.22,1.98,'Brasil'),
(9,'Jackson Telles','Programador','1999-01-23','M',55.75,1.33,'Portugal'),
(10,'Danilo Araujo','Dentista','1975-12-10','M',99.21,1.87,'EUA'),
(11,'Andreia Delfino','Auxiliar Administrat','1975-07-01','F',48.64,1.54,'Irlanda'),
(12,'Valter Vilmerson','Ator','1985-10-12','M',88.55,2.03,'Brasil'),
(13,'Allan Silva','Programador','1993-11-11','M',76.99,1.55,'Brasil'),
(14,'Rosana Kunz','Professor','1935-01-16','F',55.24,1.87,'Brasil'),
(15,'Josiane Dutra','Empreendedor','1950-01-20','F',98.70,1.04,'Portugal'),
(16,'Elvis Schwarz','Dentista','2011-05-07','M',66.69,1.76,'EUA'),
(17,'Paulo Narley','Auxiliar Administrat','1997-03-17','M',120.10,2.22,'Brasil'),
(18,'Joade Assis','Médico','1930-12-01','M',65.88,1.78,'França'),
(19,'Nara Matos','Programador','1978-03-17','F',65.90,1.33,'Brasil'),
(20,'Marcos Dissotti','Empreendedor','2010-01-01','M',53.79,1.54,'Portugal'),
(21,'Ana Carolina Mendes','Ator','2000-12-15','F',88.30,1.54,'Brasil'),
(22,'Guilherme de Sousa','Dentista','2001-05-18','M',132.70,1.97,'Moçambique'),
(23,'Bruno Torres','Auxiliar Administrat','2000-01-30','M',44.65,1.65,'Brasil'),
(24,'Yuji Homa','Empreendedor','1996-12-25','M',33.90,1.22,'Japão'),
(25,'Raian Porto','Programador','1989-05-05','M',54.89,1.54,'Brasil'),
(26,'Paulo Batista','Ator','1999-03-15','M',110.12,1.87,'Portugal'),
(27,'Monique Precivalli','Auxiliar Administrat','2013-12-30','F',48.20,1.22,'Brasil'),
(28,'Herisson Silva','Auxiliar Administrat','1965-10-10','M',74.65,1.56,'EUA'),
(29,'Tiago Ulisses','Dentista','1993-04-22','M',150.30,2.35,'Brasil'),
(30,'Anderson Rafael','Programador','1989-12-01','M',64.22,1.44,'Irlanda'),
(31,'Karine Ribeiro','Empreendedor','1988-10-01','F',42.10,1.65,'Brasil'),
(32,'Roberto Luiz Debarba','Ator','2007-01-09','M',77.44,1.56,'Brasil'),
(33,'Jarismar Andrade','Dentista','2000-06-23','F',63.70,1.33,'Brasil'),
(34,'Janaina Oliveira','Professor','1955-03-12','F',52.90,1.76,'Canadá'),
(35,'Márcio Mello','Programador','2011-11-20','M',54.11,1.55,'EUA'),
(36,'Robson Rodolpho','Auxiliar Administrat','2000-08-08','M',110.10,1.76,'Brasil'),
(37,'Daniele Moledo','Empreendedor','2006-08-11','F',101.30,1.99,'Brasil'),
(38,'Neto Sophiate','Ator','1996-05-17','M',59.28,1.65,'Portugal'),
(39,'Neriton Dias','Auxiliar Administrat','2009-10-30','M',48.99,1.29,'Brasil'),
(40,'André Schmidt','Programador','1993-07-26','M',55.37,1.22,'Angola'),
(41,'Isaias Buscarino','Dentista','2001-01-07','M',99.90,1.55,'Moçambique'),
(42,'Rafael Guimma','Empreendedor','1968-04-11','M',88.88,1.54,'Brasil'),
(43,'Ana Carolina Hernandes','Ator','1970-10-11','F',65.40,2.08,'EUA'),
(44,'Luiz Paulo','Professor','1984-11-01','M',75.12,1.38,'Portugal'),
(45,'Bruna Teles','Programador','1980-11-07','F',55.10,1.86,'Brasil'),
(46,'Diogo Padilha','Auxiliar Administrat','2000-03-03','M',54.34,1.88,'Angola'),
(47,'Bruno Miltersteiner','Dentista','1986-02-19','M',77.45,1.65,'Alemanha'),
(48,'Elaine Nunes','Programador','1998-08-15','F',35.90,2.00,'Canadá'),
(49,'Silvio Ricardo','Programador','2012-03-12','M',65.99,1.23,'EUA'),
(50,'Denilson Barbosa da Silva','Empreendedor','2000-01-08','M',97.30,2.00,'Brasil'),
(51,'Jucinei Teixeira','Professor','1977-11-22','F',44.80,1.76,'Portugal'),
(52,'Bruna Santos','Auxiliar Administrat','1991-12-01','F',76.30,1.45,'Canadá'),
(53,'André Vitebo','Médico','1970-07-01','M',44.11,1.55,'Brasil'),
(54,'Andre Santini','Programador','1991-08-15','M',66.00,1.76,'Itália'),
(55,'Ruan Valente','Programador','1998-03-19','M',101.90,1.76,'Canadá'),
(56,'Nailton Mauricio','Médico','1992-04-25','M',86.01,1.43,'EUA'),
(57,'Rita Pontes','Professor','1999-09-02','F',54.10,1.35,'Angola'),
(58,'Carlos Camargo','Programador','2005-02-22','M',124.65,1.33,'Brasil'),
(59,'Philppe Oliveira','Auxiliar Administrat','2000-05-23','M',105.10,2.19,'Brasil'),
(60,'Dayana Dias','Professor','1993-05-30','F',88.30,1.66,'Angola'),
(61,'Silvana Albuquerque','Programador','1999-05-22','F',56.00,1.50,'Brasil');

UNLOCK TABLES;

select * from Cursos; -- Ordem de id

select * from Cursos
order by nome; -- Ordem de nome

select * from Cursos
order by nome desc; -- Ordem de nome Decrescente

select * from Cursos
order by nome asc; -- Ordem de nome Crescente

select ano, nome, carga 
from Cursos 
order by ano, nome asc;

select nome, carga, ano from cursos
where ano = 2017
order by nome;

select nome, carga, ano from cursos
where ano <= 2016
order by nome;

-- Operadores relacionais: <, <=, >, >=, = e != ou <> 

select ano, nome from cursos
where ano between 2014 and 2016 -- entre dois períodos
order by ano desc, nome asc;

select nome, descricao, ano from cursos
where ano in (2014, 2016, 2020) -- Apenas cursos de 2014 e 2016
order by ano;

select nome as 'Nome', carga as 'Carga', totaulas as 'Total de aulas' 
from cursos
where carga > 35 and totaulas <= 30; -- Carga maior do que 35 e total de aulas (totaulas) menor/igual que 30 (horas).

-- Operadores lógicos: and, or e not

-- Aula 12

select * from cursos
where nome like 'P%'; -- Selecionando os campos que tem a letra "P" no começo em nome (a % é obrigatório) 

-- Like = Parecido
-- % = Nenhum ou vários caracteres, troca o % por qualquer conjunto de caracteres, mesmo que seja só um caracter
-- (ACIMA) Tanto "p" minúsculo quanto "P" maiúsculo vão ser a mesma coisa, isso é função do like, ele é um operador (literal)

select * from cursos
where nome like '%A'; -- Selecionando os campos que tem a letra "A" NO FIM em nome (a % é obrigatório)

select * from cursos
where nome like 'A%'; -- Selecionando os campos que tem a letra "A" NO COMEÇO em nome (a % é obrigatório)

select * from cursos
where nome like '%A%'; -- Selecionando os campos que tem a letra "A" EM QUALQUEER LUGAR em nome (a % é obrigatório)

-- OBS: No MySQL, se estiver na configuração UTF-8, esse %A/A%/%A% vale para "á" e "Á" com acento agudo

select * from cursos
where nome not like '%A%'; -- Selecionando os campos que NÃO TEM a letra "A" em nome (a % é obrigatório)

update Cursos set nome = 'PáOO' where idCurso = 9; -- De "POO" para "PáOO"

select * from cursos
where nome like '%A%'; -- O "PáOO" será exibido, pois tem um á

update Cursos set nome = 'POO' where idCurso = 9; -- De "PáOO" para "POO"

update cursos set nome = 'Photoshop' where idCurso = 3; -- De "Photoshop5" para "Photoshop"

select * from cursos
where nome like 'ph%p'; -- Selecionando os campos que que começam com "ph" e terminam com "p" em nome 

select * from cursos
where nome like 'ph%p%'; -- Selecionando os campos que que começam com "ph", terminam com "p" e que podem ter algo ou não depois do "p" em nome 

select * from cursos
where nome like 'ph%p_'; -- Selecionando os campos que que começam com "ph", terminam com "p" e que tenham alguma coisa depois de "p" em nome 

select * from cursos
where nome like 'p_p%'; -- Selecionando os campos que que começam com "p", tem alguma coisa depois (1 caracter), e termina com "p" em nome 

select * from cursos
where nome like 'p__t%'; -- Selecionando os campos que que começam com "p", tem 2 coisas depois (2 letras) e terminam com "t" em nome 

select * from gafanhotos
where nome like '%_silva%'; -- Selecionando os campos que tem "silva" com um espaço antes (nomes separados, sobrenome) em nome da tabela gafanhotos 

select nacionalidade from gafanhotos; -- Será exibida todos os países que todas as pessoas naceram, tendo repetições de países

select distinct nacionalidade from gafanhotos order by nacionalidade asc; -- Será exibida todos os países presentes, ou seja, sem repetições, apenas quais países existem no banco, sem repetí-los várias vezes

select carga from cursos order by carga;

select distinct carga from cursos order by carga;

select count(*) from cursos; -- Conta quantas ocorrências tem em cursos, ou seja, a quantidade de cursos (idCurso), que são 30 nesse caso
select count(idCurso) from cursos; -- Conta quantas ocorrências tem em cursos, ou seja, a quantidade de cursos (idCurso), que são 30 nesse caso

select count(*) from cursos where carga > 40; -- Conta quantos cursos tem com mais de 40 horas. Nesse caso são 6 cursos com mais de 40 horas de carga

select max(carga) from cursos; -- Mostra a carga máxima em cursos. Ou seja, o valor maior/máximo de horas em cursos

select max(totaulas) from cursos where ano = 2017; -- Selecionou de todos os cursos de 2017 o de maior quantidade de aulas, ou seja, o curso com maior quantidade de aulas
select nome, max(totaulas) from cursos where ano = 2017; -- Exibe o nome do curso com maior quantidade de aulas

select min(totaulas) from Cursos; --  min() é oposto ao max(). Mostra o valor menor/mínimo. Nesse caso, mostrou a menor quantidade de aulas que um curso tem
select nome, min(totaulas) from Cursos; -- Exibe o nome do curso com menor quantidade de aulas

select sum(totaulas) from cursos; -- Soma a quantidade de aulas de todos os cursos. Soma todas as aulas e retorna uma soma
select sum(totaulas) from cursos where ano = 2010; 
select sum(totaulas) from cursos where ano = 2014; 
select sum(totaulas) from cursos where ano = 2015; 
select sum(totaulas) from cursos where ano = 2016; 
select sum(totaulas) from cursos where ano = 2017; 
select sum(totaulas) from cursos where ano = 2018; 
select sum(totaulas) from cursos where ano = 2019; 
select sum(totaulas) from cursos where ano = 2020; 

select avg(totaulas) from cursos; -- Tira a média do total de aulas. Soma tudo e divide pela quantidade de cursos

-- Exercícios AULA 12

-- 1
select nome from gafanhotos 
where sexo = 'F';

-- 2
select nascimento, nome from gafanhotos 
where nascimento between '2000-01-01' and  '2015-12-31' -- Ano-Mês-Dia
order by nascimento, nome asc;

-- 3
select nome, profissao from gafanhotos
where sexo = 'M' and profissao = 'Programador';

-- 4
select nome from gafanhotos
where sexo = 'F' and nacionalidade = 'Brasil' and nome like 'J%';

-- 5
select nome, nacionalidade from gafanhotos
where nome like '%_silva%' and nacionalidade != 'Brasil' and peso < 100;

-- 6
select max(altura), nome from gafanhotos
where sexo = 'M' and nacionalidade = 'Brasil';      
      
-- 7
select avg(peso) from gafanhotos;

-- 8
select min(peso), nome from gafanhotos
where sexo = 'F' and nacionalidade != 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

-- 9
select count(altura) from gafanhotos
where sexo = 'F' and altura > '1.90'; 

select lower(nome) from gafanhotos;
select upper(nome) from gafanhotos;
select nome from gafanhotos;
select ltrim(nome) from gafanhotos;
select rtrim(nome) from gafanhotos;
select length(nome) from gafanhotos;

-- AULA 13

SELECT Carga FROM Cursos
GROUP BY Carga; -- Ao invés de distinguir - DISTINCT - foi agrupado, tendo o mesmo resultado visual, porém junta todos de mesmo valor

SELECT Carga, COUNT(Nome) AS 'Ocorrências' FROM Cursos
GROUP BY Carga; -- Agrupou e contou quantos registros tem do mesmo valor por grupo, Só dá pra fazer isso com o GRUP BY

SELECT DISTINCT Carga FROM Cursos; 

SELECT carga AS 'Carga Horária', COUNT(*) AS 'Ocorrências de Cursos' 
FROM Cursos 
WHERE totaulas = 30 
GROUP BY carga;

SELECT ano AS 'Ano', COUNT(*) FROM Cursos
GROUP BY ano
HAVING COUNT(ano) >= 5
ORDER BY ano; -- Agrupou e mostrou apenas quem tem uma quantidade de ocorrências de Cursos >= a 5 (HAVING). No HAVING, você só pode trabalhar com o campo que você agrupou

SELECT ano AS 'Ano', COUNT(*) FROM Cursos
GROUP BY ano
HAVING ano > 2013
ORDER BY ano;

SELECT ano AS 'Ano', COUNT(*) AS 'Ocorrências' 
FROM Cursos
WHERE totaulas > 25
GROUP BY ano
HAVING ano > 2013
ORDER BY ano;

SELECT AVG(carga) FROM Cursos; 

# (ABAIXO) Selecionou (SELECT); Filtrou (WHERE); Agrupou (GROUP BY) e Impôs uma condição de exibição proveniente do agrupamento (HAVING)
SELECT 
    carga AS 'Carga Horária', COUNT(*) AS 'Ocorrências'
FROM
    Cursos
WHERE
    ano > 2015
GROUP BY carga
HAVING carga > (SELECT AVG(carga) FROM Cursos); -- Seleciona carga de Cursos onde o ano é maior de 2015 (2016 acima), agrupa por carga e mostra todos os cursos que tem a carga maior do que a média total. Nesse caso a média é 36.33..., então os crusos maiores do que esse valor serão mostrados. Select dentro de outro Select ;-;

-- Exercícios AULA 13

-- 1
SELECT profissao AS 'Profissão', COUNT(*) AS 'Ocorrências' FROM Gafanhotos
GROUP BY profissao
ORDER BY COUNT(*) DESC;

-- 2
SELECT sexo AS 'Sexo', COUNT(*) AS 'Ocorrências' FROM Gafanhotos
WHERE nascimento > '2004-12-31'
GROUP BY sexo;

-- 3
SELECT nacionalidade AS 'Nacionalidade', COUNT(*) AS 'Ocorrências' FROM Gafanhotos
WHERE nacionalidade != 'Brasil'
GROUP BY nacionalidade
HAVING COUNT(nacionalidade) > 3
ORDER BY nacionalidade ASC;

-- 4
SELECT AVG(altura) FROM Gafanhotos; -- AVG = 1.66

SELECT altura AS 'Altura', COUNT(*) AS 'Ocorrências' FROM Gafanhotos
WHERE peso > 100
GROUP BY altura
HAVING altura > (SELECT AVG(altura) FROM Gafanhotos)
ORDER BY altura DESC;

-- AULA 14




















