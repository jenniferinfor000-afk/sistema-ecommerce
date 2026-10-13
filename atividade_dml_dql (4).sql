-- ATIVIDADE DML E DQL - E-COMMERCE
-- Script para MySQL; execute em um banco de testes.

CREATE DATABASE IF NOT EXISTS ecommerce_atividade;
USE ecommerce_atividade;

CREATE TABLE IF NOT EXISTS CATEGORIA (
  id_categoria INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS PRODUTO (
  id_produto INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255),
  preco DECIMAL(10,2) NOT NULL,
  estoque INT NOT NULL,
  id_categoria INT NOT NULL,
  FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

-- 8 INSERTS individuais para categorias
INSERT INTO CATEGORIA VALUES (1, 'Eletronicos', 'Produtos eletronicos');
INSERT INTO CATEGORIA VALUES (2, 'Informatica', 'Produtos de informatica');
INSERT INTO CATEGORIA VALUES (3, 'Roupas', 'Roupas para diversas ocasioes');
INSERT INTO CATEGORIA VALUES (4, 'Calcados', 'Calcados diversos');
INSERT INTO CATEGORIA VALUES (5, 'Livros', 'Livros de diferentes assuntos');
INSERT INTO CATEGORIA VALUES (6, 'Acessorios', 'Acessorios diversos');
INSERT INTO CATEGORIA VALUES (7, 'Casa', 'Produtos para casa');
INSERT INTO CATEGORIA VALUES (8, 'Escritorio', 'Produtos para escritorio');

-- Categorias 1 a 6: pelo menos 2 produtos cada
INSERT INTO PRODUTO VALUES (1, 'Celular', 'Smartphone', 1500.00, 20, 1);
INSERT INTO PRODUTO VALUES (2, 'Televisao', 'Smart TV', 2500.00, 10, 1);
INSERT INTO PRODUTO VALUES (3, 'Notebook', 'Notebook para estudos', 3200.00, 15, 2);
INSERT INTO PRODUTO VALUES (4, 'Teclado', 'Teclado para computador', 120.00, 30, 2);
INSERT INTO PRODUTO VALUES (5, 'Camiseta', 'Camiseta casual', 50.00, 40, 3);
INSERT INTO PRODUTO VALUES (6, 'Calca', 'Calca jeans', 100.00, 25, 3);
INSERT INTO PRODUTO VALUES (7, 'Tenis', 'Tenis casual', 200.00, 18, 4);
INSERT INTO PRODUTO VALUES (8, 'Sandalia', 'Sandalia feminina', 80.00, 22, 4);
INSERT INTO PRODUTO VALUES (9, 'Livro de Java', 'Livro de programacao Java', 90.00, 12, 5);
INSERT INTO PRODUTO VALUES (10, 'Livro de SQL', 'Livro sobre banco de dados', 75.00, 16, 5);
INSERT INTO PRODUTO VALUES (11, 'Mochila', 'Mochila escolar', 130.00, 14, 6);
INSERT INTO PRODUTO VALUES (12, 'Relogio', 'Relogio de pulso', 180.00, 9, 6);

-- Categoria 7: pelo menos 4 produtos
INSERT INTO PRODUTO VALUES (13, 'Mesa', 'Mesa para sala', 450.00, 8, 7);
INSERT INTO PRODUTO VALUES (14, 'Cadeira', 'Cadeira para sala', 180.00, 20, 7);
INSERT INTO PRODUTO VALUES (15, 'Sofa', 'Sofa para sala de estar', 1800.00, 5, 7);
INSERT INTO PRODUTO VALUES (16, 'Estante', 'Estante para organizacao', 600.00, 7, 7);
-- Categoria 8 nao possui produtos.

-- DQL: consultas
SELECT * FROM CATEGORIA;
SELECT * FROM PRODUTO;

SELECT nome, preco FROM PRODUTO WHERE preco > 100;
SELECT nome, estoque FROM PRODUTO WHERE estoque > 0;

-- INNER JOIN: produtos e categorias
SELECT p.nome AS produto, c.nome AS categoria, p.preco
FROM PRODUTO p
INNER JOIN CATEGORIA c ON p.id_categoria = c.id_categoria;

-- LEFT JOIN: inclui categoria sem produtos
SELECT c.id_categoria, c.nome AS categoria, p.nome AS produto
FROM CATEGORIA c
LEFT JOIN PRODUTO p ON c.id_categoria = p.id_categoria
ORDER BY c.id_categoria;

-- Contagem de produtos por categoria, incluindo zero
SELECT c.nome AS categoria, COUNT(p.id_produto) AS quantidade_produtos
FROM CATEGORIA c
LEFT JOIN PRODUTO p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY c.id_categoria;

-- Categorias com dois ou mais produtos
SELECT c.nome AS categoria, COUNT(p.id_produto) AS quantidade_produtos
FROM CATEGORIA c
INNER JOIN PRODUTO p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nome
HAVING COUNT(p.id_produto) >= 2;

SELECT COUNT(*) AS total_produtos FROM PRODUTO;
SELECT AVG(preco) AS preco_medio FROM PRODUTO;
