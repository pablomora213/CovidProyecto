-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema covde
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema covde
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `covde` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Customer_ID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(15) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Adress` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Province` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Postal` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salespersons` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Staff_ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoices` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `InvoiceNumber` VARCHAR(45) NOT NULL,
  `Date` DATE NOT NULL,
  `Customers_ID` INT NOT NULL,
  `Salespersons_ID` INT NOT NULL,
  `Salespersons_ID1` INT NOT NULL,
  PRIMARY KEY (`ID`, `Customers_ID`, `Salespersons_ID`, `Salespersons_ID1`),
  INDEX `fk_Invoices_Customers1_idx` (`Customers_ID` ASC) VISIBLE,
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_ID1` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_ID`)
    REFERENCES `mydb`.`Customers` (`ID`),
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_ID1`)
    REFERENCES `mydb`.`Salespersons` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cars` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(17) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Year` YEAR NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Invoices_ID` INT NOT NULL,
  `Invoices_Customers_ID` INT NOT NULL,
  `Invoices_Salespersons_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Invoices_ID`, `Invoices_Customers_ID`, `Invoices_Salespersons_ID`),
  INDEX `fk_Cars_Invoices1_idx` (`Invoices_ID` ASC, `Invoices_Customers_ID` ASC, `Invoices_Salespersons_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Cars_Invoices1`
    FOREIGN KEY (`Invoices_ID` , `Invoices_Customers_ID` , `Invoices_Salespersons_ID`)
    REFERENCES `mydb`.`Invoices` (`ID` , `Customers_ID` , `Salespersons_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `covde` ;

-- -----------------------------------------------------
-- Table `covde`.`medallas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `covde`.`medallas` (
  `idmed` BIGINT NOT NULL,
  `pais` TEXT NULL DEFAULT NULL,
  `oro` DOUBLE NULL DEFAULT NULL,
  `plata` DOUBLE NULL DEFAULT NULL,
  `bronce` DOUBLE NULL DEFAULT NULL,
  `medallas` DOUBLE NULL DEFAULT NULL,
  INDEX `ix_medallas_index` (`idmed` ASC) VISIBLE,
  PRIMARY KEY (`idmed`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `covde`.`listpais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `covde`.`listpais` (
  `idpais` BIGINT NOT NULL,
  `nombrepais` TEXT NULL DEFAULT NULL,
  `medallas_idalc` BIGINT NOT NULL,
  INDEX `ix_listpais_index` (`idpais` ASC) VISIBLE,
  PRIMARY KEY (`idpais`, `medallas_idalc`),
  INDEX `fk_listpais_medallas_idx` (`medallas_idalc` ASC) VISIBLE,
  CONSTRAINT `fk_listpais_medallas`
    FOREIGN KEY (`medallas_idalc`)
    REFERENCES `covde`.`medallas` (`idmed`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `covde`.`alcohol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `covde`.`alcohol` (
  `idalc` BIGINT NOT NULL,
  `Country` TEXT NULL DEFAULT NULL,
  `Region` TEXT NULL DEFAULT NULL,
  `Hemisphere` TEXT NULL DEFAULT NULL,
  `HappinessScore` DOUBLE NULL DEFAULT NULL,
  `HDI` BIGINT NULL DEFAULT NULL,
  `GDP_PerCapita` DOUBLE NULL DEFAULT NULL,
  `Beer_PerCapita` BIGINT NULL DEFAULT NULL,
  `Spirit_PerCapita` BIGINT NULL DEFAULT NULL,
  `Wine_PerCapita` BIGINT NULL DEFAULT NULL,
  `listpais_idpais` BIGINT NOT NULL,
  `listpais_medallas_idalc` BIGINT NOT NULL,
  INDEX `ix_alcohol_index` (`idalc` ASC) VISIBLE,
  PRIMARY KEY (`idalc`, `listpais_idpais`, `listpais_medallas_idalc`),
  INDEX `fk_alcohol_listpais1_idx` (`listpais_idpais` ASC, `listpais_medallas_idalc` ASC) VISIBLE,
  CONSTRAINT `fk_alcohol_listpais1`
    FOREIGN KEY (`listpais_idpais` , `listpais_medallas_idalc`)
    REFERENCES `covde`.`listpais` (`idpais` , `medallas_idalc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `covde`.`deaths`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `covde`.`deaths` (
  `iddea` BIGINT NOT NULL,
  `country` TEXT NULL DEFAULT NULL,
  `region` TEXT NULL DEFAULT NULL,
  `region_code` BIGINT NULL DEFAULT NULL,
  `start_date` TEXT NULL DEFAULT NULL,
  `end_date` TEXT NULL DEFAULT NULL,
  `days` BIGINT NULL DEFAULT NULL,
  `year` BIGINT NULL DEFAULT NULL,
  `week` BIGINT NULL DEFAULT NULL,
  `population` BIGINT NULL DEFAULT NULL,
  `total_deaths` DOUBLE NULL DEFAULT NULL,
  `covid_deaths` BIGINT NULL DEFAULT NULL,
  `expected_deaths` DOUBLE NULL DEFAULT NULL,
  `excess_deaths` DOUBLE NULL DEFAULT NULL,
  `non_covid_deaths` DOUBLE NULL DEFAULT NULL,
  `covid_deaths_per_100k` DOUBLE NULL DEFAULT NULL,
  `excess_deaths_per_100k` DOUBLE NULL DEFAULT NULL,
  `excess_deaths_pct_change` DOUBLE NULL DEFAULT NULL,
  `listpais_idpais` BIGINT NOT NULL,
  `listpais_medallas_idalc` BIGINT NOT NULL,
  INDEX `ix_deaths_index` (`iddea` ASC) VISIBLE,
  PRIMARY KEY (`iddea`, `listpais_idpais`, `listpais_medallas_idalc`),
  INDEX `fk_deaths_listpais1_idx` (`listpais_idpais` ASC, `listpais_medallas_idalc` ASC) VISIBLE,
  CONSTRAINT `fk_deaths_listpais1`
    FOREIGN KEY (`listpais_idpais` , `listpais_medallas_idalc`)
    REFERENCES `covde`.`listpais` (`idpais` , `medallas_idalc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SELECT *
	FROM alcohol AS a
    LEFT JOIN medallas AS m ON a.Country = m.pais  
    group by a.Country