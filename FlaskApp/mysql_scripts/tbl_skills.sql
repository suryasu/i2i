CREATE TABLE `tbl_skills2` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `skill1` varchar(255) DEFAULT NULL,
  `skill2` varchar(255) DEFAULT NULL,
  `skill3` varchar(255) DEFAULT NULL,
  `skill4` varchar(255) DEFAULT NULL,
  `skill5` varchar(255) DEFAULT NULL,
  PRIMARY KEY(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;