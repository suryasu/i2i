USE `BucketList`;
DROP procedure IF EXISTS `sp_GetClickedProject`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetClickedProject`(
	p_id int

)
BEGIN
    select proj_id, proj_title, proj_category, proj_completion_time, proj_n_collaborators, proj_description, proj_tags,
    proj_user_id, proj_date, proj_file_path, getSum2(proj_id)
    from tbl_projects where proj_id = p_id;
END$$
 
DELIMITER ;