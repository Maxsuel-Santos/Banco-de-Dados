# GABRIEL SANTOS & GABRIEL SANTOS

# MUITO FÁCEIS

# Mostre o nome, sobrenome, CPF, matricula e data de nascimento de todos os estudantes.

SELECT e.nome AS 'Nome', e.sobrenome AS 'Sobrenome', e.cpf AS 'CPF', e.matricula AS 'Matrícula', e.data_de_nascimento AS 'Data de Nascimento'
FROM Estudante e
ORDER BY e.nome;

# Mostre o nome, sobrenome, CPF,  data de nascimento de todos os responsáveis.

SELECT r.nome AS 'Nome', r.sobrenome AS 'Sobrenome', r.cpf AS 'CPF', r.data_de_nascimento AS 'Data de Nascimento'
FROM Responsavel r
ORDER BY r.nome;

# Mostre o nome, sobrenome, CPF, matricula e data de nascimento de todos os docentes.

SELECT d.nome AS 'Nome', d.sobrenome AS 'Sobrenome', d.cpf AS 'CPF', d.matricula AS 'Matrícula', d.data_de_nascimento AS 'Data de Nascimento'
FROM Docente d
ORDER BY d.nome ASC;

# Mostre todos os dados de uma turma.

SELECT * FROM Turma;

# Mostre todos os dados de uma disciplina.

SELECT * FROM Disciplina;

# FÁCEIS

# Mostre todas as turmas cadastradas no banco de dados.

SELECT Turma.id AS 'ID', Turma.nome AS 'Turma', Turma.codigo AS 'Código', Turma.serie AS 'Série', Turma.ano AS 'Ano'
FROM Turma
ORDER BY Turma.id ASC;

# Mostre o nome dos dois responsáveis de um estudante.

SELECT Estudante.nome AS 'Nome do Estudante', Responsavel.nome AS 'Nome dos Responsáveis'
FROM Responsavel
INNER JOIN Estudante
ON Estudante.id= Responsavel.id
ORDER BY Estudante.nome ASC;

# Mostre os dados de uma disciplina e nome do docente que a ministrou.

SELECT Disciplina.id AS 'ID', Disciplina.nome AS 'Nome da Disciplina', Disciplina.codigo AS 'Código', Disciplina.serie AS 'Série', Docente.nome AS 'Nome do Docente', Docente.sobrenome AS 'Sobrenome do Docente'
FROM Disciplina
INNER JOIN Docente_Disciplina
ON Disciplina.id = Docente_Disciplina.id_Disciplina
INNER JOIN Docente
ON Docente.id = Docente_Disciplina.id_Docente
ORDER BY Disciplina.id ASC;


# Mostre o nome e o código de uma disciplina cursada por uma turma.

SELECT d.nome AS 'Disciplina', d.codigo AS 'Código da Disciplina', t.nome AS 'Turma'
FROM Disciplina d
INNER JOIN Turma_Disciplina td
ON d.id = td.id_Disciplina
INNER JOIN 	Turma t
ON t.id = td.id_Turma
ORDER BY d.nome ASC;

# Mostre o nome, sobrenome, matricula e CPF dos estudantes de uma turma.

SELECT e.nome AS 'Nome do Aluno', e.sobrenome AS 'Sobrenome do Aluno', e.matricula AS 'Matrícula', e.cpf AS 'CPF', t.nome AS 'Turma'
FROM Estudante e
INNER JOIN Estudante_Turma et
ON e.id = et.id_Estudante
INNER JOIN Turma t
ON t.id = et.id_Turma
ORDER BY e.nome ASC;
