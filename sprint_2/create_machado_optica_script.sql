DROP SCHEMA IF EXISTS `optica_machado`;
CREATE SCHEMA `optica_machado` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `optica_machado`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `address_street` VARCHAR(45) NOT NULL,
  `address_num` INT NOT NULL,
  `address_floor` INT NOT NULL,
  `address_door` INT NOT NULL,
  `address_city` VARCHAR(45) NOT NULL,
  `address_postal_code` INT NOT NULL,
  `address_country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `employee_first_name` VARCHAR(45) NOT NULL,
  `employee_last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`frame_type` (
  `frame_type_id` INT NOT NULL AUTO_INCREMENT,
  `frame_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`frame_type_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`provider` (
  `provider_id` INT NOT NULL AUTO_INCREMENT,
  `provider_name` VARCHAR(45) NOT NULL,
  `provider_telephone` INT NOT NULL,
  `provider_fax` INT NOT NULL,
  `provider_nif` VARCHAR(45) NOT NULL,
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
  `glasses_grad_left` FLOAT NOT NULL,
  `glasses_grad_right` FLOAT NOT NULL,
  `glasses_frame_color` VARCHAR(45) NOT NULL,
  `glasses_glass_color` VARCHAR(45) NOT NULL,
  `glasses_price` DECIMAL(7,2) NOT NULL,
  `frame_type_id` INT NOT NULL,
  `brand_id` INT NOT NULL,
  PRIMARY KEY (`glasses_id`, `brand_id`, `frame_type_id`),
  INDEX `fk_glasses_frame_type1_idx` (`frame_type_id` ASC) VISIBLE,
  INDEX `fk_glasses_brand1_idx` (`brand_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_frame_type1`
    FOREIGN KEY (`frame_type_id`)
    REFERENCES `optica_machado`.`frame_type` (`frame_type_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_glasses_brand1`
    FOREIGN KEY (`brand_id`)
    REFERENCES `optica_machado`.`brand` (`brand_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_telephone` INT NOT NULL,
  `client_email` VARCHAR(255) NOT NULL,
  `client_recommended_by` INT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`client_id`, `address_id`),
  INDEX `fk_client_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `optica_machado`.`address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `optica_machado`.`sale` (
  `sale_id` INT NOT NULL AUTO_INCREMENT,
  `sale_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_price` VARCHAR(45) NOT NULL,
  `client_id` INT NOT NULL,
  `glasses_id` INT NOT NULL,
  `employee_employee_id` INT NOT NULL,
  PRIMARY KEY (`sale_id`, `client_id`, `glasses_id`),
  INDEX `fk_sale_client1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_sale_glasses1_idx` (`glasses_id` ASC) VISIBLE,
  INDEX `fk_sale_employee1_idx` (`employee_employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_sale_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `optica_machado`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sale_glasses1`
    FOREIGN KEY (`glasses_id`)
    REFERENCES `optica_machado`.`glasses` (`glasses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sale_employee1`
    FOREIGN KEY (`employee_employee_id`)
    REFERENCES `optica_machado`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;







