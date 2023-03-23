-- ---------------------------------
-- VIEWS 
-- --------------------------------- 

-- QUESTÃO A
-- Crie visões para cada um dos itens abaixo:

#1 Mostrar todas as disciplinas de uma turma, ordenados pelo nome da disciplina.

DROP VIEW IF EXISTS v_disciplinaTurma;

CREATE VIEW v_disciplinaTurma AS
SELECT 
	d.nome AS 'Disciplina',
    t.nome AS 'Turma'
FROM Disciplina d
INNER JOIN TurmaDisciplina tm
ON d.idDisciplina = tm.idDisciplina
INNER JOIN Turma t
ON t.idTurma = tm.idTurma
ORDER BY d.nome ASC;

SELECT * FROM v_disciplinaTurma;

#2 Mostrar os departamentos de todos os professores, ordenados pelo nome do departamento.

DROP VIEW IF EXISTS v_profDepart;

CREATE VIEW v_profDepart AS
SELECT 
	u.nome AS 'Professor',
    dp.nome AS 'Departamento'
FROM Usuario u 
INNER JOIN Professor p
ON u.idUsuario = p.idUsuario
INNER JOIN Departamento dp
ON p.idDepartamento = dp.idDepartamento
ORDER BY dp.nome;

SELECT * FROM v_profDepart;

#3 Mostrar o cpf, o nome de usuário, a data de emprestimo, a data de devolução, o vencimento, o título da obra e o número do exemplar dos livros consultados.

CREATE VIEW v_dadosConsulta AS
SELECT
	u.cpf AS 'CPF',
    u.nome AS 'Nome do Usuário',
    c.dataEmprestimo AS 'Data de Empréstimo',
    c.dataDevolucao AS 'Data de Devolução',
    c.vencimento AS 'Vencimento',
    e.numeroExemplar AS 'Número do Exemplar',
    o.nome AS 'Título da Obra'
FROM Usuario u
INNER JOIN Consulta c
ON u.idUsuario = c.idUsuario
INNER JOIN Exemplar e
ON c.idExemplar = e.idExemplar
INNER JOIN Obra o
ON e.idObra = o.idObra;

SELECT * FROM v_dadosConsulta;


-- ---------------------------------
-- UPDATE & DELETE 
-- --------------------------------- 

-- QUESTÃO B
-- Atualize os dados para cada um dos itens definidos abaixo:

#1 O endereço do estudante Ismael Ramirez

-- Antes
SELECT 
	u.nome AS 'Nome do Usuário',
    u.idEndereco AS 'Id do Endereço'
FROM Usuario u
WHERE idUsuario = 15;

-- Atualização do idEndereco
UPDATE Usuario 
SET idEndereco = 7
WHERE idUsuario = 15;

-- Depois
SELECT 
	u.nome AS 'Nome do Usuário',
    u.idEndereco AS 'Id do Endereço'
FROM Usuario u
WHERE idUsuario = 15;

#2 O nome do departamento "Acadêmico" para "Diretoria de Ensino"

-- Antes
SELECT 
	dp.nome AS 'Departamento'
FROM Departamento dp
WHERE idDepartamento = 3;

-- Atualização do nome do Departamento
UPDATE Departamento
SET nome = 'Diretoria de Ensino'
WHERE idDepartamento = 3;

-- Depois
SELECT 
	dp.nome AS 'Departamento'
FROM Departamento dp
WHERE idDepartamento = 3;

#3 O nome da disciplina "Português" para "Língua Portuguesa"

-- Antes
SELECT 
	dis.nome AS 'Disciplina'
FROM Disciplina dis
WHERE idDisciplina = 2;

UPDATE Disciplina
SET nome = 'Língua Portuguesa'
WHERE idDisciplina = 2;

-- Depois
SELECT 
	dis.nome AS 'Disciplina'
FROM Disciplina dis
WHERE idDisciplina = 2;