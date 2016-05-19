USE `BucketList`;
DROP procedure IF EXISTS `sp_GetAllRankedProjects`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllRankedProjects`(
	p_user int

)
BEGIN
    select proj_id,proj_title, proj_category, proj_completion_time, proj_n_collaborators, proj_description, proj_tags,
    proj_user_id, proj_date, proj_file_path, getSum2(proj_id), hasLiked(proj_id,p_user) 
    from tbl_projects where p_user != proj_user_id;
END$$
 
DELIMITER ;
