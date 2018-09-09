-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `new_schema1` ;
USE `new_schema1` ;

-- -----------------------------------------------------
-- Table `new_schema1`.`experiences`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`experiences` (
  `idexperiences` INT NOT NULL AUTO_INCREMENT,
  `domaine` VARCHAR(45) NOT NULL,
  `nom_entreprise` VARCHAR(45) NULL,
  `date_debut` DATETIME NOT NULL,
  `date_fin` DATETIME NOT NULL,
  `taches` MEDIUMTEXT NULL,
  PRIMARY KEY (`idexperiences`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`formations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`formations` (
  `idformations` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `date_debut` DATE NOT NULL,
  `date_fin` DATE NOT NULL,
  `lieu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idformations`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`technologies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`technologies` (
  `idtechnologies` INT NOT NULL AUTO_INCREMENT,
  `domaine` VARCHAR(45) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `icone` VARCHAR(45) NULL,
  PRIMARY KEY (`idtechnologies`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`general`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`general` (
  `idgeneral` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `adresse` VARCHAR(45) NOT NULL,
  `date_naissance` VARCHAR(45) NOT NULL,
  `statut` VARCHAR(45) NOT NULL,
  `enfants` INT NULL,
  `objectif` VARCHAR(45) NOT NULL,
  `presentation` TEXT NOT NULL,
  PRIMARY KEY (`idgeneral`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`contacts` (
  `idcontacts` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `icone` VARCHAR(45) NULL,
  `valeur` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcontacts`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`projets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`projets` (
  `idprojets` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idprojets`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`interets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`interets` (
  `idinterets` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idinterets`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`admin_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`admin_users` (
  `idadmin_user` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `general_idgeneral` INT NOT NULL,
  `formations_idformations` INT NOT NULL,
  `contacts_idcontacts` INT NOT NULL,
  `experiences_idexperiences` INT NOT NULL,
  `projets_idprojets` INT NOT NULL,
  `interets_idinterets` INT NOT NULL,
  PRIMARY KEY (`idadmin_user`, `general_idgeneral`, `formations_idformations`, `contacts_idcontacts`, `experiences_idexperiences`, `projets_idprojets`, `interets_idinterets`),
  INDEX `fk_users_general1_idx` (`general_idgeneral` ASC),
  INDEX `fk_users_formations1_idx` (`formations_idformations` ASC),
  INDEX `fk_admin_users_contacts1_idx` (`contacts_idcontacts` ASC),
  INDEX `fk_admin_users_experiences1_idx` (`experiences_idexperiences` ASC),
  INDEX `fk_admin_users_projets1_idx` (`projets_idprojets` ASC),
  INDEX `fk_admin_users_interets1_idx` (`interets_idinterets` ASC),
  CONSTRAINT `fk_users_general1`
    FOREIGN KEY (`general_idgeneral`)
    REFERENCES `new_schema1`.`general` (`idgeneral`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_formations1`
    FOREIGN KEY (`formations_idformations`)
    REFERENCES `new_schema1`.`formations` (`idformations`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_users_contacts1`
    FOREIGN KEY (`contacts_idcontacts`)
    REFERENCES `new_schema1`.`contacts` (`idcontacts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_users_experiences1`
    FOREIGN KEY (`experiences_idexperiences`)
    REFERENCES `new_schema1`.`experiences` (`idexperiences`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_users_projets1`
    FOREIGN KEY (`projets_idprojets`)
    REFERENCES `new_schema1`.`projets` (`idprojets`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_users_interets1`
    FOREIGN KEY (`interets_idinterets`)
    REFERENCES `new_schema1`.`interets` (`idinterets`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`projets_has_technologies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`projets_has_technologies` (
  `projets_idprojets` INT NOT NULL,
  `technologies_idtechnologies` INT NOT NULL,
  PRIMARY KEY (`projets_idprojets`, `technologies_idtechnologies`),
  INDEX `fk_projets_has_technologies_technologies1_idx` (`technologies_idtechnologies` ASC),
  INDEX `fk_projets_has_technologies_projets_idx` (`projets_idprojets` ASC),
  CONSTRAINT `fk_projets_has_technologies_projets`
    FOREIGN KEY (`projets_idprojets`)
    REFERENCES `new_schema1`.`projets` (`idprojets`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projets_has_technologies_technologies1`
    FOREIGN KEY (`technologies_idtechnologies`)
    REFERENCES `new_schema1`.`technologies` (`idtechnologies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
