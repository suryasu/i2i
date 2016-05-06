USE `BucketList`;
DROP procedure IF EXISTS `sp_GetAllProjects`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllProjects`()
BEGIN
    select proj_id,proj_title, proj_category, proj_completion_time, proj_n_collaborators, proj_description, proj_tags,
    proj_user_id, proj_date, proj_file_path, getSum2(proj_id)
    from tbl_projects;
END$$
 
DELIMITER ;