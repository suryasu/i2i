USE `BucketList`;
DROP procedure IF EXISTS `sp_GetRequestByOwner`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetRequestByOwner` (
IN p_owner_id bigint
)
BEGIN
    select request_id, user_id, owner_id, proj_id, proj_title from tbl_requests where owner_id = p_owner_id;
END$$
 
DELIMITER ;