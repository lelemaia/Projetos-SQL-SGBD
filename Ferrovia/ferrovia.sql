create schema ferrovia;

-- Criação da tabela de Estações Ferroviárias
CREATE TABLE Estacoes (
    EstacaoID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Localizacao VARCHAR(200) NOT NULL
);

-- Criação da tabela de Trens
CREATE TABLE Trens (
    TremID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50) NOT NULL
);

-- Criação da tabela de Rotas de Trens
CREATE TABLE Rotas (
    RotaID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

-- Criação da tabela de Detalhes de Rotas (estabelece a relação entre Rota e Estação)
CREATE TABLE DetalhesRotas (
    DetalheID INT PRIMARY KEY,
    RotaID INT,
    EstacaoID INT,
    Sequencia INT NOT NULL,
    FOREIGN KEY (RotaID) REFERENCES Rotas(RotaID),
    FOREIGN KEY (EstacaoID) REFERENCES Estacoes(EstacaoID)
);

-- Criação da tabela de Horários de Trens
CREATE TABLE Horarios (
    HorarioID INT PRIMARY KEY,
    RotaID INT,
    TremID INT,
    EstacaoID INT,
    HorarioChegada DATETIME NOT NULL,
    HorarioPartida DATETIME NOT NULL,
    FOREIGN KEY (RotaID) REFERENCES Rotas(RotaID),
    FOREIGN KEY (TremID) REFERENCES Trens(TremID),
    FOREIGN KEY (EstacaoID) REFERENCES Estacoes(EstacaoID)
);

-- Criação da tabela de Reservas de Clientes
CREATE TABLE Reservas (
    ReservaID INT PRIMARY KEY,
    ClienteID INT,
    RotaID INT,
    TremID INT,
    EstacaoID INT,
    HorarioPartida DATETIME NOT NULL,
    FOREIGN KEY (RotaID) REFERENCES Rotas(RotaID),
    FOREIGN KEY (TremID) REFERENCES Trens(TremID),
    FOREIGN KEY (EstacaoID) REFERENCES Estacoes(EstacaoID)
);
-- ----------------------------------------------------------------------------------

-- Inserir dados nas tabelas de Estações
INSERT INTO Estacoes (EstacaoID, Nome, Localizacao) VALUES (1, 'Estação A', 'Localização A');
INSERT INTO Estacoes (EstacaoID, Nome, Localizacao) VALUES (2, 'Estação B', 'Localização B');
INSERT INTO Estacoes (EstacaoID, Nome, Localizacao) VALUES (3, 'Estação C', 'Localização C');

-- Inserir dados nas tabelas de Trens
INSERT INTO Trens (TremID, Nome, Tipo) VALUES (1, 'Trem Expresso', 'Expresso');
INSERT INTO Trens (TremID, Nome, Tipo) VALUES (2, 'Trem Local', 'Local');
INSERT INTO Trens (TremID, Nome, Tipo) VALUES (3, 'Trem Carga', 'Carga');

-- Inserir dados nas tabelas de Rotas
INSERT INTO Rotas (RotaID, Nome) VALUES (1, 'Rota X');
INSERT INTO Rotas (RotaID, Nome) VALUES (2, 'Rota Y');
INSERT INTO Rotas (RotaID, Nome) VALUES (3, 'Rota Z');

-- Inserir dados nas tabelas de Detalhes de Rotas
INSERT INTO DetalhesRotas (DetalheID, RotaID, EstacaoID, Sequencia) VALUES (1, 1, 1, 1);
INSERT INTO DetalhesRotas (DetalheID, RotaID, EstacaoID, Sequencia) VALUES (2, 1, 2, 2);
INSERT INTO DetalhesRotas (DetalheID, RotaID, EstacaoID, Sequencia) VALUES (3, 1, 3, 3);
INSERT INTO DetalhesRotas (DetalheID, RotaID, EstacaoID, Sequencia) VALUES (4, 2, 1, 1);
INSERT INTO DetalhesRotas (DetalheID, RotaID, EstacaoID, Sequencia) VALUES (5, 2, 3, 2);
INSERT INTO DetalhesRotas (DetalheID, RotaID, EstacaoID, Sequencia) VALUES (6, 3, 2, 1);
INSERT INTO DetalhesRotas (DetalheID, RotaID, EstacaoID, Sequencia) VALUES (7, 3, 3, 2);

-- Inserir dados nas tabelas de Horários
INSERT INTO Horarios (HorarioID, RotaID, TremID, EstacaoID, HorarioChegada, HorarioPartida) VALUES (1, 1, 1, 1, '2023-08-24 10:00:00', '2023-08-24 10:10:00');
INSERT INTO Horarios (HorarioID, RotaID, TremID, EstacaoID, HorarioChegada, HorarioPartida) VALUES (2, 1, 1, 2, '2023-08-24 10:30:00', '2023-08-24 10:40:00');
INSERT INTO Horarios (HorarioID, RotaID, TremID, EstacaoID, HorarioChegada, HorarioPartida) VALUES (3, 1, 1, 3, '2023-08-24 11:00:00', '2023-08-24 11:10:00');
INSERT INTO Horarios (HorarioID, RotaID, TremID, EstacaoID, HorarioChegada, HorarioPartida) VALUES (4, 2, 2, 1, '2023-08-24 12:00:00', '2023-08-24 12:10:00');
INSERT INTO Horarios (HorarioID, RotaID, TremID, EstacaoID, HorarioChegada, HorarioPartida) VALUES (5, 2, 2, 3, '2023-08-24 12:30:00', '2023-08-24 12:40:00');
INSERT INTO Horarios (HorarioID, RotaID, TremID, EstacaoID, HorarioChegada, HorarioPartida) VALUES (6, 3, 3, 2, '2023-08-24 14:00:00', '2023-08-24 14:10:00');
INSERT INTO Horarios (HorarioID, RotaID, TremID, EstacaoID, HorarioChegada, HorarioPartida) VALUES (7, 3, 3, 3, '2023-08-24 14:30:00', '2023-08-24 14:40:00');

-- Inserir dados nas tabelas de Reservas
INSERT INTO Reservas (ReservaID, ClienteID, RotaID, TremID, EstacaoID, HorarioPartida) VALUES (1, 101, 1, 1, 1, '2023-08-24 10:10:00');
INSERT INTO Reservas (ReservaID, ClienteID, RotaID, TremID, EstacaoID, HorarioPartida) VALUES (2, 102, 2, 2, 3, '2023-08-24 12:10:00');
INSERT INTO Reservas (ReservaID, ClienteID, RotaID, TremID, EstacaoID, HorarioPartida) VALUES (3, 103, 3, 3, 2, '2023-08-24 14:10:00');
-- ----------------------------------------------------------------------------------

-- Lista todas as estações ferroviárias
SELECT * FROM Estacoes;
-- Lista todos os trens e suas informações
SELECT * FROM Trens;


-- Lista todas as rotas e as estações associadas a cada rota
SELECT Rotas.Nome AS Rota, Estacoes.Nome AS Estacao, DetalhesRotas.Sequencia FROM Rotas
JOIN DetalhesRotas ON Rotas.RotaID = DetalhesRotas.RotaID
JOIN Estacoes ON DetalhesRotas.EstacaoID = Estacoes.EstacaoID
ORDER BY Rotas.RotaID, DetalhesRotas.Sequencia; -- ordena os resultados por ID de rota e sequência dos detalhes


-- Lista os horários de chegada e partida de trens em uma estação específica em uma determinada data
SELECT Trens.Nome AS Trem, HorarioChegada AS Chegada, HorarioPartida AS Partida FROM Horarios
JOIN Trens ON Horarios.TremID = Trens.TremID
WHERE Horarios.EstacaoID = 3
    AND DATE(Horarios.HorarioChegada) = '2023-08-24';


-- Listar as reservas de um cliente específico
SELECT Reservas.ReservaID AS Reservas, Trens.Nome AS Nome, Estacoes.Nome AS Estaçoes, Horarios.HorarioPartida as Horarios FROM Reservas
JOIN Trens ON Reservas.TremID = Trens.TremID
JOIN Estacoes ON Reservas.EstacaoID = Estacoes.EstacaoID
JOIN Horarios ON Reservas.RotaID = Horarios.RotaID AND Reservas.TremID = Horarios.TremID AND Reservas.EstacaoID = Horarios.EstacaoID
WHERE Reservas.ClienteID = 101;


