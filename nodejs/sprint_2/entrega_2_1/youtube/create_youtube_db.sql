DROP SCHEMA IF EXISTS `youtube_machado`;
CREATE SCHEMA IF NOT EXISTS `youtube_machado` DEFAULT CHARACTER SET utf8;
USE `youtube_machado`;

CREATE TABLE IF NOT EXISTS `youtube_machado`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `gender` ENUM('male', 'female', 'no answer') NOT NULL,
  `country` VARCHAR(3) NOT NULL,
  `zipcode` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube_machado`.`channel` (
  `channel_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `creation_date` DATE NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`channel_id`),
  INDEX `fk_channel_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube_machado`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube_machado`.`has_subscriptions` (
  `has_subscriptions_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `channel_id` INT NOT NULL,
  PRIMARY KEY (`has_subscriptions_id`),
  INDEX `fk_has_subscriptions_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_has_subscriptions_channel1_idx` (`channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_has_subscriptions_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube_machado`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_has_subscriptions_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `youtube_machado`.`channel` (`channel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `youtube_machado`.`video` (
  `video_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `size_in_bytes` INT NOT NULL,
  `filename` VARCHAR(255) NOT NULL,
  `lenght_in_seconds` INT NOT NULL,
  `thumbnail` VARCHAR(45) NOT NULL,
  `reproductions` INT UNSIGNED NOT NULL DEFAULT 0,
  `publish_date` DATE NOT NULL,
  `publish_time` TIME NOT NULL,
  `video_status` ENUM('public', 'ocult', 'privat') NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `fk_video_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube_machado`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube_machado`.`channel_has_videos` (
  `channel_has_videos_id` INT NOT NULL,
  `channel_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`channel_has_videos_id`),
  INDEX `fk_channel_has_videos_channel1_idx` (`channel_id` ASC) VISIBLE,
  INDEX `fk_channel_has_videos_video1_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_has_videos_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `youtube_machado`.`channel` (`channel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_channel_has_videos_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube_machado`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube_machado`.`hashtag` (
  `hashtag_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hashtag_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube_machado`.`has_hashtags` (
  `has_hashtags_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `hashtag_id` INT NOT NULL,
  PRIMARY KEY (`has_hashtags_id`),
  INDEX `fk_has_hashtags_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_has_hashtags_hashtag1_idx` (`hashtag_id` ASC) VISIBLE,
  CONSTRAINT `fk_has_hashtags_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube_machado`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_has_hashtags_hashtag1`
    FOREIGN KEY (`hashtag_id`)
    REFERENCES `youtube_machado`.`hashtag` (`hashtag_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube_machado`.`comments` (
  `comments_id` INT NOT NULL,
  `comment` VARCHAR(255) NOT NULL,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `video_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`comments_id`),
  INDEX `fk_has_comments_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_has_comments_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_has_comments_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube_machado`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_has_comments_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube_machado`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube_machado`.`playlist` (
  `playlist_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `public` VARCHAR(1) BINARY NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`playlist_id`),
  INDEX `fk_playlist_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube_machado`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube_machado`.`likes_comments` (
  `likes_comments_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `user_id` INT NOT NULL,
  `comments_id` INT NOT NULL,
  `is_like` TINYINT(1) NULL,
  PRIMARY KEY (`likes_comments_id`),
  INDEX `fk_likes_comments_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_likes_comments_comments1_idx` (`comments_id` ASC) VISIBLE,
  CONSTRAINT `fk_likes_comments_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube_machado`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_likes_comments_comments1`
    FOREIGN KEY (`comments_id`)
    REFERENCES `youtube_machado`.`comments` (`comments_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube_machado`.`likes_video` (
  `likes_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `video_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `is_like` TINYINT(1) NOT NULL,
  PRIMARY KEY (`likes_id`),
  INDEX `fk_has_likes_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_has_likes_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_has_likes_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube_machado`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_has_likes_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube_machado`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `youtube_machado`.`playlist_has_videos` (
  `has_videos_id` INT NOT NULL AUTO_INCREMENT,
  `playlist_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`has_videos_id`),
  INDEX `fk_has_videos_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  INDEX `fk_has_videos_video1_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_has_videos_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `youtube_machado`.`playlist` (`playlist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_has_videos_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube_machado`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

