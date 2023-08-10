-- MySQL Script generated by MySQL Workbench
-- Wed Aug  9 11:35:32 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oficina_db
-- -----------------------------------------------------
-- Modelagem experiimental de um banco de dados para oficina mecânica automotiva.
DROP SCHEMA IF EXISTS `oficina_db` ;

-- -----------------------------------------------------
-- Schema oficina_db
--
-- Modelagem experiimental de um banco de dados para oficina mecânica automotiva.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `oficina_db` ;

-- -----------------------------------------------------
-- Table `oficina_db`.`Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina_db`.`Funcionario` ;

CREATE TABLE IF NOT EXISTS `oficina_db`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `NomeFuncionario` VARCHAR(144) NULL,
  `FuncaoFuncionario` VARCHAR(45) NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_db`.`Veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina_db`.`Veiculo` ;

CREATE TABLE IF NOT EXISTS `oficina_db`.`Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `PlacaVeiculo` VARCHAR(9) NULL,
  `MarcaVeiculo` VARCHAR(15) NOT NULL,
  `ModeloVeiculo` VARCHAR(15) NULL,
  `AnoVeiculo` INT NULL,
  `MotorizacaoVeiculo` VARCHAR(45) NULL,
  `CorVeiculo` VARCHAR(12) NULL,
  `QuilometragemVeiculo` FLOAT NULL,
  `NomeResponsavel` VARCHAR(45) NULL,
  `TelefoneResponsavel` CHAR(11) NULL,
  PRIMARY KEY (`idVeiculo`),
  INDEX `placa_idx` (`PlacaVeiculo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_db`.`Orcamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina_db`.`Orcamento` ;

CREATE TABLE IF NOT EXISTS `oficina_db`.`Orcamento` (
  `idOrcamento` INT NOT NULL AUTO_INCREMENT,
  `idResponsavel_fk` INT NOT NULL,
  `idVeiculo_fk` INT NOT NULL,
  `Descricao` VARCHAR(100) NULL,
  `DataInicio` DATE NULL,
  `DataTermino` DATE NULL,
  `Valor` FLOAT NULL,
  `Aprova` ENUM('S', 'N') NULL DEFAULT NULL,
  `FormaPagamento` ENUM('PIX', 'Credito') NULL DEFAULT 'Credito',
  PRIMARY KEY (`idOrcamento`, `idResponsavel_fk`, `idVeiculo_fk`),
  INDEX `fk_funcionario_idx` (`idResponsavel_fk` ASC) VISIBLE,
  INDEX `fk_veiculo_idx` (`idVeiculo_fk` ASC) VISIBLE,
  CONSTRAINT `fk_funcionario`
    FOREIGN KEY (`idResponsavel_fk`)
    REFERENCES `oficina_db`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculo`
    FOREIGN KEY (`idVeiculo_fk`)
    REFERENCES `oficina_db`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_db`.`Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina_db`.`Produto` ;

CREATE TABLE IF NOT EXISTS `oficina_db`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `NomeProduto` VARCHAR(45) NULL,
  `CustoProduto` FLOAT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_db`.`Servico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina_db`.`Servico` ;

CREATE TABLE IF NOT EXISTS `oficina_db`.`Servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `DescricaoServico` VARCHAR(65) NULL,
  `CustoServico` FLOAT NULL,
  `HorasServico` INT NULL,
  `CategoriaServico` ENUM('Mecanica', 'Funilaria', 'Eletrica', 'Rodas', 'Freios', 'Suspensao') NOT NULL,
  PRIMARY KEY (`idServico`),
  INDEX `categoriaservico_idx` (`CategoriaServico` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_db`.`Peca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina_db`.`Peca` ;

CREATE TABLE IF NOT EXISTS `oficina_db`.`Peca` (
  `idPeca` INT NOT NULL AUTO_INCREMENT,
  `NomePeca` VARCHAR(45) NULL,
  `CustoPeca` FLOAT NULL,
  PRIMARY KEY (`idPeca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina_db`.`OrdemServico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina_db`.`OrdemServico` ;

CREATE TABLE IF NOT EXISTS `oficina_db`.`OrdemServico` (
  `idOrdemServico` INT NOT NULL AUTO_INCREMENT,
  `idOrcamento_fk` INT NOT NULL,
  `idResponsavelOS_fk` INT NOT NULL,
  `idServico_fk` INT NOT NULL,
  `idPeca_fk` INT NULL,
  `idProduto_fk` INT NULL,
  `Custo` FLOAT NULL,
  PRIMARY KEY (`idOrdemServico`, `idOrcamento_fk`, `idResponsavelOS_fk`, `idServico_fk`),
  INDEX `fk_orcamento_idx` (`idOrcamento_fk` ASC) VISIBLE,
  INDEX `fk_produto_idx` (`idProduto_fk` ASC) VISIBLE,
  INDEX `fk_servico_idx` (`idServico_fk` ASC) VISIBLE,
  INDEX `fk_peca_idx` (`idPeca_fk` ASC) VISIBLE,
  INDEX `fk_responsavel_idx` (`idResponsavelOS_fk` ASC) VISIBLE,
  CONSTRAINT `fk_orcamento`
    FOREIGN KEY (`idOrcamento_fk`)
    REFERENCES `oficina_db`.`Orcamento` (`idOrcamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto`
    FOREIGN KEY (`idProduto_fk`)
    REFERENCES `oficina_db`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico`
    FOREIGN KEY (`idServico_fk`)
    REFERENCES `oficina_db`.`Servico` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peca`
    FOREIGN KEY (`idPeca_fk`)
    REFERENCES `oficina_db`.`Peca` (`idPeca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_responsavel`
    FOREIGN KEY (`idResponsavelOS_fk`)
    REFERENCES `oficina_db`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
