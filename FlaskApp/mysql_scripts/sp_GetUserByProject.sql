USE `BucketList`;
DROP procedure IF EXISTS `sp_GetUserByProject`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetUserByProject` (
IN p_proj_id bigint
)
BEGIN
    select proj_user_id 
    from tbl_projects where p_proj_id = proj_id;
END$$
 
DELIMITER ;