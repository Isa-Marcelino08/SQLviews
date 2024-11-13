-- CRIACAO DO BANCO DE DADOS --
CREATE DATABASE SistemaRH;
USE SistemaRH;


CREATE TABLE Cargos (
    cargo_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);
-- Criação da tabela Cargos -- 
-- DEFINIU OS ATRIBUTOS --
-- DEFINIU A CHAVE PRIMARIA --

CREATE TABLE Funcionarios (
    funcionario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    cargo_id INT,
    FOREIGN KEY (cargo_id) REFERENCES Cargos(cargo_id)
);

-- CREAÇÃO DA TABELA FUNCIONARIOS-- 
-- ADICIONOU OS ATRIBUTOS --
-- DEFINIU A CHAVE PRIMARIA --
-- DEFINE CARGO_ID COMO CHAVE ESTRANGEIRA E REFERECIA A COLUNA_ID--

  CREATE TABLE Salarios (
    salario_id INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_id INT,
    salario DECIMAL(10, 2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    FOREIGN KEY (funcionario_id) REFERENCES Funcionarios(funcionario_id)
);

-- CREAÇÃO DA TABELA SALARIOS-- 
-- ADICIONOU OS ATRIBUTOS --
-- DEFINIU A CHAVE PRIMARIA --
-- DEFINE FUNCIONARIO_ID COMO CHAVE ESTRANGEIRA E REFERECIA A COLUNA FUNCIONARIOS --



INSERT INTO Cargos (nome)
 VALUES 
('Secretário'), 
('Analista de RH'), 
('Contador');
-- INSERE OS DADOS NA COLUNA CARGOS--

INSERT INTO Funcionarios (nome, sobrenome, data_nascimento, telefone, cargo_id)
VALUES 
('João', 'Silva', '1985-01-15', '1111-1111', 1),
('Maria', 'Oliveira', '1990-05-25', '2222-2222', 2),
('Ana', 'Souza', '1982-03-30', '3333-3333', 3);
-- INSERE OS DADOS NA COLUNA FUNCIONARIOS--

INSERT INTO Salarios (funcionario_id, salario, data_inicio)
VALUES
(1, 5000.00, '2023-01-01'),
(2, 4500.00, '2023-01-01'),
(3, 5500.00, '2023-01-01');
-- INSERE OS DADOS NA COLUNA SALARIOS--

CREATE VIEW Detalhes_Funcionarios_Simples AS  -- NÃO ARMAZENA DADOS APENAS PERMITE QUE VOCÊ CONSULTE OS DADOS"
SELECT 
    f.nome, 
    f.sobrenome,
    c.nome AS cargo, 
    s.salario
FROM 
    Funcionarios f
JOIN 
    Cargos c ON f.cargo_id = c.cargo_id
    -- VINCULA AS TABELAS ONDE OS DADOS DA COLUNA CARGO_ID SÃO IGUAIS-
JOIN 
    Salarios s ON f.funcionario_id = s.funcionario_id
    -- VINCULA AS TABELAS ONDE OS DADOS DA COLUNA FUNCIONARIOS_ID SÃO IGUAIS-
WHERE 
    s.data_fim IS NULL;
    -- SELECIONA APENAS AS LINHAS SÃO NULLS

select * FROM Detalhes_Funcionarios_Simples

-- CREA UMA VIEW Detalhes_Funcionarios_Simples --
-- SELECIONA A TABELA FUNCIONARIOS -- 
-- Define a tabela Funcionarios como a tabela base da consulta- 
-- UTILIZA O JOIN PARA FAZER JUNÇAO DAS TABELAS --
-- UTILIZA O ON PARA DEFINIR A CONDIÇÃO PARA COMBINAR AS TABELAS--
-- UTILIZA O WHERE PARA FILTRAR OS RESULTADOS ONDE A COLUNA É NULA-- 






