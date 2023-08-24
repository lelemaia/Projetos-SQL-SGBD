-- criando um esquema:
CREATE SCHEMA CLUBE_DO_LIVRO;

# -------------------------------------------------------------------------------------------------------------------------------------
-- criando as tabelas:

CREATE TABLE LIVROS (
    ID_LIVRO INT NOT NULL,
    NOME_LIVRO VARCHAR(100) NOT NULL,
    AUTORIA VARCHAR(100) NOT NULL,
    EDITORA VARCHAR(100) NOT NULL,
    CATEGORIA VARCHAR(100) NOT NULL,
    PRECO DECIMAL(5,2) NOT NULL,  
 PRIMARY KEY (ID_LIVRO)
);

CREATE TABLE ESTOQUE (
    ID_LIVRO INT NOT NULL,
    QTD_ESTOQUE INT NOT NULL,
 PRIMARY KEY (ID_LIVRO)
);

CREATE TABLE VENDAS (
    ID_PEDIDO INT NOT NULL,
    ID_VENDEDOR INT NOT NULL,
    ID_LIVRO INT NOT NULL,
    QTD_VENDIDA INT NOT NULL,
    DATA_VENDA DATE NOT NULL,
    PRIMARY KEY (ID_VENDEDOR , ID_PEDIDO)
);
CREATE TABLE VENDEDORES (
    ID_VENDEDOR INT NOT NULL,
    NOME_VENDEDOR VARCHAR(255) NOT NULL,
 PRIMARY KEY (ID_VENDEDOR)
);
-- como excluir uma tabela:
 -- DROP TABLE VENDEDORES;

# -------------------------------------------------------------------------------------------------------------------------------------
-- criando relacao entre as tabelas:

-- para fazer a relacao entre as tabelas, precisa declarar a chave estrangeira (FK) (alterando assim a tabela ja criada anteriormente)
-- para alterar uma tabela, usa o comando ALTER TABLE, em seguida declara qual tabela vai alterar:

ALTER TABLE ESTOQUE ADD CONSTRAINT CE_ESTOQUE_LIVROS  -- adicionando uma restricao (nome aleatorio)
FOREIGN KEY (ID_LIVRO)                             -- declarando a chave estrangeira q e o ID_LIVRO
REFERENCES LIVROS (ID_LIVRO)     -- fazendo referencia a qual tabela a tab estoque esta relacionada
ON DELETE NO ACTION   
ON UPDATE NO ACTION;   -- gera um erro ao alterar um livro que estiver na tabela estoque, mas nao estiver registrado na tabela Livros

ALTER TABLE VENDAS ADD CONSTRAINT CE_VENDAS_LIVROS
FOREIGN KEY (ID_LIVRO)
REFERENCES LIVROS (ID_LIVRO)
ON DELETE NO ACTION
ON UPDATE NO ACTION; 

ALTER TABLE VENDAS ADD CONSTRAINT CE_VENDAS_VENDEDORES
FOREIGN KEY (ID_VENDEDOR)
REFERENCES VENDEDORES (ID_VENDEDOR)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

# -------------------------------------------------------------------------------------------------------------------------------------
-- desativando a FK:

-- podemos comecar a inserir dados por qualquer tabela, desde que a relacao entre essas duas tabelas esteja desativada, ou seja:
-- a chave estrangeira nao esteja mais ligando uma tabela a outra. para fazer isso, usa-se o comando:

SET FOREIGN_KEY_CHECKS = 0;   -- ele desativa as restricoes de chave estrangeira e agora as tabelas nao estao mais relacionadas   
 
# -------------------------------------------------------------------------------------------------------------------------------------
-- inserindo dados:

INSERT INTO LIVROS VALUES (  -- para inserir os valores usei o comando Values
 1,
'Percy Jackson e o Ladrao de Raios',
'Rick Riordan',
'Intrinseca',
'Aventura',
34.45
);

-- podemos otimizar este processo, inserindo multiplas linhas de dados em uma unica execucao:

INSERT INTO LIVROS VALUES
(2, 'A Volta ao Mundo em 80 Dias', 'Julio Verne', 'Principis', 'Aventura', 21.99),
(3, 'O Cortico', 'Aluisio de Azevedo', 'Panda Books', 'Romance', 47.8),
(4, 'Dom Casmurro', 'Machado de Assis', 'Via Leitura', 'Romance', 19.90),
(5, 'Memorias Postumas de Bras Cubas', 'Machado de Assis', 'Antofagica', 'Romance', 45),
(6, 'Quincas Borba', 'Machado de Assis', 'L&PM Editores', 'Romance', 48.5),
(7, 'Icaro', 'Gabriel Pedrosa', 'Atelie', 'Poesia', 36),
(8, 'Os Lusiadas', 'Luis Vaz de Camoes', 'Montecristo', 'Poesia', 18.79),
(9, 'Outros Jeitos de Usar a Boca', 'Rupi Kaur', 'Planeta', 'Poesia',  34.8);

-- inserindo informacoes da tabela VENDEDORES
INSERT INTO VENDEDORES 
VALUES
(1,'Paula Rabelo'),
(2,'Juliana Macedo'),
(3,'Roberto Barros'),
(4,'Barbara Jales');

-- inserindo informacoes da tabela VENDAS
INSERT INTO VENDAS 
VALUES 
(1, 3, 7, 1, '2020-11-02'),
(2, 4, 8, 2, '2020-11-02'),
(3, 4, 4, 3, '2020-11-02'),
(4, 1, 7, 1, '2020-11-03'),
(5, 1, 6, 3, '2020-11-03'),
(6, 1, 9, 2, '2020-11-04'),
(7, 4, 1, 3, '2020-11-04'),
(8, 1, 5, 2, '2020-11-05'),
(9, 1, 2, 1, '2020-11-05'),
(10, 3, 8, 2, '2020-11-11'),
(11, 1, 1, 4, '2020-11-11'),
(12, 2, 10, 10, '2020-11-11'),
(13, 1, 12, 5, '2020-11-18'),
(14, 2, 4, 1, '2020-11-25'),
(15, 3, 13, 2,'2021-01-05'),
(16, 4, 13, 1, '2021-01-05'),
(17, 4, 4, 3, '2021-01-06'),
(18, 2, 12, 2, '2021-01-06');

-- inserindo informacoes da tabela ESTOQUE
INSERT INTO ESTOQUE 
VALUES
(1,  7),
(2,  10),
(3,  2),
(8,  4),
(10, 5),
(11, 3),
(12, 3);

-- inserindo dados fora de ordem:
-- e possivel inserir fora de ordem, mas e preciso declarar a ordem desejada, e essa ordem deve ser declarada antes do comando Values:

INSERT INTO LIVROS 
(CATEGORIA, AUTORIA, NOME_LIVRO, EDITORA, ID_LIVRO, PRECO)
VALUES
('Biografia' , 'Malala Yousafzai', 'Eu sou Malala', 'Companhia das Letras', 11, 22.32),
('Biografia' , 'Michelle Obama', 'Minha historia', 'Objetiva', 12, 57.90),
('Biografia' , 'Anne Frank', 'Diario de Anne Frank', 'Pe Da Letra', 13, 34.90);

# -------------------------------------------------------------------------------------------------------------------------------------
-- consultando dados especificos:

-- para selecionar todas as informacoes de uma tabela, use o comando:
SELECT * FROM LIVROS;            -- selecionou todas as linhas e colunas da tabela Livros

-- para selecionar um campo ainda mais especifico, substitui o * pelo nome do campo:
SELECT NOME_LIVRO FROM LIVROS;   -- vai aparecer somente os nomes de livros que tem na tabela "Livros".

-- para selecionar um campo "como um apelido":
SELECT ID_LIVRO AS "Codigo do Livro" FROM LIVROS;  -- ao inves de o cabecalho ser ID_LIVRO, vai aparecer o apelido: codigo do Livro

#--------------------------------------------------------------------------------------------------------------------------------------
-- filtrando dados:

-- para filtrar use o comando WHERE:
SELECT * FROM LIVROS
WHERE CATEGORIA = "BIOGRAFIA";   -- vai mostrar somente a categoria biografia

-- para adicionar mais um filtro, usa-se o comando AND:
SELECT * FROM LIVROS
WHERE CATEGORIA = "ROMANCE"  AND PRECO < 48;  -- vai mostrar somente a categoria romance e q custa menos de 48 r$

-- para filtrar dados que nao quero, use o comando AND NOT:
SELECT * FROM LIVROS
WHERE CATEGORIA = "POESIA" AND NOT (AUTORIA = "Luis Vaz de Camoes" OR AUTORIA = "Gabriel Pedrosa");  -- OR = ou
-- vai mostrar somente a categoria "poesia" e q nao seja dos autores nao solicitados

#--------------------------------------------------------------------------------------------------------------------------------------
-- selecao distinta:
-- para fazer uma selecao unica (sem repeticao), use o comando DISTINCT:

SELECT DISTINCT ID_LIVRO FROM VENDAS   -- seleciona o id dos livros da tabela Vendas (sem repetir)
WHERE ID_VENDEDOR = 1        -- onde os livros vendidos pelo vendedor de id= 1  (filtrando)
ORDER BY ID_LIVRO;           -- vao ser ordenados pelo id dos livros  (ordenando)

#--------------------------------------------------------------------------------------------------------------------------------------
-- alterando informacoes:

-- para deletar uma linha, use o comando DELETE:
SELECT * FROM LIVROS;
DELETE FROM LIVROS WHERE ID_LIVRO = 8;

-- para alterar dados de uma coluna na tabela, use o comando UPDATE e SET:
UPDATE LIVROS SET PRECO = 0.9*PRECO;  -- vai mostrar o preco dos livros atualizados

#--------------------------------------------------------------------------------------------------------------------------------------
-- filtro usando duas tabelas: 
-- para unir dados de duas tabelas diferentes (criar uma nova tabela):

SELECT VENDAS.ID_VENDEDOR, VENDEDORES.NOME_VENDEDOR, SUM(VENDAS.QTD_VENDIDA) -- seleciona a origem dos campos solicitados e soma (QTD_)
FROM VENDAS, VENDEDORES       -- selecionando as tabelas q serao consultadas (VENDAS, VENDEDORES)
WHERE VENDAS.ID_VENDEDOR = VENDEDORES.ID_VENDEDOR -- declarando e definindo a relacao das tabelas
GROUP BY VENDAS.ID_VENDEDOR;                -- vai agrupar (juntar) as vendas pelo id do vendedor


-- inner join: 
-- mesma coisa do de cima, acrescente o inner join ao inves da virgula, e o ON ao inves de WHERE

SELECT VENDAS.ID_VENDEDOR, VENDEDORES.NOME_VENDEDOR, SUM(VENDAS.QTD_VENDIDA) 
FROM VENDAS INNER JOIN VENDEDORES      -- selecionando (juntando) as tabelas q serao consultadas
ON VENDAS.ID_VENDEDOR = VENDEDORES.ID_VENDEDOR   -- declarando e definindo a relacao das tabelas
GROUP BY VENDAS.ID_VENDEDOR;               -- vai agrupar (juntar) as vendas pelo id do vendedor


-- left join:
-- serve para incluir os dados da tabela da esquerda, mesmo se nao houver valores correspondentes na tabela a direita

SELECT VENDAS.ID_LIVRO, LIVROS.NOME_LIVRO, VENDAS.QTD_VENDIDA    
FROM LIVROS LEFT JOIN VENDAS       -- vai manter todos os livros da tabela a esquerda
ON LIVROS.ID_LIVRO = VENDAS.ID_LIVRO;


-- right join:
-- serve para incluir todos os dados da tabela da direita, mesmo se nao houver valores correspondentes na tabela a  esquerda

SELECT VENDAS.ID_LIVRO, LIVROS.NOME_LIVRO, VENDAS.QTD_VENDIDA 
FROM LIVROS RIGHT JOIN VENDAS        -- vai manter todas as vendas da tabela a direita
ON LIVROS.ID_LIVRO = VENDAS.ID_LIVRO;

#--------------------------------------------------------------------------------------------------------------------------------------
