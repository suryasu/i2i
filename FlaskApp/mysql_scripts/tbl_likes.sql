CREATE TABLE `BucketList`.`tbl_likes` (
  `project_id` INT NOT NULL,
  `like_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `project_like` INT NULL DEFAULT 0,
  PRIMARY KEY (`like_id`));