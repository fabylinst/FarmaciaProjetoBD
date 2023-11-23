-- Tabela de Cliente
CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

-- Tabela de Produto
CREATE TABLE produto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco NUMERIC(10, 2) NOT NULL,
    quantidade INTEGER NOT NULL
);

CREATE TABLE estoque (
    id SERIAL PRIMARY KEY,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- Tabela de Venda
CREATE TABLE venda (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    data DATE NOT NULL,
    valor_total NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);


-- Inserção de Dados na Tabela "cliente"
INSERT INTO cliente (nome, email, telefone, endereco) VALUES
('Maria Silva', 'maria.silva@gmail.com', '(11) 9999-9999', 'Rua A, 123'),
('José Santos', 'jose.santos@yahoo.com.br', '(21) 8888-8888', 'Avenida B, 456'),
('Ana Ferreira', 'ana.ferreira@hotmail.com', '(31) 7777-7777', 'Rua C, 789'),
('Carlos Lima', 'carlos.lima@gmail.com', '(41) 6666-6666', 'Rua D, 321'),
('Fernanda Oliveira', 'fernanda.oliveira@yahoo.com.br', '(51) 5555-5555', 'Avenida E, 654');

-- Inserção de Dados na Tabela "produto"
INSERT INTO produto (nome, descricao, preco, quantidade) VALUES
('Paracetamol', 'Analgésico e antitérmico', 15.99, 100),
('Amoxicilina', 'Antibiótico', 25.99, 50),
('Atorvastatina', 'Estatina para redução de colesterol', 39.99, 30),
('Dipirona', 'Analgésico e antipirético', 10.99, 80),
('Omeprazol', 'Inibidor de bomba de prótons', 29.99, 40);

-- Inserção de Dados na Tabela "estoque"
INSERT INTO estoque (produto_id, quantidade) VALUES
(1, 50),
(2, 25),
(3, 15),
(4, 60),
(5, 35);

-- Inserção de Dados na Tabela "venda"
INSERT INTO venda (cliente_id, produto_id, data, valor_total) VALUES
(1, 1, '2022-04-01', 15.99),
(2, 2, '2022-04-02', 25.99),
(3, 3, '2022-04-03', 39.99),
(4, 4, '2022-04-04', 10.99),
(5, 5, '2022-04-05', 29.99);

-- Consulta para obter informações sobre os clientes
SELECT * FROM cliente;

-- Consulta para obter informações sobre os produtos
SELECT * FROM produto;

-- Consulta para obter informações sobre o estoque
SELECT * FROM estoque;

-- Consulta para obter informações sobre as vendas
SELECT * FROM venda;

-- Consulta para obter detalhes de uma venda específica com informações do cliente e produto
SELECT v.id AS venda_id, c.nome AS cliente_nome, p.nome AS produto_nome, v.data, v.valor_total
FROM venda v
JOIN cliente c ON v.cliente_id = c.id
JOIN produto p ON v.produto_id = p.id
WHERE v.id = 1;
