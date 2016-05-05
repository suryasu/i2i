CREATE TABLE `tbl_projects` (
  `proj_id` int(11) NOT NULL AUTO_INCREMENT,
  `proj_title` varchar(255) DEFAULT NULL,
  `proj_category` varchar(255) DEFAULT NULL,
  `proj_completion_time` varchar(255) DEFAULT NULL,
  `proj_n_collaborators` varchar(255) DEFAULT NULL,
  `proj_description` text DEFAULT NULL,
  `proj_tags` text DEFAULT NULL,
  `proj_user_id` int(11) DEFAULT NULL,
  `proj_date` datetime DEFAULT NULL,
  PRIMARY KEY (`proj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
  