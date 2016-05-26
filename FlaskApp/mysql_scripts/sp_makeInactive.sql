USE `BucketList`;
DROP procedure IF EXISTS `sp_makeInactive`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_makeInactive`(
	p_proj_id int

)
BEGIN
	update tbl_projects set active = 0 where proj_id = p_proj_id AND proj_n_collaborators = num_collab;
END$$
 
DELIMITER ;