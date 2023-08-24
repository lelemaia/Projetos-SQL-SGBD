create schema doacaosangue;

-- Tabela de Pacientes
CREATE TABLE Pacientes (
    PacienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    GrupoSanguineo VARCHAR(5),
    Doencas VARCHAR(200)
);

-- Tabela de Doadores
CREATE TABLE Doadores (
    DoadorID INT PRIMARY KEY,
    Nome VARCHAR(100),
    GrupoSanguineo VARCHAR(5),
    TipoSanguineo VARCHAR(3),
    FatorRH CHAR(1)
);

-- Tabela de Bancos de Sangue
CREATE TABLE BancosDeSangue (
    BancoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Localizacao VARCHAR(200)
);

-- Inserindo dados de exemplo na tabela Pacientes
INSERT INTO Pacientes (PacienteID, Nome, GrupoSanguineo, Doencas) VALUES (1, 'Lucas', 'A+', 'Anemia');
INSERT INTO Pacientes (PacienteID, Nome, GrupoSanguineo, Doencas) VALUES (2, 'Maria', 'O-', 'Leucemia');
INSERT INTO Pacientes (PacienteID, Nome, GrupoSanguineo, Doencas) VALUES (3, 'Carlos', 'B+', 'Hemofilia');
INSERT INTO Pacientes (PacienteID, Nome, GrupoSanguineo, Doencas) VALUES (4, 'Ana', 'AB+', 'Asma');
INSERT INTO Pacientes (PacienteID, Nome, GrupoSanguineo, Doencas) VALUES (5, 'Paulo', 'O+', 'Diabetes');
INSERT INTO Pacientes (PacienteID, Nome, GrupoSanguineo, Doencas) VALUES (6, 'Lucia', 'A-', 'Hipertensão');

-- Inserindo dados de exemplo na tabela Doadores
INSERT INTO Doadores (DoadorID, Nome, GrupoSanguineo, TipoSanguineo, FatorRH) VALUES (1, 'Ana', 'A+', 'A', '+');
INSERT INTO Doadores (DoadorID, Nome, GrupoSanguineo, TipoSanguineo, FatorRH) VALUES (2, 'Paulo', 'B-', 'B', '-');
INSERT INTO Doadores (DoadorID, Nome, GrupoSanguineo, TipoSanguineo, FatorRH) VALUES (3, 'Lucia', 'AB+', 'AB', '+');
INSERT INTO Doadores (DoadorID, Nome, GrupoSanguineo, TipoSanguineo, FatorRH) VALUES (4, 'Rafael', 'O-', 'O', '-');
INSERT INTO Doadores (DoadorID, Nome, GrupoSanguineo, TipoSanguineo, FatorRH) VALUES (5, 'Mariana', 'O+', 'O', '+');
INSERT INTO Doadores (DoadorID, Nome, GrupoSanguineo, TipoSanguineo, FatorRH) VALUES (6, 'Pedro', 'A-', 'A', '-');

-- Inserindo dados de exemplo na tabela BancosDeSangue
INSERT INTO BancosDeSangue (BancoID, Nome, Localizacao) VALUES (1, 'Banco Central de Sangue', 'Rua Principal, 123');
INSERT INTO BancosDeSangue (BancoID, Nome, Localizacao) VALUES (2, 'Banco de Sangue da Cidade', 'Avenida Central, 456');
INSERT INTO BancosDeSangue (BancoID, Nome, Localizacao) VALUES (3, 'Banco de Sangue Solidário', 'Praça do Bem, 789');

-- Lista os pacientes com seus grupos sanguíneos e doenças
SELECT Pacientes.PacienteID, Pacientes.Nome, Pacientes.GrupoSanguineo, Pacientes.Doencas FROM Pacientes;

-- Mostra os doadores com seus grupos sanguíneos e tipo/fator RH
SELECT Doadores.DoadorID, Doadores.Nome, Doadores.GrupoSanguineo, Doadores.TipoSanguineo, Doadores.FatorRH FROM Doadores;

-- Mostra os bancos de sangue e suas localizações
SELECT BancosDeSangue.BancoID, BancosDeSangue.Nome, BancosDeSangue.Localizacao FROM BancosDeSangue;

-- Lista os pacientes com grupo sanguíneo A+
SELECT Pacientes.PacienteID, Pacientes.Nome, Pacientes.GrupoSanguineo FROM Pacientes
WHERE Pacientes.GrupoSanguineo = 'A+';

-- Mostra os doadores com grupo sanguíneo O- e fator RH negativo
SELECT Doadores.DoadorID, Doadores.Nome, Doadores.GrupoSanguineo FROM Doadores
WHERE Doadores.GrupoSanguineo = 'O-' AND Doadores.FatorRH = '-';



