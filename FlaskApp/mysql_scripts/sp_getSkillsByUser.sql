USE `BucketList`;
DROP procedure IF EXISTS `sp_getSkillsByUser`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getSkillsByUser`(
	p_user_id int

)
BEGIN
    select * from tbl_skills2 left join tbl_languages
on tbl_skills2.user_id = tbl_languages.user_id
where tbl_skills2.user_id = p_user_id;

END$$
 
DELIMITER ;