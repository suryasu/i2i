USE `BucketList`;
DROP procedure IF EXISTS `sp_GetProjById`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetProjById` (
IN p_proj_id bigint
)
BEGIN
    select proj_id,proj_title, proj_category, proj_completion_time, proj_n_collaborators, proj_description, proj_tags,
    proj_user_id, proj_date, proj_file_path, getSum2(proj_id)
    from tbl_projects where p_proj_id = proj_id;
END$$
 
DELIMITER ;