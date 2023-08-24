create schema banco;

-- Tabela de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(14) UNIQUE,
    Endereco VARCHAR(200),
    DataNascimento DATE
);

-- Tabela de Contas Bancárias
CREATE TABLE Contas (
    ContaID INT PRIMARY KEY,
    ClienteID INT,
    Saldo DECIMAL(10, 2),
    DataAbertura DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Tabela de Transações
CREATE TABLE Transacoes (
    TransacaoID INT PRIMARY KEY,
    ContaID INT,
    Valor DECIMAL(10, 2),
    DataHora DATETIME,
    FOREIGN KEY (ContaID) REFERENCES Contas(ContaID)
);

-- Tabela de Funcionários
CREATE TABLE Funcionarios (
    FuncionarioID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cargo VARCHAR(50),
    DataContratacao DATE
);


-- Inserindo dados de exemplo na tabela Clientes
INSERT INTO Clientes (ClienteID, Nome, CPF, Endereco, DataNascimento) VALUES (1, 'João Silva', '123.456.789-01', 'Rua A, 123', '1990-05-15'); 
INSERT INTO Clientes (ClienteID, Nome, CPF, Endereco, DataNascimento) VALUES (2, 'Maria Oliveira', '987.654.321-02', 'Avenida B, 456', '1985-09-20'); 
INSERT INTO Clientes (ClienteID, Nome, CPF, Endereco, DataNascimento) VALUES (3, 'Carlos Santos', '456.789.123-03', 'Praça C, 789', '1995-02-10'); 
INSERT INTO Clientes (ClienteID, Nome, CPF, Endereco, DataNascimento) VALUES (4, 'Ana Ferreira', '789.123.456-04', 'Rua D, 567', '2000-11-30'); 
INSERT INTO Clientes (ClienteID, Nome, CPF, Endereco, DataNascimento) VALUES (5, 'Pedro Souza', '654.321.987-05', 'Avenida E, 678', '1988-07-05');

-- Inserindo dados de exemplo na tabela Contas
INSERT INTO Contas (ContaID, ClienteID, Saldo, DataAbertura) VALUES (1001, 1, 5000.00, '2023-01-10');
INSERT INTO Contas (ContaID, ClienteID, Saldo, DataAbertura) VALUES (1002, 2, 8000.00, '2022-11-20');
INSERT INTO Contas (ContaID, ClienteID, Saldo, DataAbertura) VALUES (1003, 3, 15000.00, '2021-03-05');
INSERT INTO Contas (ContaID, ClienteID, Saldo, DataAbertura) VALUES (1004, 4, 3000.00, '2023-06-15');
INSERT INTO Contas (ContaID, ClienteID, Saldo, DataAbertura) VALUES (1005, 5, 10000.00, '2022-09-30');

-- Inserindo dados de exemplo na tabela Transacoes
INSERT INTO Transacoes (TransacaoID, ContaID, Valor, DataHora) VALUES (2001, 1001, 1000.00, '2023-08-01 10:30:00');
INSERT INTO Transacoes (TransacaoID, ContaID, Valor, DataHora) VALUES (2002, 1003, -500.00, '2023-08-02 14:15:00');
INSERT INTO Transacoes (TransacaoID, ContaID, Valor, DataHora) VALUES (2003, 1002, 1500.00, '2023-08-03 09:45:00');
INSERT INTO Transacoes (TransacaoID, ContaID, Valor, DataHora) VALUES (2004, 1004, -200.00, '2023-08-04 11:00:00');
INSERT INTO Transacoes (TransacaoID, ContaID, Valor, DataHora) VALUES (2005, 1005, 300.00, '2023-08-05 16:20:00');

-- Inserindo dados de exemplo na tabela Funcionarios
INSERT INTO Funcionarios (FuncionarioID, Nome, Cargo, DataContratacao) VALUES (3001, 'Ana Santos', 'Atendente', '2022-03-20');
INSERT INTO Funcionarios (FuncionarioID, Nome, Cargo, DataContratacao) VALUES (3002, 'Marcos Silva', 'Gerente', '2020-01-15');
INSERT INTO Funcionarios (FuncionarioID, Nome, Cargo, DataContratacao) VALUES (3003, 'Julia Souza', 'Caixa', '2021-06-10');
INSERT INTO Funcionarios (FuncionarioID, Nome, Cargo, DataContratacao) VALUES (3004, 'Lucas Oliveira', 'Atendente', '2023-04-05');
INSERT INTO Funcionarios (FuncionarioID, Nome, Cargo, DataContratacao) VALUES (3005, 'Renata Ferreira', 'Gerente', '2019-09-25');

-- Consulta 1: Obter o nome e o saldo de todas as contas
SELECT Clientes.ClienteID, Clientes.Nome, COALESCE(SUM(Transacoes.Valor), 0)
FROM Clientes
LEFT JOIN Contas ON Clientes.ClienteID = Contas.ClienteID
LEFT JOIN Transacoes ON Contas.ContaID = Transacoes.ContaID
GROUP BY Clientes.ClienteID, Clientes.Nome;

-- Consulta 2: Mostrar os nomes dos clientes que possuem mais de uma conta
SELECT Clientes.Nome FROM Clientes
JOIN Contas ON Clientes.ClienteID = Contas.ClienteID
GROUP BY Clientes.ClienteID, Clientes.Nome
HAVING COUNT(Contas.ContaID) > 1;

-- Consulta 3: Exibir o saldo atual de uma conta específica
SELECT Clientes.ClienteID, Clientes.Nome, Contas.Saldo FROM Clientes
JOIN Contas ON Clientes.ClienteID = Contas.ClienteID
WHERE Contas.ContaID = 1003;

-- Consulta 4: Listar as transações de uma conta específica
SELECT Transacoes.TransacaoID, Transacoes.Valor, Transacoes.DataHora FROM Transacoes
JOIN Contas ON Transacoes.ContaID = Contas.ContaID
WHERE Contas.ContaID = 1001;

-- Consulta 5: Mostrar os nomes dos funcionários contratados antes de 2020
SELECT Funcionarios.Nome, Funcionarios.DataContratacao FROM Funcionarios
WHERE Funcionarios.DataContratacao < '2020-01-01';



