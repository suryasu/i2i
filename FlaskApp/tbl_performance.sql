CREATE TABLE `tbl_performance` (
  `user_id` bigint(20) NOT NULL,
  `num_likes` INT DEFAULT NULL,
  `num_joins` INT DEFAULT NULL,
  PRIMARY KEY(`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  