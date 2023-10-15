-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema travelphotography
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema travelphotography
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `travelphotography` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `travelphotography` ;

-- -----------------------------------------------------
-- Table `travelphotography`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelphotography`.`album` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `albumTitle` VARCHAR(100) NOT NULL,
  `albumTheme` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `travelphotography`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelphotography`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `creationDate` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `travelphotography`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelphotography`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `orderAmount` FLOAT NOT NULL,
  `orderDate` TIMESTAMP NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_order_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `travelphotography`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `travelphotography`.`photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelphotography`.`photo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `photoTitle` VARCHAR(100) NULL DEFAULT NULL,
  `photoSrc` VARCHAR(255) NOT NULL,
  `photoCountry` VARCHAR(45) NOT NULL,
  `photoPlace` VARCHAR(100) NULL DEFAULT NULL,
  `photoTheme` VARCHAR(45) NULL DEFAULT NULL,
  `photoDate` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `travelphotography`.`photoOption`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelphotography`.`photoOption` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uploadedBackground` VARCHAR(100) NULL DEFAULT NULL,
  `frame` VARCHAR(45) NULL DEFAULT NULL,
  `B&W` VARCHAR(45) NULL DEFAULT NULL,
  `size` VARCHAR(45) NOT NULL,
  `photoPrice` FLOAT NOT NULL,
  `photo_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`id`, `photo_id`, `order_id`),
  INDEX `fk_photoOption_photo1_idx` (`photo_id` ASC) VISIBLE,
  INDEX `fk_photoOption_order1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_photoOption_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `travelphotography`.`photo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_photoOption_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `travelphotography`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `travelphotography`.`userpayment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelphotography`.`userpayment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `paymentType` VARCHAR(45) NOT NULL,
  `bank` VARCHAR(45) NOT NULL,
  `accountNumber` INT NOT NULL,
  `expiryDate` DATE NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_userpayment_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_userpayment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `travelphotography`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `travelphotography`.`album_has_photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelphotography`.`album_has_photo` (
  `album_id` INT NOT NULL,
  `photo_id` INT NOT NULL,
  PRIMARY KEY (`album_id`, `photo_id`),
  INDEX `fk_album_has_photo_photo1_idx` (`photo_id` ASC) VISIBLE,
  INDEX `fk_album_has_photo_album1_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_album_has_photo_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `travelphotography`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_album_has_photo_photo1`
    FOREIGN KEY (`photo_id`)
    REFERENCES `travelphotography`.`photo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
