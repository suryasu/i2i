CREATE TABLE `requests` (
  `request_id` INT NOT NULL AUTO_INCREMENT, 
  `user_id` INT, 
  `owner_id` INT, 
  `proj_id` INT, 
  `proj_title` varchar(255), 
  PRIMARY KEY(`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;