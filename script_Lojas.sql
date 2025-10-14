CREATE SCHEMA IF NOT EXISTS `Lojas` DEFAULT CHARACTER SET utf8mb4;
USE `Lojas`;

-- -----------------------------------------------------
-- Tabela `Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lojas`.`Produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NULL,
  `preco` DECIMAL(10, 2) NOT NULL,
  `tipo` ENUM('Usado', 'Liquidacao', 'Promocao', 'Outros') NULL,
  `categoria` SET('Eletronico', 'Telefonia', 'Informatica', 'Eletrodomesticos', 'Acessorios', 'Outros') NULL,
  `data_de_lancamento` DATE NULL,
  `desconto` DECIMAL(5, 2) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela `Caracteristica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lojas`.`Caracteristica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela de ligação: `Produto_Caracteristica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lojas`.`Produto_Caracteristica` (
  `Produtos_id` INT NOT NULL,
  `Caracteristica_id` INT NOT NULL,
  PRIMARY KEY (`Produtos_id`, `Caracteristica_id`),
  CONSTRAINT `fk_Produto_Caracteristica_Produtos`
    FOREIGN KEY (`Produtos_id`)
    REFERENCES `Lojas`.`Produtos` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_Caracteristica_Caracteristica`
    FOREIGN KEY (`Caracteristica_id`)
    REFERENCES `Lojas`.`Caracteristica` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela `Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lojas`.`Loja` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(255) NULL,
  `numero_telefone` VARCHAR(20) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Tabela `Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lojas`.`Estoque` (
  `Produtos_id` INT NOT NULL,
  `Loja_id` INT NOT NULL,
  `quantidade` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`Produtos_id`, `Loja_id`),
  CONSTRAINT `fk_Estoque_Produtos`
    FOREIGN KEY (`Produtos_id`)
    REFERENCES `Lojas`.`Produtos` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estoque_Loja`
    FOREIGN KEY (`Loja_id`)
    REFERENCES `Lojas`.`Loja` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
) ENGINE = InnoDB;




