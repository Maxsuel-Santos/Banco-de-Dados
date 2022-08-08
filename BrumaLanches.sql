drop schema if exists BrumaLanches;

create schema if not exists BrumaLanches 
default character set utf8
default collate utf8_general_ci;

use BrumaLanches;

-- TABLES

create table ItemDeCardapio(
	idCardapio int not null primary key auto_increment,
    nome varchar(45) not null unique,
    porcao varchar(45) not null,
    precoUnitario float not null
);

create table Ingrediente(
	idIngrediente int not null primary key auto_increment,
    nome varchar(45)
);

create table Funcionarios(
	idFuncionarios int not null primary key auto_increment,
    nome varchar(30) not null unique,
    sobrenome varchar(30) not null,
    apelido varchar(20) not null,
    matricula varchar(11) not null,
    cpf varchar(11) not null,
    rg varchar(11) not null
);

create table Cliente(
	idClientes int not null primary key auto_increment,
    nome varchar(30) not null unique,
    sobrenome varchar(30) not null,
    email varchar(45) not null,
    conta boolean not null,
    cpf varchar(11) not null
);

create table Endereco(
	idEndereco int not null primary key auto_increment,
    logradouro varchar(45) not null,
    numero varchar(6) not null,
    complemento varchar(15) not null default false,
    bairro varchar(45) not null,
    cidade varchar(45) not null,
    cep varchar(15) not null
);

create table Telefone(
    idTelefone int not null primary key auto_increment,
    telefone varchar(15) not null,
    ddd varchar(2) not null
);

-- RELATIONSHIPS

create table Cardapio_has_Funcionarios(
	Cardapio_idCardapio int not null,
	Funcionarios_idFuncionarios int not null,
	foreign key (Cardapio_idCardapio) references Cardapio(idCardapio),
    foreign key (Funcionarios_idFuncionarios) references Funcionarios(idFuncionarios)
);

create table itemdecardapio_has_ingrediente(
	ItemDeCardapio_idItemdecardapio int not null,
	Ingrediente_idIngrediente int not null,
	foreign key (ItemDeCardapio_idItemDeCardapio) references ItemDeCardapio(idItemDeCardapio),
    foreign key (Ingrediente_idIngrediente) references Ingrediente(idIngrediente)
);

/**/

INSERT INTO Funcionarios
values ('Maxsuel', 'Santos', 'Max', '09122714502', '12345678900', '9876543210');
