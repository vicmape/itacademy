DROP SCHEMA IF EXISTS `optica_machado`;
CREATE SCHEMA `optica_machado` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `optica_machado`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `address_street` VARCHAR(45) NULL,
  `address_num` INT NULL,
  `address_floor` INT NULL,
  `address_door` INT NULL,
  `address_city` VARCHAR(45) NULL,
  `address_postal_code` INT NULL,
  `address_country` VARCHAR(45) NULL,
  `address_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `employee_first_name` VARCHAR(45) NOT NULL,
  `employee_last_name` VARCHAR(45) NOT NULL,
  `employee_modified` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `employee_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`frame_type` (
  `frame_type_id` INT NOT NULL AUTO_INCREMENT,
  `frame_type` VARCHAR(45) NULL,
  PRIMARY KEY (`frame_type_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`provider` (
  `provider_id` INT NOT NULL AUTO_INCREMENT,
  `provider_name` VARCHAR(45) NULL,
  `provider_telephone` INT NULL,
  `provider_fax` INT NULL,
  `provider_nif` VARCHAR(45) NULL,
  `provider_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `provider_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`provider_id`, `address_id`),
  INDEX `fk_provider_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_provider_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `optica_machado`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`brand` (
  `brand_id` INT NOT NULL AUTO_INCREMENT,
  `brand_name` VARCHAR(45) NOT NULL,
  `provider_id` INT NOT NULL,
  PRIMARY KEY (`brand_id`, `provider_id`),
  INDEX `fk_brand_provider1_idx` (`provider_id` ASC) VISIBLE,
  CONSTRAINT `fk_brand_provider1`
    FOREIGN KEY (`provider_id`)
    REFERENCES `optica_machado`.`provider` (`provider_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`glasses` (
  `glasses_id` INT NOT NULL AUTO_INCREMENT,
  `glasses_grad_left` FLOAT NULL,
  `glasses_grad_right` FLOAT NULL,
  `glasses_frame_color` VARCHAR(45) NULL,
  `glasses_glass_color` VARCHAR(45) NULL,
  `glasses_price` DECIMAL(7,2) NULL,
  `glasses_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `glasses_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `frame_type_id` INT NOT NULL,
  `brand_brand_id` INT NOT NULL,
  PRIMARY KEY (`glasses_id`, `brand_brand_id`, `frame_type_id`),
  INDEX `fk_glasses_frame_type1_idx` (`frame_type_id` ASC) VISIBLE,
  INDEX `fk_glasses_brand1_idx` (`brand_brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_frame_type1`
    FOREIGN KEY (`frame_type_id`)
    REFERENCES `optica_machado`.`frame_type` (`frame_type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glasses_brand1`
    FOREIGN KEY (`brand_brand_id`)
    REFERENCES `optica_machado`.`brand` (`brand_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_telephone` INT NULL,
  `client_email` VARCHAR(255) NULL,
  `client_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `client_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `client_recommended_by` INT NULL,
  `address_address_id` INT NOT NULL,
  PRIMARY KEY (`client_id`, `address_address_id`),
  INDEX `fk_client_address1_idx` (`address_address_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_address1`
    FOREIGN KEY (`address_address_id`)
    REFERENCES `optica_machado`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`sale` (
  `sale_id` INT NOT NULL AUTO_INCREMENT,
  `sale_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_price` VARCHAR(45) NULL,
  `client_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `glasses_id` INT NOT NULL,
  PRIMARY KEY (`sale_id`, `client_id`, `employee_id`, `glasses_id`),
  INDEX `fk_sale_client1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_sale_employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_sale_glasses1_idx` (`glasses_id` ASC) VISIBLE,
  CONSTRAINT `fk_sale_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `optica_machado`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sale_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `optica_machado`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sale_glasses1`
    FOREIGN KEY (`glasses_id`)
    REFERENCES `optica_machado`.`glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;







