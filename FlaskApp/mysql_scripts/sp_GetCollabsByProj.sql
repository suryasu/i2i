USE `BucketList`;
DROP procedure IF EXISTS `sp_GetCollabsByProj`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetCollabsByProj` (
IN p_proj_id bigint
)
BEGIN
    select user_id from tbl_collaborators where proj_id = p_proj_id;
END$$
 
DELIMITER ;