create database mercadinho;
use mercadinho;
create table Cliente(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(40),
    email varchar(300) unique,
    senha varchar(200)
);
CREATE TABLE Categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) UNIQUE
);
CREATE TABLE Produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10,2),
    estoque INT,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);
CREATE TABLE Venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);
CREATE TABLE ItemVenda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (venda_id) REFERENCES Venda(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);
CREATE TABLE Carrinho (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);
CREATE TABLE ItemCarrinho (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carrinho_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (carrinho_id) REFERENCES Carrinho(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

-- Inserindo categorias
INSERT INTO Categoria (nome) VALUES ('Hortifruti'), ('Bebidas'), ('Padaria');

-- Inserindo um cliente
INSERT INTO Cliente (nome, email, senha, cpf, telefone)
VALUES ('João Silva', 'joao@email.com', 'senha123', '12345678900', '(11)91234-5678');

-- Inserindo produtos
INSERT INTO Produto (nome, descricao, preco, estoque, categoria_id)
VALUES ('Maçã', 'Maçã vermelha', 4.50, 100, 1);
