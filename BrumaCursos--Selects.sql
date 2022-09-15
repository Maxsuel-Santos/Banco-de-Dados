# Questão 1
SELECT COUNT(idPessoa) FROM Pessoa WHERE peso < 60;

# Questão 2
SELECT COUNT(idEstudante) AS 'Nascidos antes de 01/07/1995'
FROM Estudante e
INNER JOIN Pessoa p
ON e.idPessoa = p.idPessoa
WHERE nascimento < '1995-07-01';

# Questão 3
SELECT 
	p.nome AS 'Nome',
    pro.nome AS 'Profissão'
FROM Pessoa p
INNER JOIN Profissao pro
ON pro.idProfissao = p.idProfissao;

# Questão 4
SELECT nome, descricao, carga_horaria FROM Curso WHERE ano_lancamento < 2016;

#Questão 5
SELECT MIN(nascimento) AS 'Data de Nascimento'
FROM Estudante e
INNER JOIN Pessoa p
ON e.idPessoa = p.idPessoa;

#Questão 5
SELECT 
	c.nome AS 'Curso',
    p.nome 'Nome do Estudante',
    p.sexo AS 'Sexo',
    e.numero_matricula AS 'Número da Matrícula'
FROM Curso c
INNER JOIN Estudante e
ON c.idCurso = e.idCurso
INNER JOIN Pessoa p
ON p.idPessoa = e.idPessoa
ORDER BY c.nome ASC;