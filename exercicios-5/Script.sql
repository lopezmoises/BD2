USE trigger_db_example;

CREATE TABLE `it_vendas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome_produto` varchar(50) NOT NULL,
  `Preco` decimal(18,2) NOT NULL,
  `Quantidade` int NOT NULL,
  `Valor_total_item` decimal(18,2) NOT NULL,
  `Vendas_id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Vendas_it_vendas_idx` (`Vendas_Id`),
  CONSTRAINT `fk_Vendas_it_vendas` FOREIGN KEY (`Vendas_Id`) REFERENCES `vendas` (`Id`)
) ;

DELIMITER ;;
CREATE  TRIGGER it_vendas_AFTER_INSERT AFTER INSERT ON `it_vendas` FOR EACH ROW BEGIN
 
 update vendas set vendas.Total = vendas.Total + new.Valor_total_item WHERE vendas.Id = new.Vendas_id;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE TRIGGER it_vendas_AFTER_UPDATE AFTER UPDATE ON `it_vendas` FOR EACH ROW BEGIN

update vendas set vendas.Total = (vendas.Total - old.vendas.Total) + new.vendas.Total WHERE vendas.Id = old.Vendas_id;

END ;;
DELIMITER ;

DELIMITER ;;
CREATE TRIGGER it_vendas_BEFORE_DELETE BEFORE DELETE ON `it_vendas` FOR EACH ROW BEGIN
update vendas set vendas.Total = vendas.Total - old.Valor_total_item WHERE vendas.Id = old.Vendas_id;
END ;;
DELIMITER ;

-------------------------------

DELIMITER $$ 
CREATE PROCEDURE sp_clientes_info()
BEGIN 
	SELECT Id, Nome, Endereco, Telefone  FROM clientes ORDER BY Id;
END$$ 
DELIMITER ;

CALL clientes_info();

--------------------------------

DELIMITER $$ 
CREATE PROCEDURE sp_total_vendas(OUT total_vendas INT)
BEGIN 
    SELECT SUM(Total) INTO total_vendas FROM vendas;
END$$ 
DELIMITER ;

SET @TOTAL = 0;
CALL sp_total_vendas(@TOTAL);
SELECT @TOTAL;
