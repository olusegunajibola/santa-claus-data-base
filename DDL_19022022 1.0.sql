-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProjectSANTA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProjectSANTA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjectSANTA` DEFAULT CHARACTER SET utf8 ;
USE `ProjectSANTA` ;

-- -----------------------------------------------------
-- Table `ProjectSANTA`.`ELVES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectSANTA`.`ELVES` (
  `ElfName` VARCHAR(255) NOT NULL,
  `Elf_subDept` VARCHAR(25) NOT NULL,
  `Elf_Dept` VARCHAR(25) NOT NULL,
  `YearsOf_Experience` DECIMAL(3,2) NOT NULL,
  `Superv_Name` VARCHAR(255) NOT NULL,
  `DailyProductionAmt` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`ElfName`),
  UNIQUE INDEX `ElfName_UNIQUE` (`ElfName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectSANTA`.`SUB_DEPARTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectSANTA`.`SUB_DEPARTMENT` (
  `subdept_id` TINYINT NOT NULL,
  `SubdeptName` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`subdept_id`, `SubdeptName`),
  UNIQUE INDEX `SubdeptName_UNIQUE` (`SubdeptName` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectSANTA`.`DEPARTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectSANTA`.`DEPARTMENT` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `D_MgrName` VARCHAR(255) NOT NULL,
  `dept_id` TINYINT NOT NULL,
  `DeptName` VARCHAR(25) NOT NULL,
  UNIQUE INDEX `D_MgrName_UNIQUE` (`D_MgrName` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `DeptName_UNIQUE` (`DeptName` ASC) VISIBLE,
  UNIQUE INDEX `dept_id_UNIQUE` (`dept_id` ASC) VISIBLE,
  CONSTRAINT `D_MgrName`
    FOREIGN KEY (`D_MgrName`)
    REFERENCES `ProjectSANTA`.`ELVES` (`ElfName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `dept_id`
    FOREIGN KEY (`dept_id`)
    REFERENCES `ProjectSANTA`.`SUB_DEPARTMENT` (`subdept_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectSANTA`.`RAW_MATERIAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectSANTA`.`RAW_MATERIAL` (
  `mat_id` TINYINT NOT NULL,
  `MaterialName` VARCHAR(45) NOT NULL,
  `Qty_grams` INT ZEROFILL NULL,
  `Qty_amt` INT ZEROFILL NULL,
  PRIMARY KEY (`mat_id`, `MaterialName`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectSANTA`.`GIFT_TYPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectSANTA`.`GIFT_TYPE` (
  `GiftSerialCode` INT NOT NULL AUTO_INCREMENT,
  `GiftType` VARCHAR(25) NOT NULL,
  `RawMaterial_id` TINYINT NOT NULL,
  `GiftName` VARCHAR(25) NOT NULL,
  `LocalizedVersion` VARCHAR(15) NOT NULL,
  `ComplexityIndicator` INT NOT NULL,
  `ProductionLot` VARCHAR(15) NOT NULL,
  `Qty` INT ZEROFILL NOT NULL,
  `DeptName` VARCHAR(25) NOT NULL,
  UNIQUE INDEX `GiftSerialCode_UNIQUE` (`GiftSerialCode` ASC) VISIBLE,
  PRIMARY KEY (`GiftSerialCode`),
  INDEX `GiftType_idx` (`GiftType` ASC) VISIBLE,
  INDEX `RawMaterial_idx` (`RawMaterial_id` ASC) VISIBLE,
  CONSTRAINT `GiftType`
    FOREIGN KEY (`GiftType`)
    REFERENCES `ProjectSANTA`.`DEPARTMENT` (`DeptName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `RawMaterial`
    FOREIGN KEY (`RawMaterial_id`)
    REFERENCES `ProjectSANTA`.`RAW_MATERIAL` (`mat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectSANTA`.`PARENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectSANTA`.`PARENT` (
  `Parent_ID` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Parent_ID`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `Parent_ID_UNIQUE` (`Parent_ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectSANTA`.`CHILD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectSANTA`.`CHILD` (
  `parent_id` INT NOT NULL,
  `child_id` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(15) NOT NULL,
  `MidName` VARCHAR(15) NULL,
  `LastName` VARCHAR(15) NOT NULL,
  `StreetName` VARCHAR(255) NOT NULL,
  `PostalCode` INT NULL,
  `HouseNumber` VARCHAR(5) NOT NULL,
  `Country` VARCHAR(15) NOT NULL,
  UNIQUE INDEX `child_id_UNIQUE` (`child_id` ASC) VISIBLE,
  INDEX `parent_id_idx` (`parent_id` ASC) VISIBLE,
  PRIMARY KEY (`child_id`),
  CONSTRAINT `parent_id`
    FOREIGN KEY (`parent_id`)
    REFERENCES `ProjectSANTA`.`PARENT` (`Parent_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectSANTA`.`REQUESTED_BY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectSANTA`.`REQUESTED_BY` (
  `RequestID` INT NOT NULL,
  `GiftRequested` VARCHAR(45) NOT NULL,
  `id` TINYINT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `RequestID_idx` (`RequestID` ASC) VISIBLE,
  CONSTRAINT `RequestID`
    FOREIGN KEY (`RequestID`)
    REFERENCES `ProjectSANTA`.`CHILD` (`child_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectSANTA`.`DELIVER_TO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectSANTA`.`DELIVER_TO` (
  `deliv_id` INT NOT NULL AUTO_INCREMENT,
  `child` INT NOT NULL,
  `giftid` INT NOT NULL,
  INDEX `Child_ID_idx` (`child` ASC) VISIBLE,
  PRIMARY KEY (`deliv_id`),
  UNIQUE INDEX `deliv_id_UNIQUE` (`deliv_id` ASC) VISIBLE,
  INDEX `giftid_idx` (`giftid` ASC) VISIBLE,
  CONSTRAINT `child`
    FOREIGN KEY (`child`)
    REFERENCES `ProjectSANTA`.`CHILD` (`child_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `giftid`
    FOREIGN KEY (`giftid`)
    REFERENCES `ProjectSANTA`.`GIFT_TYPE` (`GiftSerialCode`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectSANTA`.`GIFT_COLOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectSANTA`.`GIFT_COLOR` (
  `color_id` INT NOT NULL AUTO_INCREMENT,
  `Color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`color_id`),
  CONSTRAINT `color_id`
    FOREIGN KEY (`color_id`)
    REFERENCES `ProjectSANTA`.`GIFT_TYPE` (`GiftSerialCode`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjectSANTA`.`PRODUCED_BY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjectSANTA`.`PRODUCED_BY` (
  `ElfName` VARCHAR(15) NOT NULL,
  `GiftCode` INT NOT NULL,
  `GiftVersion` DATETIME NOT NULL,
  PRIMARY KEY (`ElfName`),
  INDEX `GiftSerialCode_idx` (`GiftCode` ASC) VISIBLE,
  CONSTRAINT `ElfName`
    FOREIGN KEY (`ElfName`)
    REFERENCES `ProjectSANTA`.`ELVES` (`ElfName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `GiftCode`
    FOREIGN KEY (`GiftCode`)
    REFERENCES `ProjectSANTA`.`GIFT_TYPE` (`GiftSerialCode`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
