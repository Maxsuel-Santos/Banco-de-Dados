
UPDATE 
	Obra
SET 
	nome = 'A Hora da Estrela'
WHERE
	idObra = 7;

CREATE VIEW v_EstudanteUsuario AS
SELECT 
	u.*,
    e.numeroMatricula AS 'matricula',
    e.anoIngresso AS 'ingresso',
    e.idEstudante
FROM Usuario u
INNER JOIN Estudante e
ON u.idUsuario = e.idUsuario;

SELECT 
	count(e.idExemplar) AS qtd,
    o.nome
FROM Obra o
INNER JOIN Exemplar e
ON o.idObra = e.idObra
GROUP BY o.idObra
ORDER BY qtd DESC;

SELECT 
	p.titulacao AS 'ingresso',
    count(idProfessor)
FROM Usuario u
INNER JOIN Professor p
ON u.idUsuario = p.idUsuario
GROUP BY p.titulacao
ORDER BY p.titulacao;

-- select * from usuario where dataNascimento = '2001-08-10';
SELECT u.nome, u.dataNascimento
FROM Usuario u 
INNER JOIN Estudante e
ON u.idUsuario = e.idUsuario
WHERE 
	dataNascimento = (
		SELECT min(u.dataNascimento) FROM Usuario u 
		INNER JOIN Estudante e
		ON u.idUsuario = e.idUsuario
	);

SELECT 
	u.nome, u.dataNascimento
FROM Usuario u
INNER JOIN Estudante e
ON u.idUsuario = e.idUsuario
WHERE 
	u.dataNascimento = (
		SELECT min(u.dataNascimento) 
		FROM Usuario u
		INNER JOIN Estudante e
		ON u.idUsuario = e.idUsuario
	);



DELETE FROM Exemplar
WHERE idExemplar = 1;

UPDATE 
	Obra
SET 
	nome = 'A Hora da Estrela'
WHERE
	idObra = 7;
    
SELECT u.*, e.idEstudante, p.idProfessor
FROM Usuario u
LEFT JOIN Estudante e 
ON u.idUsuario = e.idUsuario
LEFT JOIN Professor p
ON u.idUsuario = p.idUsuario
WHERE 
	e.idEstudante IS NULL AND
    p.idProfessor IS NULL;
    
SELECT 
	o.nome AS 'Nome da Obra',
	count(idExemplar) AS 'Quantidade de Exemplares'
FROM Obra o
INNER JOIN Exemplar e
ON o.idObra = e.idObra
GROUP BY o.idObra
ORDER BY o.nome;

SELECT 
	count(e.idEstudante) AS 'QTD ESTUDANTE', 
	c.nome
FROM Estudante e
INNER JOIN Estuda est
ON e.idEstudante = est.idEstudante
INNER JOIN Curso c
ON c.idCurso = est.idCurso
GROUP BY c.idCurso
ORDER BY c.nome;

SELECT count(e.idExemplar), o.nome
FROM Obra o
INNER JOIN Exemplar e
ON e.idObra = o.idObra
GROUP BY o.idObra
ORDER BY o.nome;

CREATE VIEW v_UsuarioEstudante AS
SELECT
	u.nome, u.cpf, u.dataNascimento, 
    u.numeroUsuario, u.idEndereco,
    e.numeroMatricula, e.anoIngresso,
	e.maximoLivros, e.maximoDias
FROM Usuario u
INNER JOIN Estudante e
ON u.idUsuario = e.idUsuario;

SELECT * FROM v_UsuarioEstudante;

SELECT 	u.idUsuario, u.nome FROM Usuario u;

DELETE FROM Estudante WHERE idUsuario = 12;
DELETE FROM Usuario WHERE idUsuario = 12;


UPDATE 
	Curso
SET
	nome = "Informática para Web"
WHERE 
	idCurso = 2;

SELECT * FROM Curso;


