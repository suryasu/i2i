USE `BucketList`;
DROP procedure IF EXISTS `sp_GetAllProjects`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAllProjects`()
BEGIN
    select * from tbl_projects;
END$$
 
DELIMITER ;