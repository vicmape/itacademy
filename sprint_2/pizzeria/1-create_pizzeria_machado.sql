DROP SCHEMA IF EXISTS `pizzeria_machado`;

CREATE SCHEMA IF NOT EXISTS `pizzeria_machado` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `pizzeria_machado`.`categoria_productes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `categoria_UNIQUE` (`categoria` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria_machado`.`productes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `descripció` VARCHAR(255) NULL,
  `imatge` VARCHAR(45) NULL,
  `preu` FLOAT NULL,
  `categoria_productes_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_productes_categoria_productes1_idx` (`categoria_productes_id` ASC) VISIBLE,
  CONSTRAINT `fk_productes_categoria_productes1`
    FOREIGN KEY (`categoria_productes_id`)
    REFERENCES `pizzeria_machado`.`categoria_productes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria_machado`.`provincies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria_machado`.`localitats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `provincies_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_localitats_provincies1_idx` (`provincies_id` ASC) VISIBLE,
  CONSTRAINT `fk_localitats_provincies1`
    FOREIGN KEY (`provincies_id`)
    REFERENCES `pizzeria_machado`.`provincies` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria_machado`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NOT NULL,
  `codi_postal` INT NOT NULL,
  `telèfon` INT NOT NULL,
  `localitats_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clients_localitats1_idx` (`localitats_id` ASC) VISIBLE,
  UNIQUE INDEX `telèfon_UNIQUE` (`telèfon` ASC) VISIBLE,
  CONSTRAINT `fk_clients_localitats1`
    FOREIGN KEY (`localitats_id`)
    REFERENCES `pizzeria_machado`.`localitats` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria_machado`.`botiga` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `adreça` VARCHAR(45) NOT NULL,
  `codi_postal` INT NOT NULL,
  `localitats_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_botiga_localitats1_idx` (`localitats_id` ASC) VISIBLE,
  CONSTRAINT `fk_botiga_localitats1`
    FOREIGN KEY (`localitats_id`)
    REFERENCES `pizzeria_machado`.`localitats` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria_machado`.`feines` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `feina` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria_machado`.`empleats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(16) NOT NULL,
  `telf` INT UNSIGNED NOT NULL,
  `feines_id` INT NOT NULL,
  `botiga_id` INT NOT NULL,
  `localitats_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE,
  UNIQUE INDEX `telf_UNIQUE` (`telf` ASC) VISIBLE,
  INDEX `fk_empleats_feines1_idx` (`feines_id` ASC) VISIBLE,
  INDEX `fk_empleats_botiga1_idx` (`botiga_id` ASC) VISIBLE,
  INDEX `fk_empleats_localitats1_idx` (`localitats_id` ASC) VISIBLE,
  CONSTRAINT `fk_empleats_feines1`
    FOREIGN KEY (`feines_id`)
    REFERENCES `pizzeria_machado`.`feines` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_empleats_botiga1`
    FOREIGN KEY (`botiga_id`)
    REFERENCES `pizzeria_machado`.`botiga` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_empleats_localitats1`
    FOREIGN KEY (`localitats_id`)
    REFERENCES `pizzeria_machado`.`localitats` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pizzeria_machado`.`recollides` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `tipus_UNIQUE` (`tipus` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = '	\n';

CREATE TABLE IF NOT EXISTS `pizzeria_machado`.`comandes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_comanda` DATE NOT NULL,
  `hora_comanda` TIME NOT NULL,
  `hora_recollida` TIME NULL DEFAULT NULL,
  `data_recollida` DATE NULL DEFAULT NULL,
  `productes_id` INT NOT NULL,
  `recollides_id` INT NOT NULL,
  `botiga_id` INT NOT NULL,
  `empleats_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comandes_productes1_idx` (`productes_id` ASC) VISIBLE,
  INDEX `fk_comandes_recollides1_idx` (`recollides_id` ASC) VISIBLE,
  INDEX `fk_comandes_botiga1_idx` (`botiga_id` ASC) VISIBLE,
  INDEX `fk_comandes_empleats1_idx` (`empleats_id` ASC) VISIBLE,
  CONSTRAINT `fk_comandes_productes1`
    FOREIGN KEY (`productes_id`)
    REFERENCES `pizzeria_machado`.`productes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comandes_recollides1`
    FOREIGN KEY (`recollides_id`)
    REFERENCES `pizzeria_machado`.`recollides` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comandes_botiga1`
    FOREIGN KEY (`botiga_id`)
    REFERENCES `pizzeria_machado`.`botiga` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comandes_empleats1`
    FOREIGN KEY (`empleats_id`)
    REFERENCES `pizzeria_machado`.`empleats` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


