SET default_storage_engine = INNODB;
-- Script de criaçao do banco de dados loja
-- Avaliacao 2 - Banco de Dados/2

CREATE SCHEMA loja;
USE loja;

-- Usuario
CREATE TABLE usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    username VARCHAR(16) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_usuario)
);
INSERT INTO loja.usuario (nome, sobrenome, email, username, senha) VALUES ("Alan", "Brito Delgado", "alanbrito@delgado.com", "alanbrito", "2233"),("Elsa", "Capunta", "elsa@capunta.com", "sacapunta", "1234"),("Elba", "Gallo", "elba@gallo.com", "elbagallo", "1111");

-- Log_acesso_usuarios
CREATE TABLE log_acesso_usuarios (
    id_log_acesso_usuarios INT NOT NULL AUTO_INCREMENT,
    data_hora TIMESTAMP NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY (id_log_acesso_usuarios),
    KEY fk_log_acesso_usuarios_usuario_idx (id_usuario) ,
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);
INSERT INTO loja.log_acesso_usuarios (data_hora, id_usuario) VALUES ('2019-01-04 00:03:37', 3),('2020-11-01 14:41:28', 1),('2019-07-21 04:22:16', 1),('2020-08-17 08:02:46', 1),('2018-10-30 15:35:03', 2),('2019-04-15 19:15:24', 2);

-- Produto
CREATE TABLE produto (
    id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco FLOAT NOT NULL DEFAULT 0.00,
    quantidade INT NOT NULL DEFAULT 0,
    data_criacao TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_produto)
);
INSERT INTO loja.produto (nome, preco, quantidade, data_criacao) VALUES ('Coca Cola', 100, 1000, '2020-12-14 09:56:01'),('Fanta', 100, 1000, '2020-12-14 09:56:01'),('Sprite ', 100, 1000, '2020-12-14 09:56:01'),('Heineken', 200, 2000, '2020-12-14 09:56:01'),('Stella Artois', 250, 2000, '2020-12-14 09:56:01'),('Budweiser', 200, 2000, '2020-12-14 09:56:01');

-- Historico_precos
CREATE TABLE historico_precos (
    id_historico_precos INT NOT NULL AUTO_INCREMENT,
    preco FLOAT NOT NULL,
    data_inicial TIMESTAMP NOT NULL,
    data_final TIMESTAMP NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY (id_historico_precos),
    KEY fk_historico_precos_produto_idx (id_produto) ,
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);

-- Fornecedor
CREATE TABLE fornecedor (
    id_fornecedor INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NULL,
    email VARCHAR(50) NULL,
    PRIMARY KEY (id_fornecedor)
);
INSERT INTO loja.fornecedor (nome, endereco, email) VALUES ('Bebidas SA', 'Agraciada 235', 'bebidasSA@adinet.com.uy');

-- Compra
CREATE TABLE compra (
    id_compra INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(200) NULL,
    data TIMESTAMP NOT NULL,
    id_fornecedor INT NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY (id_compra),
    KEY fk_compras_fornecedor_idx (id_fornecedor),
    KEY fk_compras_usuario_idx (id_usuario),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor (id_fornecedor),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);
INSERT INTO loja.compra (descricao, data, id_fornecedor, id_usuario) VALUES ('Stock inicial', '2020-12-14 09:56:01', 1, 2);

-- Produtos_compra
CREATE TABLE produtos_compra (
    id_compra INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade_produto INT NOT NULL DEFAULT 1,
    preco_compra FLOAT NOT NULL,
    desconto INT NULL,
    valor_total FLOAT NOT NULL,
    PRIMARY KEY (id_compra, id_produto),
    KEY fk_proodutos_compra_compra_idx (id_compra),
    KEY fk_proodutos_compra_produto_idx (id_produto),
    FOREIGN KEY (id_compra) REFERENCES compra (id_compra),
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);
INSERT INTO loja.produtos_compra (id_compra,id_produto,quantidade_produto,preco_compra,desconto,valor_total) VALUES (1,1,1000,80,null,80000),(1,2,1000,80,null,80000),(1,3,1000,80,null,80000),(1,4,1000,160,null,160000),(1,5,1000,190,null,190000),(1,6,1000,160,null,160000);

-- Cliente
CREATE TABLE cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    documento VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_cliente),
    UNIQUE INDEX documento_UNIQUE (documento) 
);
INSERT INTO loja.cliente (nome, sobrenome, documento) VALUES ('Mario', 'Neta', '123456789'),('Caio Rolando', 'da Rocha', '654987234'),('Zacarias', 'Flores del Campo', '85948372');

-- Venda
CREATE TABLE venda (
    id_venda INT NOT NULL AUTO_INCREMENT,
    total FLOAT NOT NULL,
    data TIMESTAMP NOT NULL,
    id_usuario INT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_venda),
    KEY fk_venda_usuario_idx (id_usuario),
    KEY fk_venda_cliente_idx (id_cliente),
    FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);
INSERT INTO loja.venda (total, data, id_usuario, id_cliente) VALUES (500, '2020-12-11 15:48:13', 1, 1),(300, '2020-12-14 09:10:49', 1, 1);

-- Produtos_venda
CREATE TABLE produtos_venda (
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    sequencia INT NOT NULL,
    quantidade_produto INT NOT NULL DEFAULT 1,
    preco_venda FLOAT NOT NULL,
    desconto INT NULL,
    valor_total FLOAT NOT NULL,
    PRIMARY KEY (id_venda, id_produto),
    KEY fk_produtos_venda_venda_idx (id_venda),
    KEY fk_produtos_venda_produto_idx (id_produto),
    FOREIGN KEY (id_venda) REFERENCES venda (id_venda),
    FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);
INSERT INTO loja.produtos_venda (id_venda, id_produto, sequencia, quantidade_produto, preco_venda, desconto, valor_total) 
VALUES (1, 1, 1, 2, 100, NULL, 200),(1, 3, 2, 1, 100, NULL, 100),(1, 4, 3, 1, 200, NULL, 200),(2, 1, 1, 3, 100, NULL, 300);

-- sp_inserir_produto
DELIMITER $$ 
CREATE PROCEDURE sp_inserir_produto(IN produto_nome VARCHAR(50), IN produto_preco VARCHAR(100), IN produto_quantidade INT)
BEGIN 
	INSERT INTO loja.produto (nome,preco,quantidade,data_criacao)VALUES (produto_nome,produto_preco,produto_quantidade,CURRENT_TIMESTAMP);
END$$ 
DELIMITER ;

-- sp_inserir_historico_precos
DELIMITER $$ 
CREATE PROCEDURE sp_inserir_historico_precos(IN historico_precos_preco INT,historico_precos_data_inicial TIMESTAMP, historico_precos_data_final TIMESTAMP, historico_precos_id_produto INT)
BEGIN 
	INSERT INTO loja.historico_precos (preco, data_inicial, data_final, id_produto)VALUES (historico_precos_preco,historico_precos_data_inicial,historico_precos_data_final,historico_precos_id_produto);
END$$ 
DELIMITER ;

-- sp_atualizar_produto
DELIMITER $$ 
CREATE PROCEDURE sp_atualizar_produto(IN produto_id_produto INT,IN produto_nome VARCHAR(50), IN produto_preco VARCHAR(100), IN produto_quantidade INT)
BEGIN 
	SET @produto_preco_ant = (SELECT preco FROM loja.produto WHERE id_produto = produto_id_produto);
    SET @produto_data_inicial_ant = (SELECT data_criacao FROM loja.produto WHERE id_produto = produto_id_produto);
	UPDATE loja.produto SET nome = produto_nome, preco = produto_preco, quantidade = produto_quantidade WHERE id_produto = produto_id_produto;
    INSERT INTO loja.historico_precos (preco, data_inicial, data_final, id_produto) VALUES (@produto_preco_ant,@produto_data_inicial_ant,CURRENT_TIMESTAMP,produto_id_produto);
END$$ 
DELIMITER ;

-- sp_deletar_produto
DELIMITER $$ 
CREATE PROCEDURE sp_deletar_produto(IN produto_id INT)
BEGIN 
	DELETE FROM historico_precos WHERE id_produto = produto_id;
	DELETE FROM produto WHERE id_produto = produto_id;
END$$ 
DELIMITER ;

-- vw_usuarios_atividade
CREATE VIEW vw_usuarios_atividade AS 
SELECT CONCAT_WS(' ',nome,sobrenome) AS nome_completo,username,DATE_FORMAT(data_hora,'%d de %M de %Y - %H:%i') AS horarios
FROM loja.log_acesso_usuarios
JOIN usuario ON log_acesso_usuarios.id_usuario = usuario.id_usuario;

-- sp_retorna_venda_info_por_id
DELIMITER $$ 
CREATE PROCEDURE sp_retorna_venda_info_por_id(IN id_venda_IN INT)
BEGIN 
    SELECT venda.id_venda, total, data, CONCAT_WS(' ',usuario.nome,usuario.sobrenome) AS usuario, 
	CONCAT_WS(' ',cliente.nome,cliente.sobrenome) AS cliente,sequencia,produto.nome,quantidade_produto,preco_venda,desconto,valor_total
	FROM loja.venda
	JOIN produtos_venda ON venda.id_venda = produtos_venda.id_venda
	JOIN usuario ON venda.id_usuario = usuario.id_usuario
	JOIN cliente ON venda.id_cliente = cliente.id_cliente
	JOIN produto ON produtos_venda.id_produto = produto.id_produto
    WHERE venda.id_venda = id_venda_IN;
END$$ 
DELIMITER ;

-- fn_total_compras_cliente_por_id
DELIMITER //
CREATE FUNCTION fn_total_compras_cliente_por_id (codigo_cliente INT)
RETURNS FLOAT  
BEGIN
	RETURN (SELECT SUM(total) FROM venda WHERE venda.id_cliente = codigo_cliente); 
END//
DELIMITER ;

-- sp_retorna_produto_mais_vendido
DELIMITER $$ 
CREATE PROCEDURE sp_retorna_produto_mais_vendido(IN codigo_cliente INT)
BEGIN 
    SELECT produtos_venda.id_produto,SUM(produtos_venda.quantidade_produto) AS quantidade ,SUM(valor_total) AS valor_total,produto.nome,produto.preco 
	FROM produtos_venda
	JOIN produto ON produtos_venda.id_produto = produto.id_produto
	JOIN venda ON produtos_venda.id_venda = venda.id_venda
	JOIN cliente ON venda.id_cliente = cliente.id_cliente
	WHERE venda.id_cliente = codigo_cliente
	GROUP BY produtos_venda.id_produto
	ORDER BY quantidade DESC
	LIMIT 1;
END$$ 
DELIMITER ;
