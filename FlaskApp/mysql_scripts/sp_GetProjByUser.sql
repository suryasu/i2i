USE `BucketList`;
DROP procedure IF EXISTS `sp_GetProjByUser`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetProjByUser` (
IN p_user_id bigint
)
BEGIN
    select * from tbl_projects where proj_user_id = p_user_id;
END$$
 
DELIMITER ;