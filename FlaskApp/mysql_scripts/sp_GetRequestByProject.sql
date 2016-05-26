USE `BucketList`;
DROP procedure IF EXISTS `sp_GetRequestByProject`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetRequestByProject` (
IN p_proj_id bigint
)
BEGIN
    select user_id 
    from tbl_requests where p_proj_id = proj_id;
END$$
 
DELIMITER ;