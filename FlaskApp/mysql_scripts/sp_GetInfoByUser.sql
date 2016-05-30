USE `BucketList`;
DROP procedure IF EXISTS `sp_GetInfoByUser`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetInfoByUser` (
IN p_user_id bigint
)
BEGIN
    select * from tbl_user_info where p_user_id = user_id;
END$$
 
DELIMITER ;