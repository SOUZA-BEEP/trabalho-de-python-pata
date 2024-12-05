CREATE DATABASE Turma_PI;

USE Turma_PI;

CREATE TABLE Alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL
);

INSERT INTO Alunos (nome_completo) VALUES
('António Monteiro'),
('Celso Jesus'),
('Daniel Henriques'),
('Emanuel Leiria'),
('Gabriel Serpa'),
('João Amado'),
('Jeizy Luciano'),
('João Anjos'),
('Martin Barreirã'),
('Prancha Acharya'),
('Prince Lamichhane'),
('Raquel Leal'),
('Sérgio Tatarochuk'),
('Vistalaslav Bykousski');

CREATE TABLE Disciplinas (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome_disciplina VARCHAR(255) NOT NULL,
    carga_horaria INT NOT NULL
);

INSERT INTO Disciplinas (nome_disciplina, carga_horaria) VALUES
('Programação', 120),
('Base de Dados', 80),
('Redes de Computadores', 60),
('Sistemas Operativos', 90),
('Desenvolvimento Web', 100);

CREATE TABLE Notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_disciplina INT NOT NULL,
    nota DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

INSERT INTO Notas (id_aluno, id_disciplina, nota) VALUES
(1, 1, 15.5),
(2, 1, 18.0),
(3, 2, 14.5),
(4, 2, 12.0),
(5, 3, 16.0),
(6, 4, 13.5),
(7, 5, 17.0);

CREATE TABLE Presenca (
    id_presenca INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_disciplina INT NOT NULL,
    data DATE NOT NULL,
    presente TINYINT(1) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno) ON DELETE CASCADE,
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina) ON DELETE CASCADE
);

INSERT INTO Presenca (id_aluno, id_disciplina, data, presente) VALUES
(1, 1, '2024-11-01', 1),
(2, 1, '2024-11-01', 0),
(3, 2, '2024-11-01', 1),
(4, 3, '2024-11-02', 1),
(5, 4, '2024-11-03', 0),
(6, 5, '2024-11-04', 1);


#exe 1
SELECT * FROM alunos;


#exe 2
SELECT nome_disciplina, carga_horaria FROM disciplinas;

#exe3

SELECT d.nome_disciplina, n.nota
FROM notas n
JOIN disciplinas d ON n.id_disciplina = d.id_disciplina
WHERE n.id_aluno = <id_do_aluno>;

#exe4
SELECT d.nome_disciplina, AVG(n.nota) AS media
FROM notas n
JOIN disciplinas d ON n.id_disciplina = d.id_disciplina
GROUP BY d.nome_disciplina;

#exe5
SELECT a.nome_aluno, COUNT(n.id_disciplina) AS total_disciplinas
FROM alunos a
JOIN notas n ON a.id_aluno = n.id_aluno
GROUP BY a.id_aluno;

#exe6
SELECT nome_disciplina, carga_horaria
FROM disciplinas
ORDER BY carga_horaria DESC
LIMIT 1;

SELECT nome_disciplina, carga_horaria
FROM disciplinas
ORDER BY carga_horaria ASC
LIMIT 1;

#exe7
SELECT a.nome_aluno, AVG(n.nota) AS media, 
       CASE 
           WHEN AVG(n.nota) >= 7 THEN 'Bom'
           WHEN AVG(n.nota) >= 5 THEN 'Regular'
           ELSE 'Ruim'
       END AS desempenho
FROM alunos a
JOIN notas n ON a.id_aluno = n.id_aluno
GROUP BY a.id_aluno;

#exe8
EXPLAIN SELECT a.nome, d.nome, n.nota
FROM alunos a
JOIN notas n ON a.id_aluno = n.id_aluno
JOIN disciplinas d ON n.id_disciplina = d.id_disciplina
WHERE a.nome = 'João Anjos';