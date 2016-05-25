USE `BucketList`;
DROP procedure IF EXISTS `sp_IncNumCollab`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_IncNumCollab` (
IN p_proj_id bigint
)
BEGIN
    update tbl_projects set num_collab = num_collab + 1 where proj_id = p_proj_id;
END$$
 
DELIMITER ;