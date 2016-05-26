USE `BucketList`;
DROP procedure IF EXISTS `sp_GetCollabProjsByUser`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetCollabProjsByUser` (
IN p_user_id bigint
)
BEGIN
    select proj_id from tbl_collaborators where p_user_id = user_id;
END$$
 
DELIMITER ;