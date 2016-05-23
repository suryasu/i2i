USE `BucketList`;
DROP procedure IF EXISTS `sp_GetNotifications`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetNotifications` (
IN p_user_id bigint
)
BEGIN
    select * from tbl_notifications where user_id = p_user_id;
END$$
 
DELIMITER ;