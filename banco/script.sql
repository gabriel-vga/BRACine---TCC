-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bracine
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bracine
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bracine` DEFAULT CHARACTER SET utf8 ;
USE `bracine` ;

-- -----------------------------------------------------
-- Table `bracine`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `datacad` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idadmin_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`genero` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  `datacad` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`filme` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `ano` VARCHAR(45) NOT NULL,
  `genero_id` INT NOT NULL,
  `posterfile` VARCHAR(20) NOT NULL,
  `videofile` VARCHAR(20) NOT NULL,
  `sinopse` TEXT NOT NULL,
  `datacad` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_filme_genero_idx` (`genero_id` ASC),
  CONSTRAINT `fk_filme_genero`
    FOREIGN KEY (`genero_id`)
    REFERENCES `bracine`.`genero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`diretor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `nascimento` DATE NULL,
  `naturalidade` VARCHAR(30) NULL,
  `biografia` TEXT NOT NULL,
  `fotofile` VARCHAR(20) NOT NULL,
  `datacad` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`roteirista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`roteirista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `nascimento` DATE NULL,
  `naturalidade` VARCHAR(30) NULL,
  `biografia` TEXT NOT NULL,
  `fotofile` VARCHAR(20) NOT NULL,
  `datacad` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`filme_has_diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`filme_has_diretor` (
  `filme_id` INT NOT NULL,
  `diretor_id` INT NOT NULL,
  PRIMARY KEY (`filme_id`, `diretor_id`),
  INDEX `fk_filme_has_diretor_diretor1_idx` (`diretor_id` ASC),
  INDEX `fk_filme_has_diretor_filme1_idx` (`filme_id` ASC),
  CONSTRAINT `fk_filme_has_diretor_filme1`
    FOREIGN KEY (`filme_id`)
    REFERENCES `bracine`.`filme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filme_has_diretor_diretor1`
    FOREIGN KEY (`diretor_id`)
    REFERENCES `bracine`.`diretor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`filme_has_roteirista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`filme_has_roteirista` (
  `filme_id` INT NOT NULL,
  `roteirista_id` INT NOT NULL,
  PRIMARY KEY (`filme_id`, `roteirista_id`),
  INDEX `fk_filme_has_roteirista_roteirista1_idx` (`roteirista_id` ASC),
  INDEX `fk_filme_has_roteirista_filme1_idx` (`filme_id` ASC),
  CONSTRAINT `fk_filme_has_roteirista_filme1`
    FOREIGN KEY (`filme_id`)
    REFERENCES `bracine`.`filme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filme_has_roteirista_roteirista1`
    FOREIGN KEY (`roteirista_id`)
    REFERENCES `bracine`.`roteirista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`produtor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`produtor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `nascimento` DATE NULL,
  `naturalidade` VARCHAR(30) NULL,
  `biografia` TEXT NOT NULL,
  `fotofile` VARCHAR(20) NOT NULL,
  `datacad` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`filme_has_produtor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`filme_has_produtor` (
  `filme_id` INT NOT NULL,
  `produtor_id` INT NOT NULL,
  PRIMARY KEY (`filme_id`, `produtor_id`),
  INDEX `fk_filme_has_produtor_produtor1_idx` (`produtor_id` ASC),
  INDEX `fk_filme_has_produtor_filme1_idx` (`filme_id` ASC),
  CONSTRAINT `fk_filme_has_produtor_filme1`
    FOREIGN KEY (`filme_id`)
    REFERENCES `bracine`.`filme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filme_has_produtor_produtor1`
    FOREIGN KEY (`produtor_id`)
    REFERENCES `bracine`.`produtor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`ator` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `nascimento` DATE NULL,
  `naturalidade` VARCHAR(30) NULL,
  `biografia` TEXT NOT NULL,
  `fotofile` VARCHAR(20) NOT NULL,
  `datacad` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`ator_has_filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`ator_has_filme` (
  `ator_id` INT NOT NULL,
  `filme_id` INT NOT NULL,
  PRIMARY KEY (`ator_id`, `filme_id`),
  INDEX `fk_ator_has_filme_filme1_idx` (`filme_id` ASC),
  INDEX `fk_ator_has_filme_ator1_idx` (`ator_id` ASC),
  CONSTRAINT `fk_ator_has_filme_ator1`
    FOREIGN KEY (`ator_id`)
    REFERENCES `bracine`.`ator` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ator_has_filme_filme1`
    FOREIGN KEY (`filme_id`)
    REFERENCES `bracine`.`filme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`pais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `datacad` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`filme_has_pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`filme_has_pais` (
  `filme_id` INT NOT NULL,
  `pais_id` INT NOT NULL,
  PRIMARY KEY (`filme_id`, `pais_id`),
  INDEX `fk_filme_has_pais_pais1_idx` (`pais_id` ASC),
  INDEX `fk_filme_has_pais_filme1_idx` (`filme_id` ASC),
  CONSTRAINT `fk_filme_has_pais_filme1`
    FOREIGN KEY (`filme_id`)
    REFERENCES `bracine`.`filme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filme_has_pais_pais1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `bracine`.`pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`compositor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`compositor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `nascimento` DATE NULL,
  `naturalidade` VARCHAR(30) NULL,
  `biografia` TEXT NOT NULL,
  `fotofile` VARCHAR(20) NOT NULL,
  `datacad` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idcompositor_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`filme_has_compositor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`filme_has_compositor` (
  `filme_id` INT NOT NULL,
  `compositor_id` INT NOT NULL,
  PRIMARY KEY (`filme_id`, `compositor_id`),
  INDEX `fk_filme_has_compositor_compositor1_idx` (`compositor_id` ASC),
  INDEX `fk_filme_has_compositor_filme1_idx` (`filme_id` ASC),
  CONSTRAINT `fk_filme_has_compositor_filme1`
    FOREIGN KEY (`filme_id`)
    REFERENCES `bracine`.`filme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filme_has_compositor_compositor1`
    FOREIGN KEY (`compositor_id`)
    REFERENCES `bracine`.`compositor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bracine`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bracine`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `datacad` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idadmin_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
