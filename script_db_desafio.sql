-- MySQL Workbench
-- Script for creating MySQL db and schemas
-- Éverton Bin | Desafio 2 - Bootcamp Cientista de Dados IGTI

-- -----------------------------------------------------
-- Schema db_desafio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_desafio` DEFAULT CHARACTER SET utf8mb4;
USE `db_desafio` ;


-- -----------------------------------------------------
-- Table `db_desafio`.`tb_estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_estado` (
  `id` INT,
  `sigla` CHAR(2),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_desafio`.`tb_cor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_cor` (
  `id` INT,
  `cor` VARCHAR(45),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_desafio`.`tb_tiposanguineo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_tiposanguineo` (
  `id` INT,
  `tipo` CHAR(3),
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_desafio`.`tb_cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_cidade` (
  `id` INT,
  `nome` VARCHAR(45),
  `id_estado` INT,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cidade_estado`
    FOREIGN KEY (`id_estado`)
    REFERENCES `db_desafio`.`tb_estado` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_desafio`.`tb_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_desafio`.`tb_pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45),
  `idade` INT,
  `data_nasc` DATETIME,
  `sexo` CHAR(1),
  `signo` VARCHAR(45),
  `altura` FLOAT,
  `peso` FLOAT,
  `id_cidade` INT,
  `id_cor` INT,
  `id_tiposanguineo` INT,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pessoa_cidade`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `db_desafio`.`tb_cidade` (`id`),
  CONSTRAINT `fk_pessoa_cor`
    FOREIGN KEY (`id_cor`)
    REFERENCES `db_desafio`.`tb_cor` (`id`),
  CONSTRAINT `fk_pessoa_tiposanguineo`
    FOREIGN KEY (`id_tiposanguineo`)
    REFERENCES `db_desafio`.`tb_tiposanguineo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


COMMIT;
