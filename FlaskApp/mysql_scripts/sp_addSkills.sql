USE `BucketList`;
DROP procedure IF EXISTS `BucketList`.`sp_addSkills`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addSkills`(
    IN p_skill1 varchar(255),
    IN p_skill2 varchar(255),
    IN p_skill3 varchar(255),
    IN p_skill4 varchar(255),
    IN p_skill5 varchar(255),
    IN p_user_id bigint
)
BEGIN
    insert into tbl_skills2(
        user_id,
        skill1,
        skill2,
        skill3,
        skill4,
        skill5
    )
    values
    (
		p_user_id,
        p_skill1,
        p_skill2,
        p_skill3,
        p_skill4,
        p_skill5
    );

END$$
 
DELIMITER ;
;