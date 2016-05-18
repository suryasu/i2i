USE `BucketList`;
DROP procedure IF EXISTS `sp_GetProjByUser`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetProjByUser` (
IN p_user_id bigint
)
BEGIN
    select proj_id,proj_title, proj_category, proj_completion_time, proj_n_collaborators, proj_description, proj_tags,
    proj_user_id, proj_date, proj_file_path, getSum2(proj_id), hasLiked(proj_id,p_user_id) 
    from tbl_projects where p_user_id = proj_user_id;
END$$
 
DELIMITER ;