-- MySQL Workbench Synchronization
-- Generated: 2017-02-20 10:53
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Adrien Ballarano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `mydb`.`ticket` (
  `id_ticket` INT(10) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `id_projet` INT(10) ZEROFILL UNSIGNED NOT NULL,
  `id_statut` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `id_degre_importance` INT(10) ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`id_ticket`),
  INDEX `fk_ticket_projet_idx` (`id_projet` ASC),
  INDEX `fk_ticket_statut1_idx` (`id_statut` ASC),
  INDEX `fk_ticket_degre_importance1_idx` (`id_degre_importance` ASC),
  CONSTRAINT `fk_ticket_projet`
    FOREIGN KEY (`id_projet`)
    REFERENCES `mydb`.`projet` (`id_projet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_statut1`
    FOREIGN KEY (`id_statut`)
    REFERENCES `mydb`.`statut` (`id_statut`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_degre_importance1`
    FOREIGN KEY (`id_degre_importance`)
    REFERENCES `mydb`.`degre_importance` (`id_degre_importance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`projet` (
  `id_projet` INT(10) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` VARCHAR(255) NOT NULL,
  `actif` ENUM('Y', 'N') NOT NULL,
  PRIMARY KEY (`id_projet`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`utilisateur` (
  `id_utilisateur` INT(10) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `prenom` VARCHAR(255) NOT NULL,
  `actif` ENUM('Y', 'N') NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `login` VARCHAR(255) NOT NULL,
  `mail` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`statut` (
  `id_statut` INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `libelle` VARCHAR(255) NOT NULL,
  `actif` ENUM('Y', 'N') NOT NULL,
  PRIMARY KEY (`id_statut`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`projet_utilisateur` (
  `id_projet` INT(10) ZEROFILL UNSIGNED NOT NULL,
  `id_utilisateur` INT(10) ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`id_projet`, `id_utilisateur`),
  INDEX `fk_projet_has_utilisateur_utilisateur1_idx` (`id_utilisateur` ASC),
  INDEX `fk_projet_has_utilisateur_projet1_idx` (`id_projet` ASC),
  CONSTRAINT `fk_projet_has_utilisateur_projet1`
    FOREIGN KEY (`id_projet`)
    REFERENCES `mydb`.`projet` (`id_projet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projet_has_utilisateur_utilisateur1`
    FOREIGN KEY (`id_utilisateur`)
    REFERENCES `mydb`.`utilisateur` (`id_utilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`suivi_ticket` (
  `id_suivi_ticket` INT(10) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_ticket` INT(10) ZEROFILL UNSIGNED NOT NULL,
  `id_utilisateur` INT(10) ZEROFILL UNSIGNED NOT NULL,
  `id_statut` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `date` DATETIME NOT NULL,
  `remarque` VARCHAR(255) NULL DEFAULT NULL,
  INDEX `fk_suivi_ticket_ticket1_idx` (`id_ticket` ASC),
  INDEX `fk_suivi_ticket_utilisateur1_idx` (`id_utilisateur` ASC),
  INDEX `fk_suivi_ticket_statut1_idx` (`id_statut` ASC),
  PRIMARY KEY (`id_suivi_ticket`),
  CONSTRAINT `fk_suivi_ticket_ticket1`
    FOREIGN KEY (`id_ticket`)
    REFERENCES `mydb`.`ticket` (`id_ticket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_suivi_ticket_utilisateur1`
    FOREIGN KEY (`id_utilisateur`)
    REFERENCES `mydb`.`utilisateur` (`id_utilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_suivi_ticket_statut1`
    FOREIGN KEY (`id_statut`)
    REFERENCES `mydb`.`statut` (`id_statut`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`degre_importance` (
  `id_degre_importance` INT(10) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` VARCHAR(255) NOT NULL,
  `actif` ENUM('Y', 'N') NOT NULL,
  PRIMARY KEY (`id_degre_importance`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`commentaire_ticket` (
  `id_commentaire_ticket` INT(10) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id_ticket` INT(10) ZEROFILL UNSIGNED NOT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATETIME NOT NULL,
  `id_utilisateur` INT(10) ZEROFILL UNSIGNED NOT NULL,
  `remarque` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_commentaire_ticket`),
  INDEX `fk_commentaire_ticket_ticket1_idx` (`ticket_id_ticket` ASC),
  INDEX `fk_commentaire_ticket_utilisateur1_idx` (`id_utilisateur` ASC),
  CONSTRAINT `fk_commentaire_ticket_ticket1`
    FOREIGN KEY (`ticket_id_ticket`)
    REFERENCES `mydb`.`ticket` (`id_ticket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_commentaire_ticket_utilisateur1`
    FOREIGN KEY (`id_utilisateur`)
    REFERENCES `mydb`.`utilisateur` (`id_utilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`tags` (
  `id_tag` INT(10) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` VARCHAR(255) NOT NULL,
  `actif` ENUM('Y', 'N') NOT NULL,
  PRIMARY KEY (`id_tag`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`ticket_tags` (
  `ticket_id_ticket` INT(10) ZEROFILL UNSIGNED NOT NULL,
  `tags_id_tag` INT(10) ZEROFILL UNSIGNED NOT NULL,
  PRIMARY KEY (`ticket_id_ticket`, `tags_id_tag`),
  INDEX `fk_ticket_has_tags_tags1_idx` (`tags_id_tag` ASC),
  INDEX `fk_ticket_has_tags_ticket1_idx` (`ticket_id_ticket` ASC),
  CONSTRAINT `fk_ticket_has_tags_ticket1`
    FOREIGN KEY (`ticket_id_ticket`)
    REFERENCES `mydb`.`ticket` (`id_ticket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_has_tags_tags1`
    FOREIGN KEY (`tags_id_tag`)
    REFERENCES `mydb`.`tags` (`id_tag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`plage_travail` (
  `id_plage` INT(10) ZEROFILL UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_ticket` INT(10) ZEROFILL UNSIGNED NOT NULL,
  `id_utilisateur` INT(10) ZEROFILL UNSIGNED NOT NULL,
  `date_debut` DATETIME NULL DEFAULT NULL,
  `date_fin` DATETIME NULL DEFAULT NULL,
  INDEX `fk_plage_travail_ticket1_idx` (`id_ticket` ASC),
  INDEX `fk_plage_travail_utilisateur1_idx` (`id_utilisateur` ASC),
  PRIMARY KEY (`id_plage`),
  CONSTRAINT `fk_plage_travail_ticket1`
    FOREIGN KEY (`id_ticket`)
    REFERENCES `mydb`.`ticket` (`id_ticket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plage_travail_utilisateur1`
    FOREIGN KEY (`id_utilisateur`)
    REFERENCES `mydb`.`utilisateur` (`id_utilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
