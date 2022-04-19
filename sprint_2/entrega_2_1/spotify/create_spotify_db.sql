DROP SCHEMA IF EXISTS `schema_spotify`;
CREATE SCHEMA IF NOT EXISTS `schema_spotify` DEFAULT CHARACTER SET utf8;
USE `schema_spotify`;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `kind_of_user` ENUM('free', 'premium') NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `birthdate` DATETIME NOT NULL,
  `gender` ENUM('male', 'female', 'no answer') NOT NULL,
  `country` VARCHAR(3) NOT NULL,
  `zipcode` TINYINT(10) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`paypal` (
  `paypal_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`paypal_id`),
  INDEX `fk_paypal_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_paypal_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `schema_spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`credit_card` (
  `credit_card_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `number` VARCHAR(45) NOT NULL,
  `month` VARCHAR(2) NOT NULL,
  `year` VARCHAR(4) NOT NULL,
  `cvc` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`credit_card_id`),
  INDEX `fk_credit_card_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_credit_card_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `schema_spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`subscription` (
  `subscription_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `renovation_date` DATE NOT NULL,
  `payment_method` ENUM('credit card', 'paypal') NOT NULL,
  PRIMARY KEY (`subscription_id`),
  INDEX `fk_subscription_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscription_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `schema_spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`payment` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `subscription_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `total` INT NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_payment_subscription1_idx` (`subscription_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_subscription1`
    FOREIGN KEY (`subscription_id`)
    REFERENCES `schema_spotify`.`subscription` (`subscription_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `kind_of_music` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`album` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `artist_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `publication_date` DATE NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `fk_album_artist1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_album_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `schema_spotify`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`song` (
  `song_id` INT NOT NULL AUTO_INCREMENT,
  `album_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `duration` INT NOT NULL,
  `num_of_reproductions` INT NOT NULL,
  PRIMARY KEY (`song_id`),
  INDEX `fk_song_album1_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_song_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `schema_spotify`.`album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`playlist` (
  `playlist_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `num_of_songs` INT NOT NULL,
  `creation_date` DATE NOT NULL,
  `deletion_date` DATE NOT NULL,
  `status` ENUM('active', 'deleted') NOT NULL,
  PRIMARY KEY (`playlist_id`),
  INDEX `fk_playlist_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `schema_spotify`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`playlist_shared` (
  `playlist_shared_id` INT NOT NULL AUTO_INCREMENT,
  `playlist_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`playlist_shared_id`),
  INDEX `fk_playlist_shared_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  INDEX `fk_playlist_shared_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_shared_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `schema_spotify`.`playlist` (`playlist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_playlist_shared_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `schema_spotify`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`add_song_playlist` (
  `user_id` INT NOT NULL,
  `playlist_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  `date` DATE NOT NULL,
  INDEX `fk_add_song_playlist_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_add_song_playlist_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  INDEX `fk_add_song_playlist_song1_idx` (`song_id` ASC) VISIBLE,
  CONSTRAINT `fk_add_song_playlist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `schema_spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_add_song_playlist_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `schema_spotify`.`playlist` (`playlist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_add_song_playlist_song1`
    FOREIGN KEY (`song_id`)
    REFERENCES `schema_spotify`.`song` (`song_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`favorite_song` (
  `favorite_song_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  PRIMARY KEY (`favorite_song_id`),
  INDEX `fk_favorite_song_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_favorite_song_song1_idx` (`song_id` ASC) VISIBLE,
  CONSTRAINT `fk_favorite_song_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `schema_spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_song_song1`
    FOREIGN KEY (`song_id`)
    REFERENCES `schema_spotify`.`song` (`song_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`favorite_album` (
  `favorite_album_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`favorite_album_id`),
  INDEX `fk_favorite_album_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_favorite_album_album1_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_favorite_album_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `schema_spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorite_album_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `schema_spotify`.`album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `schema_spotify`.`favorite_artist` (
  `favorite_artist_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`favorite_artist_id`),
  INDEX `fk_follows_artist_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_follows_artist_artist1_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_follows_artist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `schema_spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_follows_artist_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `schema_spotify`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

