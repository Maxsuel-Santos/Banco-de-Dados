/*drop schema if exists BrumaLanches;

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

INSERT INTO Funcionarios
values ('Maxsuel', 'Santos', 'Max', '09122714502', '12345678900', '9876543210');
*/

# QUESTÃO 1
DROP SCHEMA IF EXISTS BrumadoPallace;
CREATE SCHEMA BrumadoPallace;
USE BrumadoPallace;

CREATE TABLE Cliente (
	idCliente 			INT 		 NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome 				VARCHAR(30)  NOT NULL,
    sobrenome 			VARCHAR(30)  NOT NULL,
    cpf 				VARCHAR(11)  NOT NULL,
    rg 					VARCHAR(11)  NULL,
    data_nascimento		DATE		 NOT NULL,
    email_principal 	VARCHAR(100) NOT NULL,
    email_secundario	VARCHAR(100) NULL,
    telefone_principal 	VARCHAR(11)  NOT NULL,
    telefone_secundario	VARCHAR(11)  NOT NULL,
    pronomes			VARCHAR(10)  NULL
);

CREATE TABLE Quarto (
	idQuarto			INT 		NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero				TINYINT		NOT NULL,
    andar				VARCHAR(3)  NOT NULL,
    tipo				VARCHAR(30) NOT NULL,
    descricao			TINYTEXT	NULL,
    preco_padrao		FLOAT		NOT NULL
);

CREATE TABLE Servico (
	idServico			INT 		NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome				VARCHAR(30) NOT NULL,
    codigo				VARCHAR(15) NOT NULL,
    descricao			TINYTEXT	NOT NULL,
    preco_padrao		FLOAT		NOT NULL
);

CREATE TABLE Marca (
	idMarca				INT 		NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_fantasia		VARCHAR(20) NOT NULL,
	razao_social		VARCHAR(20) NOT NULL,
    cnpj				VARCHAR(14) NOT NULL
);

CREATE TABLE Produto (
	idProduto			INT 		NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome				VARCHAR(30) NOT NULL,
    codigo				VARCHAR(15) NOT NULL,
    descricao			TINYTEXT	NOT NULL,
    preco_padrao		FLOAT		NOT NULL,
    Marca_idMarca		INT			NOT NULL,
    FOREIGN KEY (Marca_idMarca) REFERENCES Marca(idMarca)
);

CREATE TABLE Reserva (
	idReserva			INT 		NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Cliente_idCliente	INT			NOT NULL,
    Quarto_idQuarto		INT			NOT NULL,
    codigo				VARCHAR(10) NOT NULL,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Quarto_idQuarto)   REFERENCES Quarto(idQuarto)
);

CREATE TABLE Produtos_Consumidos(
	Produto_idProduto	INT			NOT NULL,
    Reserva_idReserva	INT			NOT NULL,
    data_consumo		DATE		NOT NULL,
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Reserva_idReserva) REFERENCES Reserva(idReserva)
);

CREATE TABLE Servicos_Consumidos(
	Servico_idServico	INT			NOT NULL,
    Reserva_idReserva	INT			NOT NULL,
    data_solicitacao	DATE		NOT NULL,
    data_consumo		DATE		NOT NULL, 
    comentarios			TINYTEXT	NULL,
    FOREIGN KEY (Servico_idServico) REFERENCES Servico(idServico),
    FOREIGN KEY (Reserva_idReserva) REFERENCES Reserva(idReserva)
);

# QUESTÃO 2

-- Tabela Cliente
# by José Pedro Bibiano
INSERT INTO Cliente (idCliente, nome, sobrenome, cpf, rg, data_nascimento, email_principal, email_secundario, telefone_principal, telefone_secundario, pronomes)
VALUES (1000, 'José', 'Sousa', '12345678910', '2030050060', '2004-08-20', 'josepedro@gmail.com', 'josepedro@hotmail.com', '77912345678', '77987654321', 'ele/dele');
# by Victor Kayk 
INSERT INTO Cliente ( sobrenome, cpf, data_nascimento, email_principal, telefone_principal, telefone_secundario)
VALUE( 'Gentil', '11111111111', '2004-02-02', 'thiagothiago@gmail.com', '98181818181', '98181818562');

-- Tabela Quarto
# by José Pedro Bibiano
INSERT INTO Quarto (idQuarto, numero, andar, tipo, descricao, preco_padrao)
VALUES (2000, 10, '2', 'Deluxe', 'Um belo quarto com vista para o mar!', 120.00);
# by Victor Kayk
INSERT INTO Quarto (numero, andar, tipo, descricao, preco_padrao)
VALUE(66, '12°', 'aquele lá', 'quarto legal', 999.99);
# by Clara Guedes - adaptado
#INSERT INTO Quarto (numero, andar, tipo, descricao, preco_padrao)
# VALUES (160, "5", "suite", "xxxx", "280");

-- Tabela Servico
# by José Pedro Bibiano    
INSERT INTO Servico (idServico, nome, codigo, descricao, preco_padrao)
VALUES (3000, 'Hidromassagem', '2000H', 'Desfrute da hidromassagem do seu quarto sem preocupação!', 80.00);
# by Victor Kayk
INSERT INTO Servico (nome, codigo, descricao, preco_padrao)
VALUE('Servico legal', '19995678912312', 'Descrição legal serviço', 2000);
# by Deborah Danielly - adaptado
INSERT INTO Servico 
VALUES(default, "Massagem", "123456", "feito por fulo", 15.60);

-- Tabela Marca
# by José Pedro Bibiano       
INSERT INTO Marca (idMarca, nome_fantasia, razao_social, cnpj)
VALUES (4000, 'Coca-Cola', 'Ariana Grande', '10203040506070');
# by Victor Kayk
INSERT INTO Marca (nome_fantasia, razao_social, cnpj)
VALUE('Marca', 'Legal', '00000000000000');
# by Deborah Danielly
INSERT INTO Marca (nome_fantasia, razao_social, cnpj) 
VALUES("Santa Lolla", "sei la", 12345678912);

-- Tabela Produto
# by José Pedro Bibiano   
INSERT INTO Produto (idProduto, Marca_idMarca, nome, codigo, descricao, preco_padrao)
VALUES (5000, 4000, 'Coca-Cola 350mL', '50001', 'Coquinha geladinha', 2.50);
# by Victor Kayk
INSERT INTO Produto (nome, codigo, descricao, preco_padrao, Marca_idMarca)
VALUE('Produto legal', '12345678912312', 'Descrição legal produto', 99.99, 4000);
# by Deborah Danielly
INSERT INTO Produto(nome, codigo, descricao, preco_padrao, Marca_idMarca) 
VALUES("Bolsa", '124456', "bolsa basica preta", 150.45, 4001);
# by Diogo Henrique - adaptado
INSERT INTO Produto (idProduto, nome, codigo, descricao, preco_padrao, Marca_idMarca)
VALUES (default, 'Geladeira', '123456789', 'grande', 2200.00, 4001);

-- Tabela Reserva
# by José Pedro Bibiano       
INSERT INTO Reserva(idReserva, Cliente_idCliente, Quarto_idQuarto, codigo)
VALUES (6000, 1000, 2000, '60001');
# by Victor Kayk
INSERT INTO Reserva (Cliente_idCliente, Quarto_idQuarto, codigo) 
VALUE (1001, 2001, '99999');

-- Tabela Servicos_Consumidos
# by José Pedro Bibiano       
INSERT INTO Servicos_Consumidos(Servico_idServico, Reserva_idReserva, data_solicitacao, data_consumo, comentarios)
VALUES (3000, 6000, '2022-07-26', '2022-07-27', 'odiei');
# by Victor Kayk
INSERT INTO Servicos_Consumidos (Servico_idServico, Reserva_idReserva, data_solicitacao, data_consumo, comentarios)
VALUE (3001, 6001, '2022-12-20', '2022-12-22', 'Sem comentarios');

-- Tabela Produtos_Consumidos
# by José Pedro Bibiano   
INSERT INTO Produtos_Consumidos(Produto_idProduto, Reserva_idReserva, data_consumo)
VALUES (5000, 6000, '2022-01-08');
# by Victor Kayk
INSERT INTO Produtos_Consumidos (Produto_idProduto, Reserva_idReserva, data_consumo)
VALUE (5001, 6001, '2022-12-20');

# José Vitor e Maxsuel

# Selects

# Select 1
SELECT
	m.nome_fantasia AS 'Marca',
    p.nome AS 'Produto'
FROM Marca m
INNER JOIN Produto p
ON m.idMarca = p.Marca_idMarca
ORDER BY p.nome;

# Select 2
SELECT
	p.nome AS 'Produto',
    pc.data_consumo 'Data de Consumo',
    r.codigo AS 'Código'
FROM Produto p
INNER JOIN Produtos_Consumidos pc
ON p.idProduto = pc.Produto_idProduto
INNER JOIN Reserva r
ON r.idReserva = pc.Reserva_idReserva
ORDER BY pc.data_consumo;

# Select 3
SELECT
	c.nome, c.sobrenome,
    q.numero AS 'Número do Quarto'
FROM Cliente c
INNER JOIN Reserva r
ON c.idCliente  = r.Cliente_idCliente 
INNER JOIN Quarto q
ON q.idQuarto = r.Quarto_idQuarto
ORDER BY c.nome;

# Select 4
SELECT
    s.nome AS 'Serviço Consumido',
    sc.data_consumo AS 'Data de Consumo'
FROM Servico s
INNER JOIN Servicos_Consumidos sc
ON s.idServico = sc.Servico_idServico
ORDER BY s.nome;

# Select 5
SELECT
	Produto.codigo,
    Produto.nome,
    Produto.preco_padrao,
    Reserva.codigo,
    Cliente.nome,
    Cliente.sobrenome,
	Cliente.cpf,
    Quarto.numero,
    Quarto.andar,
    Quarto.tipo,
    Quarto.descricao,
    Quarto.preco_padrao
FROM Produto
INNER JOIN Produtos_Consumidos
ON Produto.idProduto = Produtos_Consumidos.Produto_idProduto
INNER JOIN Reserva
ON Reserva.idReserva = Produtos_Consumidos.Reserva_idReserva
INNER JOIN Cliente
ON Cliente.idCliente = Reserva.Cliente_idCliente
INNER JOIN Quarto
ON Quarto.idQuarto = Reserva.Quarto_idQuarto;




