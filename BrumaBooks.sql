drop schema if exists BrumaBooks;

create schema if not exists BrumaBooks;
use BrumaBooks;

-- Tabelas

CREATE TABLE Autor(
	idAutor int not null primary key auto_increment,
    nome varchar(45) not null
);

CREATE TABLE Genero(
	idGenero int not null primary key auto_increment,
    nome varchar(45) not null
);

CREATE TABLE Pais(
	idPais int not null primary key auto_increment,
    nome varchar(30) not null
);

CREATE TABLE Editora(
	idEditora int not null primary key auto_increment,
    nomeFantasia varchar(45) not null
);

CREATE TABLE Livro(
	idLivro int not null primary key auto_increment,
    tituloOriginal varchar(45) null,
    tituloPrincipal varchar(45) not null,
    Genero_idGenero int not null,
    Pais_idPais int not null,
    FOREIGN KEY (Genero_idGenero) REFERENCES Genero(idGenero),
    FOREIGN KEY (Pais_idPais) REFERENCES Pais(idPais)
);

CREATE TABLE Endereco(
	idEndereco int not null primary key auto_increment,
    logradouro varchar(45) not null,
    numero varchar(5) not null,
    bairro varchar(45) not null,
    complemento varchar(45) null,
    cidade varchar(45) not null, 
    estado varchar(45) not null,
    Editora_idEditora int not null,
    FOREIGN KEY (Editora_idEditora) REFERENCES Editora(idEditora)
);

-- Relacionamentos

CREATE TABLE Edicao(
	Livro_idLivro int not null,
    Editora_idEditora int not null,
    numero tinyint not null,
    anoLancamento year not null,
    isbn varchar(13) not null,
    preco float not null,
    FOREIGN KEY (Livro_idLivro) REFERENCES Livro(idLivro),
    FOREIGN KEY (Editora_idEditora) REFERENCES Editora(idEditora)
);

CREATE TABLE Autoria(
    Autor_idAutor int not null,
	Livro_idLivro int not null,
    FOREIGN KEY (Autor_idAutor) REFERENCES Autor(idAutor),
    FOREIGN KEY (Livro_idLivro) REFERENCES Livro(idLivro)
);

-- Inserts

insert into Genero values 
(default, 'Desenvolvimento pessoal'), -- 1
(default, 'Ficção Científica'), -- 2
(default, 'História'), -- 3
(default, 'Ciência'), -- 4
(default, 'Romance'); -- 5

insert into Pais values 
(default, 'EUA'), -- 1
(default, 'Brasil'), -- 2
(default, 'China'), -- 3
(default, 'Inglaterra'), -- 4
(default, 'Israel'); -- 5

insert into Livro values 
(default, 'Mais esperto que o diabo', null, 1, 1),
(default, 'A marca de uma lágrima', null, 5, 2),
(default, 'Sapiens', null, 3, 5),
(default, 'Uma breve história do tempo', null, 4, 4),
(default, 'A arte da guerra', null, 1, 3);

select * from Livro;

insert into Editora values
(default, 'Intrínseca'); -- 1

insert into Editora Values
(default, 'Companhia das Letras'); -- 2

insert into Endereco values
(default, 'Av. 7 de Abril', '317', 'Centro', 'Casa', 'Brumado', 'Bahia', 1); -- 1

insert into Endereco values
(default, 'Rua Maestro João Batista de Queiroz', '135', 'Centro', 'Casa', 'Dom Basílio', 'Bahia', 2); -- 2

-- truncate Editora;
-- truncate Endereco;

select * from Editora;
select * from Endereco;

insert into Edicao values
(1, 1, 123, 2004-10-04, '123456789', 36.90);

select * from Edicao;

-- Inner Join

select 
	l.tituloPrincipal, l.tituloOriginal,
    p.nome as 'Pais', g.nome as 'Genero_Literario'
from Livro l
inner join Pais p
on l.Pais_idPais = p.idPais
inner join Genero g
on l.Genero_idGenero = g.idGenero
order by l.tituloOriginal; -- Ordem do Título Original da tabela Livros

select 
	l.tituloPrincipal as 'LivroTitulo', 
    a.nome as 'AutorNome'
from Livro l
inner join Autoria au 
on l.idLivro = au.Livro_idLivro
inner join Autor a
on a.idAutor = au.Autor_idAutor;

select 
	ed.nomeFantasia as "Nome",
    en.cidade, en.estado, en.logradouro, en.numero
from Editora ed
inner join Endereco en
on ed.idEditora = en.Editora_idEditora
order by ed.nomeFantasia;