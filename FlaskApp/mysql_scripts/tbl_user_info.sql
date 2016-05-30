CREATE TABLE `tbl_user_info` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_age` INT DEFAULT NULL,
  `user_education` varchar(255) DEFAULT NULL,
  `user_description` text DEFAULT NULL,
  `user_prof_pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY(`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
  