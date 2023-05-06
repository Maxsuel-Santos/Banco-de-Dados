DROP SCHEMA IF EXISTS Brumateca;

CREATE SCHEMA Brumateca
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci; 

USE Brumateca;

# TABELAS, RELACIONAMENTO, INSERÇÃO DE DADOS E SELEÇÃO DE ATRIBBUTOS DE TABELAS

-- ---------------------------------
-- Brumateca.Endereco
-- ---------------------------------

DROP TABLE IF EXISTS Endereco;

CREATE TABLE Endereco (
    idEndereco	INT 			NOT NULL 	PRIMARY KEY 	AUTO_INCREMENT,
    cep 		VARCHAR(45) 	NOT NULL,
    cidade 		VARCHAR(45) 	NOT NULL,
    estado 		VARCHAR(45) 	NOT NULL,
    bairro 		VARCHAR(45) 	NOT NULL,
    logradouro 	VARCHAR(45) 	NOT NULL,
    numero 		VARCHAR(6) 		NOT NULL,
    complemento VARCHAR(45) 	NOT NULL
) DEFAULT CHARSET = utf8;

# DESCRIBE Endereco;

# TABELAS

-- ---------------------------------
-- Brumateca.Usuario
-- ---------------------------------

DROP TABLE IF EXISTS Usuario;

CREATE TABLE Usuario(
	idUsuario 			INT 			NOT NULL 	PRIMARY KEY 	AUTO_INCREMENT,
    nome 				VARCHAR(45) 	NOT NULL,
    cpf 				VARCHAR(11) 	NOT NULL 	UNIQUE,
    dataNascimento 		DATE 			NOT NULL,
    escolaridade 		VARCHAR(45) 	NOT NULL,
    numeroUsuario 		VARCHAR(45) 	NOT NULL,
    usuarioEspecial		TINYINT			NOT NULL,
    idEndereco INT 			NOT NULL,
    FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco)
) DEFAULT CHARSET = utf8;

# DESCRIBE Usuario;

-- ---------------------------------
-- Brumateca.Estudante
-- ---------------------------------

DROP TABLE IF EXISTS Estudante;

CREATE TABLE Estudante(
	idEstudante 		INT 		NOT NULL 	PRIMARY KEY 	AUTO_INCREMENT,
    numeroMatricula 	VARCHAR(15) NOT NULL 	UNIQUE,
    anoIngresso 		YEAR 		NOT NULL,
    maximoLivros		INT			NOT NULL,
    maximoDias			INT			NOT NULL,
    idUsuario 	INT 		NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
) DEFAULT CHARSET = utf8;

# DESCRIBE Estudante;

-- ---------------------------------
-- Brumateca.Curso
-- ---------------------------------

DROP TABLE IF EXISTS Curso;
CREATE TABLE Curso(
	idCurso 	INT 		NOT NULL 	PRIMARY KEY 	AUTO_INCREMENT,
    nome 		VARCHAR(45) NOT NULL 	UNIQUE
) DEFAULT CHARSET = utf8;

# DESCRIBE Curso;

-- ---------------------------------
-- Brumateca.Estuda
-- ---------------------------------

DROP TABLE IF EXISTS Estuda;

CREATE TABLE Estuda(
	idEstudante   INT NOT NULL,
    idCurso		  INT NOT NULL,
    FOREIGN KEY (idEstudante) REFERENCES Estudante(idEstudante),
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
) DEFAULT CHARSET = utf8;  

# DESCRIBE Estuda;

-- ---------------------------------
-- Brumateca.Departamento
-- ---------------------------------

DROP TABLE IF EXISTS Departamento;

CREATE TABLE Departamento(
	idDepartamento INT 			NOT NULL 	PRIMARY KEY 	AUTO_INCREMENT,
    nome 		   VARCHAR(45)	NOT NULL 	UNIQUE
) DEFAULT CHARSET = utf8;

# DESCRIBE Departamento;

-- ---------------------------------
-- Brumateca.Professor
-- ---------------------------------

DROP TABLE IF EXISTS Professor;

CREATE TABLE Professor(
	idProfessor 					INT 		NOT NULL 	PRIMARY KEY 	AUTO_INCREMENT,
    titulacao 						VARCHAR(45) NOT NULL,
    maximoLivros					INT			NOT NULL,
    maximoDias						INT			NOT NULL,
    idUsuario 				INT 		NOT NULL,
    idDepartamento 	INT 		NOT NULL,
	FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)
) DEFAULT CHARSET = utf8;

# DESCRIBE Professor;

-- ---------------------------------
-- Brumateca.Turma
-- ---------------------------------

DROP TABLE IF EXISTS Turma;

CREATE TABLE Turma(
	idTurma 	INT 		NOT NULL 	PRIMARY 	KEY AUTO_INCREMENT,
    nome		VARCHAR(45) NOT NULL 	UNIQUE
) DEFAULT CHARSET = utf8;

# DESCRIBE Turma;

-- ---------------------------------
-- Brumateca.Disciplina
-- ---------------------------------

DROP TABLE IF EXISTS Disciplina;

CREATE TABLE Disciplina(
	idDisciplina 	INT 		NOT NULL 	PRIMARY KEY 	AUTO_INCREMENT,
    nome 			VARCHAR(45) NOT NULL 	UNIQUE
) DEFAULT CHARSET = utf8;

# DESCRIBE Disciplina;

-- ---------------------------------
-- Brumateca.Ensina
-- ---------------------------------

DROP TABLE IF EXISTS Ensina;

CREATE TABLE Ensina( 
	idProfessor 	INT 	NOT NULL,
    idTurma 		INT 	NOT NULL,
	FOREIGN KEY (idProfessor) REFERENCES Professor(idProfessor ),
	FOREIGN KEY (idTurma) REFERENCES Turma(idTurma)
) DEFAULT CHARSET = utf8;

# DESCRIBE Ensina;

-- ---------------------------------
-- Brumateca.TurmaDisciplina
-- ---------------------------------

DROP TABLE IF EXISTS TurmaDisciplina;

CREATE TABLE TurmaDisciplina(
	idTurma 		INT 	NOT NULL,
    idDisciplina 	INT 	NOT NULL,
    FOREIGN KEY (idTurma) REFERENCES Turma(idTurma),
    FOREIGN KEY (idDisciplina) REFERENCES  Disciplina(idDisciplina)
) DEFAULT CHARSET = utf8;

# DESCRIBE TurmaDisciplina;

-- ---------------------------------
-- Brumateca.Obra
-- ---------------------------------

DROP TABLE IF EXISTS Obra;

CREATE TABLE Obra(
	idObra 			INT 		NOT NULL 	PRIMARY KEY 	AUTO_INCREMENT,
    nome 			VARCHAR(45) NOT NULL,
    verificadorObra TINYINT 	NOT NULL DEFAULT 0
) DEFAULT CHARSET = utf8;

# DESCRIBE Obra;

-- ---------------------------------
-- Brumateca.Exemplar
-- ---------------------------------

DROP TABLE IF EXISTS Exemplar;

CREATE TABLE Exemplar(
	idExemplar 	   INT 	NOT NULL 	PRIMARY KEY 	AUTO_INCREMENT,
	numeroExemplar INT 	NOT NULL,
    idObra	   	   INT  NOT NULL,
    FOREIGN KEY (idObra) REFERENCES Obra(idObra)
) DEFAULT CHARSET = utf8;

# DESCRIBE Exemplar;

-- ---------------------------------
-- Brumateca.Consulta
-- ---------------------------------

DROP TABLE IF EXISTS Consulta;

CREATE TABLE Consulta(
	idConsulta 			  INT 		NOT NULL 	PRIMARY KEY 	AUTO_INCREMENT,
    numeroConsulta 		  INT 		NOT NULL,
    verificadorEmprestimo TINYINT 	NOT NULL,
    dataEmprestimo 		  DATE 		NOT NULL,
    dataDevolucao 		  DATE 		NOT NULL,
    numeroEmprestimo      INT 		NOT NULL,
    vencimento            TINYINT 	NOT NULL,
    idExemplar   		  INT 		NOT NULL,
    idUsuario     		  INT 		NOT NULL,
    FOREIGN KEY (idExemplar) REFERENCES ExemplaR(idExemplar),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

# DESCRIBE Consulta;

-- ---------------------------------
-- INSERT INTO Endereco
-- ---------------------------------

INSERT INTO Endereco (idEndereco, cep, cidade, estado, bairro, logradouro, numero, complemento)
VALUES (DEFAULT, '44574150', 'Brumado', 'Bahia', 'Figueira Azul', 'Rua G. Cornel', '154', 'Casa'),
	   (DEFAULT, '46100000', 'Brumado', 'Bahia', 'Mangueira Verde', 'Avenida 7 de Setembro', '147', 'Apartamento'),
       (DEFAULT, '48200010', 'Brumado', 'Bahia', 'Lagoa Real', 'Rua José Meireles', '112', 'Sobrado'),
       (DEFAULT, '46430000', 'Guanambi', 'Bahia', 'Centro', 'Rua Maria Quitéria', '108', 'Edifício'),
	   (DEFAULT, '46450000', 'Dom Basílio', 'Bahia', 'Centro', 'Rua Castro Alves', '170', 'Casa'),
	   (DEFAULT, '46430000', 'Guanambi', 'Bahia', 'Centro', 'Rua Doutor José Humberto Nunes', '55', 'Sobrado'),
	   (DEFAULT, '46430000', 'Livramento', 'Bahia', 'Bela Vista', 'Avenida Otávio Mangabeira', '1026', 'Sobrado'),
	   (DEFAULT, '86520000', 'Brumado', 'Bahia', 'Parque Alvorada', 'Rua Antônio Alves Dantas', '116', 'Apartamento'),
       (DEFAULT, '32785000', 'Rio de Contas', 'Bahia', 'Ginásio Industrial', 'Avenida Mestre Eufrásio', '369', 'Apartamento'),
       (DEFAULT, '96524400', 'Feira de Santana', 'Bahia', 'Centro', 'Rua Grimes', '208', 'Edifício'),
       (DEFAULT, '01400000', 'Dom Basílio', 'Bahia', 'Centro', 'Rua Euclídes', '502', 'Casa'),
       (DEFAULT, '88800000', 'Brumado', 'Bahia', 'Parque Dom Pedro I', 'Avenida Ficodenis', '856', 'Edifício'),
       (DEFAULT, '25440004', 'Brumado', 'Bahia', 'Centro', 'Avenida Figueiredo', '402', 'Apartamento'),
       (DEFAULT, '58778500', 'Brumado', 'Bahia', 'Mangueira Verde', 'Rua Espinosa', '21', 'Apartamento'),
       (DEFAULT, '45420245', 'Brumado', 'Bahia', 'Parque Alvorada', 'Rua Gilberto Gil', '752', 'Sobrado');
       
-- ---------------------------------
-- INSERT INTO Usuario
-- ---------------------------------
       
INSERT INTO Usuario (idUsuario, nome, cpf, dataNascimento, escolaridade, numeroUsuario, usuarioEspecial, idEndereco)
VALUES (DEFAULT, 'Augusto de Souza Meira',   '30273334', '1986-03-28', 'Ensino Superior', '12345', '0', '1'), 
       (DEFAULT, 'Bruno Gomes Caires',       '44956677', '2002-04-02', 'Ensino Fundamental Completo', '20123', '0', '2'),
       (DEFAULT, 'Vanessa Oliveira Silva',   '88896644', '2004-09-06', 'Ensino Fundamental Completo', '20693', '1', '3'), 
       (DEFAULT, 'Geraldo Armenides Silva',  '22258800', '1978-06-30', 'Ensino Superior', '12186', '0', '4'), 
       (DEFAULT, 'Carla Vasconcelos',        '22213366', '2005-08-14', 'Ensino Fundamental Completo', '20786', '0', '5'), 
       (DEFAULT, 'Diego Bernardes Santos',   '12569944', '2003-10-25', 'Ensino Fundamental Completo', '20687', '0', '6'),
       (DEFAULT, 'Tarsila Santos',           '12348910', '1980-12-05', 'Ensino Superior', '20220', '1', '7'),
       (DEFAULT, 'Josué Albuquerque',        '45670123', '2006-11-22', 'Ensino Fundamental Completo', '20105', '1', '8'),
       (DEFAULT, 'Marianne Almeida Santos',  '59687510', '2007-01-31', 'Ensino Fundamental Completo', '20856', '1', '9'), 
       (DEFAULT, 'Michelle Rodrigues Lima',  '85675353', '2003-07-01', 'Ensino Fundamental Completo', '20145', '0', '10'),
       (DEFAULT, 'Júnior Vieira Moura',      '4825223',  '2001-08-10', 'Ensino Fundamental Completo', '20358', '1', '11'), 
       (DEFAULT, 'Natalie Luísa Ribeiro',    '7903355',  '2008-06-21', 'Ensino Fundamental Completo', '20248', '0', '12'), 
       (DEFAULT, 'Iago Nascimento',          '45689023', '2001-09-09', 'Ensino Fundamental Completo', '20352', '0', '1'), 
       (DEFAULT, 'Esmeralda Olivares',       '65804892', '1982-01-17', 'Ensino Superior', '12305', '1', '4'), 
       (DEFAULT, 'Ismael Ramirez',           '4786023',  '1988-07-19', 'Ensino Médio Completo', '21281', '0', '13'), 
       (DEFAULT, 'Fernando García',          '79612308', '1977-03-12', 'Ensino Médio Completo', '21251', '1', '14'), 
       (DEFAULT, 'Gilda Janice Diaz',        '1234523',  '1975-05-12', 'Ensino Médio Completo', '21485', '0', '15'); 
       
-- ---------------------------------
-- INSERT INTO Estudante
-- ---------------------------------
       
INSERT INTO Estudante (idEstudante, numeroMatricula, anoIngresso, maximoLivros, maximoDias, idUsuario)
VALUES (DEFAULT, '15010001', '2016', '4', '14', '2'),
       (DEFAULT, '15010042', '2015', '4', '14', '3'),
       (DEFAULT, '15010012', '2017', '4', '14', '5'),
       (DEFAULT, '15010057', '2017', '4', '14', '6'),
       (DEFAULT, '15010011', '2017', '4', '14', '8'),
       (DEFAULT, '15010022', '2015', '4', '14', '9'),
       (DEFAULT, '15010031', '2016', '4', '14', '10'),
       (DEFAULT, '15010004', '2016', '4', '14', '11'),
       (DEFAULT, '15010099', '2018', '4', '14', '12'),
       (DEFAULT, '15010074', '2018', '4', '14', '13');

-- ---------------------------------
-- INSERT INTO Curso
-- ---------------------------------

INSERT INTO Curso (idCurso, nome)
VALUES (DEFAULT, 'Informática'),
       (DEFAULT, 'Edificações'),
       (DEFAULT, 'Mineração');
	
-- ---------------------------------
-- INSERT INTO Departamento
-- ---------------------------------    

INSERT INTO Departamento (idDepartamento, nome)
VALUES (DEFAULT, 'Pedagógico'),
	   (DEFAULT, 'Financeiro'),
       (DEFAULT, 'Acadêmico');

-- ---------------------------------
-- INSERT INTO Professor
-- ---------------------------------

INSERT INTO Professor (idProfessor, titulacao, maximoLivros, maximoDias, idUsuario, idDepartamento)
VALUES (DEFAULT, 'Doutorado', '10', '180', '1', '1'),
	   (DEFAULT, 'Mestrado', '10', '180', '4', '1'),
       (DEFAULT, 'Graduação', '10', '180', '7', '1'),
       (DEFAULT, 'Graduação', '10', '180', '14', '1');

-- ---------------------------------
-- INSERT INTO Turma
-- ---------------------------------

INSERT INTO Turma (idTurma, nome)
VALUES (DEFAULT, '1° Ano Matutino A'),
	   (DEFAULT, '1° Ano Matutino B'),
       (DEFAULT, '1° Ano Vespertino'),
	   (DEFAULT, '2° Ano Matutino'),
       (DEFAULT, '2° Ano Vespertino A'),
       (DEFAULT, '2° Ano Vespertino B'),
       (DEFAULT, '3° Ano Matutino'),
       (DEFAULT, '3° Ano Vespertino');
       
-- ---------------------------------
-- INSERT INTO Disciplina
-- ---------------------------------

INSERT INTO Disciplina (idDisciplina, nome)
VALUES (DEFAULT, 'Matemática'),
	   (DEFAULT, 'Português'),
       (DEFAULT, 'Programação Web'),
       (DEFAULT, 'Banco de Dados'),
       (DEFAULT, 'Materiais de Construção'),
       (DEFAULT, 'Inglês'),
       (DEFAULT, 'Física'),
       (DEFAULT, 'Química'),
       (DEFAULT, 'História'),
       (DEFAULT, 'Geografia');

-- ---------------------------------
-- INSERT INTO Obra
-- ---------------------------------

INSERT INTO Obra (idObra, nome, verificadorObra)
VALUES (DEFAULT, 'Germinal', 0),
	   (DEFAULT, 'Primo Basílio', 0),
       (DEFAULT, 'Amor de Perdição', 0),
       (DEFAULT, 'Quincas Borba', 0),
       (DEFAULT, 'Crepúsculo', 0),
       (DEFAULT, 'O Cortiço', 0);

-- ---------------------------------
-- INSERT INTO Exemplar
-- ---------------------------------

INSERT INTO Exemplar (idExemplar, numeroExemplar, idObra)
VALUES (DEFAULT, 123456789, 1),
	   (DEFAULT, 012345678, 2),
       (DEFAULT, 987654321, 3),
       (DEFAULT, 876543210, 4),
       (DEFAULT, 135790000, 5),
       (DEFAULT, 246800000, 6);

-- ---------------------------------
-- INSERT INTO Consulta
-- ---------------------------------

INSERT INTO Consulta (idConsulta, numeroConsulta, verificadorEmprestimo, dataEmprestimo, dataDevolucao, numeroEmprestimo, vencimento, idExemplar, idUsuario)
VALUES (DEFAULT, 1, 0, '2022-04-08', '2022-02-08', 1, FALSE, 5, 14),
	   (DEFAULT, 2, 1, '2022-12-08', '2022-03-08', 2, TRUE, 3, 2),
	   (DEFAULT, 3, 0, '2022-10-08', '2023-10-03', 3, FALSE, 6, 11),
	   (DEFAULT, 4, 0, '2022-10-08', '2023-10-03', 4, FALSE, 2, 7),
       (DEFAULT, 5, 0, '2022-03-08', '2022-10-08', 5, FALSE, 1, 13),
       (DEFAULT, 6, 1, '2022-03-08', '2022-10-08', 6, FALSE, 4, 4);

-- ---------------------------------
-- SELECT Usuario e Estudante
-- ---------------------------------

SELECT
	CONCAT('Nome: ', u.nome, ' | ', 'Matrícula: ', e.numeroMatricula) AS 'Nome e Matrícula dos Estudantes.'
FROM Usuario u
INNER JOIN Estudante e
ON u.idUsuario = e.idUsuario
ORDER BY u.nome ASC;

-- ---------------------------------
-- SELECT Usuario e Professor
-- ---------------------------------

SELECT 
	MIN(u.dataNascimento) AS 'Data de Nascimento do Professor mais Experiente'
FROM Usuario u
INNER JOIN Professor p
ON u.idUsuario = p.idUsuario;

SELECT 
	MAX(u.dataNascimento) AS 'Data de Nascimento do Professor mais Jovem'
FROM Usuario u
INNER JOIN Professor p
ON u.idUsuario = p.idUsuario;

SELECT 
	MAX(LENGTH(u.nome)) AS 'Maior Nome Dentre os Professores'
FROM Usuario u
INNER JOIN Professor p
ON u.idUsuario = p.idUsuario;

SELECT 
	COUNT(u.idUsuario) AS 'Quantidade de Professores'
FROM Usuario u
INNER JOIN Professor p
ON u.idUsuario = p.idUsuario;

-- ---------------------------------
-- SELECT Usuario e Estudante
-- ---------------------------------

SELECT 
	MAX(LENGTH(u.nome)) AS 'Maior Nome Dentre os Estudantes'
FROM Usuario u
INNER JOIN Estudante e
ON u.idUsuario = e.idUsuario;

SELECT 
	COUNT(u.idUsuario) AS 'Quantidade de Estudantes'
FROM Usuario u
INNER JOIN Estudante e
ON u.idUsuario = e.idUsuario;

-- ---------------------------------
-- SELECT Obra e Exemplar
-- ---------------------------------

SELECT
    o.nome AS 'Nome do Exemplar',
    o.verificadorObra AS 'Tipo da Obra',
	e.numeroExemplar AS 'Exemplar'
FROM Obra o
INNER JOIN Exemplar e
ON e.idObra = o.idObra;

-- ---------------------------------
-- SELECT Usuario e Endereco
-- ---------------------------------

SELECT
	u.nome AS 'Nome do Usuário',
    u.cpf AS 'CPF do Usuário',
    concat(e.cep, " - ", e.cidade, " - ", e.estado, " - ", e.bairro, " - ", e.logradouro, " - ", e.numero, " - ", e.complemento) AS 'Endereço Completo'
FROM Endereco e
INNER JOIN Usuario u
ON u.idEndereco = e.idEndereco;

-- -------------------------------------
-- SELECT Usuario, Consulta e Exemplar
-- -------------------------------------

SELECT
	u.nome AS 'Nome do Usuário',
    u.cpf AS 'CPF do Usuário',
    c.numeroConsulta AS 'Número de Consulta',
    e.numeroExemplar AS 'Número do Exemplar'
FROM Usuario u
INNER JOIN Consulta c
ON c.idUsuario = u.idUsuario
INNER JOIN Exemplar e
ON c.idExemplar = e.idExemplar;

-- ---------------------------------
-- SELECT Estudante, Estuda e Curso
-- ---------------------------------

SELECT
	et.numeroMatricula AS 'Nome do Estudante',
    c.nome AS 'Nome do Curso'
FROM Curso c
INNER JOIN Estuda ed
ON ed.idCurso = c.idCurso
INNER JOIN Estudante et
ON et.idEstudante = ed.idEstudante;

-- ------------------------------------------
-- SELECT Usuario, Professor e Departamento
-- ------------------------------------------

SELECT
	u.nome AS 'Nome do Professor',
    d.nome AS 'Nome do Departamento'
FROM Usuario u
INNER JOIN Professor p
ON u.idUsuario = p.idUsuario
INNER JOIN Departamento d
ON p.idDepartamento = d.idDepartamento;

-- ---------------------------------
-- SELECT Turma, Ensina e Professor
-- ---------------------------------

SELECT
	t.nome AS 'Nome da Turma',
    p.titulacao AS 'Titulação'
FROM Turma t
INNER JOIN Ensina es
ON es.idTurma = t.idTurma
INNER JOIN Professor p
ON es.idProfessor = p.idProfessor;

-- --------------------------------------------
-- SELECT Turma, TurmaDisciplina e Disciplina
-- --------------------------------------------

SELECT
	t.nome AS 'Nome da Turma',
    di.nome AS 'Nome da Disciplina'
FROM Turma t
INNER JOIN TurmaDisciplina td
ON td.idTurma = t.idTurma
INNER JOIN Disciplina di
ON td.idDisciplina = di.idDisciplina;
