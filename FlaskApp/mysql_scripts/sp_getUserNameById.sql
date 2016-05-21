USE `BucketList`;
DROP procedure IF EXISTS `sp_GetUserNameById`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetUserNameById` (
IN p_user_id bigint
)
BEGIN
    select user_name from tbl_user where user_id = p_user_id;
END$$
 
DELIMITER ;