CREATE TABLE `tbl_notifications` (
  `notif_id` INT NOT NULL AUTO_INCREMENT, 
  `user_id` INT, 
  `sender_id` INT, 
  `proj_id` INT, 
  `proj_title` varchar(255),
  `notif_type` varchar(255),
  PRIMARY KEY(`notif_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;