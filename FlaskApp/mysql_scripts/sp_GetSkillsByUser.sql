USE `BucketList`;
DROP procedure IF EXISTS `sp_GetSkillsByUser`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetSkillsByUser` (
IN p_user_id bigint
)
BEGIN
    select * from tbl_skills2 where p_user_id = user_id;
END$$
 
DELIMITER ;
