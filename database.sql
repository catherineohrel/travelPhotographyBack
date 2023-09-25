-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema travelPhotography
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema travelPhotography
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `travelPhotography` ;
USE `travelPhotography` ;

-- -----------------------------------------------------
-- Table `travelPhotography`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelPhotography`.`album` (
  `idalbum` INT NOT NULL AUTO_INCREMENT,
  `albumTitle` VARCHAR(100) NOT NULL,
  `albumTheme` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idalbum`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travelPhotography`.`photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelPhotography`.`photo` (
  `idphoto` INT NOT NULL AUTO_INCREMENT,
  `photoTitle` VARCHAR(100) NULL,
  `photoCountry` VARCHAR(45) NOT NULL,
  `photoPlace` VARCHAR(100) NULL,
  `photoTheme` VARCHAR(45) NULL,
  `photoDate` DATETIME NULL,
  PRIMARY KEY (`idphoto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travelPhotography`.`album_has_photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelPhotography`.`album_has_photo` (
  `album_idalbum` INT NOT NULL,
  `photo_idphoto` INT NOT NULL,
  PRIMARY KEY (`album_idalbum`, `photo_idphoto`),
  INDEX `fk_album_has_photo_photo1_idx` (`photo_idphoto` ASC) VISIBLE,
  INDEX `fk_album_has_photo_album_idx` (`album_idalbum` ASC) VISIBLE,
  CONSTRAINT `fk_album_has_photo_album`
    FOREIGN KEY (`album_idalbum`)
    REFERENCES `travelPhotography`.`album` (`idalbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_album_has_photo_photo1`
    FOREIGN KEY (`photo_idphoto`)
    REFERENCES `travelPhotography`.`photo` (`idphoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
