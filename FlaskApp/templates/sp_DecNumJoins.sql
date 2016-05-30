USE `BucketList`;
DROP procedure IF EXISTS `sp_DecNumJoins`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_DecNumJoins` (
IN p_user_id bigint
)
BEGIN
    update tbl_performance set num_joins = num_joins - 1 where user_id = p_user_id;
END$$
 
DELIMITER ;