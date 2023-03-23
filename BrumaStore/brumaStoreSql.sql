-- create schema brumaStore;
-- use brumaStore;

-- Table

create table Vendedores(
	idVendedores int not null primary key auto_increment,
    salario float not null,
    comissao float not null,
    matricula int not null,
    nome varchar(45) not null,
    cpf varchar(11) not null
);

-- Table

create table Endereco(
	idEndereco int not null primary key auto_increment,
    logradouro varchar(45) not null,
    numero int not null,
    bairro varchar(45) not null,
    cidade varchar(45) not null,
    cep varchar(15) not null
);

-- Table

create table Telefone(
	idTelefone int not null primary key auto_increment,
    telefone varchar(15) not null,
    ddd varchar(2) not null
);

-- Table

create table Venda(
	idVenda int not null primary key auto_increment,
    aPrazo bool not null default false,
    notaFiscal varchar(45) not null,
    quantVendida int not null,
    dataHora datetime not null
);

create table Parcelas(
	idParcelas int not null primary key auto_increment,
    parcelas tinyint unsigned not null, -- 0 a 255
    valor float not null,
    dataVencimento date not null
);

-- Table

create table Produto(
	idProduto int not null primary key auto_increment,
    codigo int not null,
    descricao text not null,
    preco float not null,
    quantEstoque int not null
);

-- Table

create table Cliente(
	idCliente int not null primary key auto_increment,
    nome varchar(45) not null,
    cpf varchar(11) not null,
    rg varchar(12) not null    
);

-- Vendedores <relacionamento> Endereco

create table Vendedores_has_Endereco(
	Vendedores_idVendedores int not null,
	Endereco_idEndereco int not null,
    foreign key (Vendedores_idVendedores) references Vendedores(idVendedores),
    foreign key (Endereco_idEndereco) references Endereco(idEndereco)
);

-- Vendedores <relacionamento> Telefone

create table Vendedores_has_Telefone(
	Vendedores_idVendedores int not null,
    Telefone_idTelefone int not null,
    foreign key (Vendedores_idVendedores) references Vendedores(idVendedores),
    foreign key (Telefone_idTelefone) references Telefone(idTelefone)
);

-- Vendedores <relacionamento> Venda

create table Vendedores_has_Venda(
	Vendedores_idVendedores int not null,
    Venda_idVenda int not null,
    foreign key (Vendedores_idVendedores) references Vendedores(idVendedores),
    foreign key (Venda_idVenda) references Venda(idVenda)
);

-- Venda <relacionamento> Parcela

create table Venda_has_Parcela(
	Venda_idVenda int not null,
    Parcela_idParcela int not null,
    foreign key (Venda_idVenda) references Venda(idVenda),
    foreign key (Parcela_idParcela) references Parcela(idParcela)
);

-- Venda <relacionamento> Produto

create table Venda_has_Produto(
	Venda_idVenda int not null,
    Produto_idProduto int not null,
    foreign key (Venda_idVenda) references Venda(idVenda),
    foreign key (Produto_idProduto) references Produto(idProduto)
);

-- Venda <relacionamento> Cliente

create table Venda_has_Cliente(
	Venda_idVenda int not null,
    Cliente_idCliente int not null,
    foreign key (Venda_idVenda) references Venda(idVenda),
    foreign key (Cliente_idCliente) references Cliente(idCliente)
);

-- Telefone <relacionamento> Cliente

create table Telefone_has_Cliente(
	Telefone_idTelefone int not null,
    Cliente_idCliente int not null,
    foreign key (Telefone_idTelefone) references Telefone(idTelefone),
    foreign key (Cliente_idCliente) references Cliente(idCliente)
);

-- Endereco <relacionamento> Cliente

create table Telefone_has_Cliente(
	Endereco_idEndereco int not null,
    Cliente_idCliente int not null,
    foreign key (Endereco_idEndereco) references Endereco(idEndereco),
    foreign key (Cliente_idCliente) references Cliente(idCliente)
);
