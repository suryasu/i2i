 CREATE TABLE `tbl_collaborators` (
  `proj_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY(`proj_id`, `user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
