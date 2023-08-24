create schema escola;

-- Tabela de Alunos
CREATE TABLE Alunos (
    AlunoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Contato VARCHAR(50),
    Endereco VARCHAR(200),
    AnoAdmissao INT
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY,
    Nome VARCHAR(100)
);

-- Tabela de Inscrições
CREATE TABLE Inscricoes (
    InscricaoID INT PRIMARY KEY,
    AlunoID INT,
    CursoID INT,
    Frequencia DECIMAL(5, 2),
    Nota DECIMAL(5, 2),
    ArquivoBolsa VARCHAR(200),
    Resultado VARCHAR(20),
    FOREIGN KEY (AlunoID) REFERENCES Alunos(AlunoID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- Inserindo dados de exemplo na tabela Alunos
INSERT INTO Alunos (AlunoID, Nome, Contato, Endereco, AnoAdmissao) VALUES (1, 'Ana Silva', 'ana@example.com', 'Rua X, 123', 2020);
INSERT INTO Alunos (AlunoID, Nome, Contato, Endereco, AnoAdmissao) VALUES (2, 'Carlos Oliveira', 'carlos@example.com', 'Avenida Y, 456', 2021);
INSERT INTO Alunos (AlunoID, Nome, Contato, Endereco, AnoAdmissao) VALUES (3, 'Mariana Santos', 'mariana@example.com', 'Praça Z, 789', 2019);
INSERT INTO Alunos (AlunoID, Nome, Contato, Endereco, AnoAdmissao) VALUES (4, 'Lucas Souza', 'lucas@example.com', 'Rua A, 101', 2022);
INSERT INTO Alunos (AlunoID, Nome, Contato, Endereco, AnoAdmissao) VALUES (5, 'Beatriz Lima', 'beatriz@example.com', 'Avenida B, 202', 2020);

-- Inserindo dados de exemplo na tabela Cursos
INSERT INTO Cursos (CursoID, Nome) VALUES (101, 'Matemática');
INSERT INTO Cursos (CursoID, Nome) VALUES (102, 'História');
INSERT INTO Cursos (CursoID, Nome) VALUES (103, 'Ciências');
INSERT INTO Cursos (CursoID, Nome) VALUES (104, 'Geografia');
INSERT INTO Cursos (CursoID, Nome) VALUES (105, 'Artes');

-- Inserindo dados de exemplo na tabela Inscricoes
INSERT INTO Inscricoes (InscricaoID, AlunoID, CursoID, Frequencia, Nota, ArquivoBolsa, Resultado) VALUES (201, 1, 101, 85.0, 8.5, 'bolsa_anasilva.pdf', 'Aprovado');
INSERT INTO Inscricoes (InscricaoID, AlunoID, CursoID, Frequencia, Nota, ArquivoBolsa, Resultado) VALUES (202, 2, 102, 75.0, 7.0, 'bolsa_carlosoliveira.pdf', 'Aprovado');
INSERT INTO Inscricoes (InscricaoID, AlunoID, CursoID, Frequencia, Nota, ArquivoBolsa, Resultado) VALUES (203, 1, 103, 90.0, 9.0, 'bolsa_anasilva.pdf', 'Aprovado');
INSERT INTO Inscricoes (InscricaoID, AlunoID, CursoID, Frequencia, Nota, ArquivoBolsa, Resultado) VALUES (204, 3, 101, 70.0, 7.5, NULL, 'Reprovado');
INSERT INTO Inscricoes (InscricaoID, AlunoID, CursoID, Frequencia, Nota, ArquivoBolsa, Resultado) VALUES (205, 4, 105, 95.0, 9.5, 'bolsa_lucassouza.pdf', 'Aprovado');

-- Lista todos os alunos
SELECT Alunos.AlunoID, Alunos.Nome, Alunos.Contato, Alunos.Endereco, Alunos.AnoAdmissao FROM Alunos;

-- Mostra os cursos em que cada aluno está inscrito
SELECT Alunos.Nome, Cursos.Nome FROM Alunos
JOIN Inscricoes ON Alunos.AlunoID = Inscricoes.AlunoID
JOIN Cursos ON Inscricoes.CursoID = Cursos.CursoID;

-- Exibi as notas e a frequência dos alunos em um curso específico
SELECT Alunos.Nome, Cursos.Nome, Inscricoes.Nota, Inscricoes.Frequencia FROM Alunos
JOIN Inscricoes ON Alunos.AlunoID = Inscricoes.AlunoID
JOIN Cursos ON Inscricoes.CursoID = Cursos.CursoID
WHERE Cursos.CursoID = 101;

-- Lista os alunos que receberam bolsas de estudo
SELECT Alunos.Nome, Inscricoes.ArquivoBolsa FROM Alunos
JOIN Inscricoes ON Alunos.AlunoID = Inscricoes.AlunoID
WHERE Inscricoes.ArquivoBolsa IS NOT NULL;

-- Mostra os alunos aprovados em um determinado curso
SELECT Alunos.Nome, Cursos.Nome FROM Alunos
JOIN Inscricoes ON Alunos.AlunoID = Inscricoes.AlunoID
JOIN Cursos ON Inscricoes.CursoID = Cursos.CursoID
WHERE Inscricoes.Resultado = 'Aprovado';


