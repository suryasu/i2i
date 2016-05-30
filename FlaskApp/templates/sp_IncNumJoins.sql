USE `BucketList`;
DROP procedure IF EXISTS `sp_IncNumJoins`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_IncNumJoins` (
IN p_user_id bigint
)
BEGIN
    update tbl_performance set num_joins = num_joins + 1 where user_id = p_user_id;
END$$
 
DELIMITER ;