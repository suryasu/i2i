USE `BucketList`;
DROP procedure IF EXISTS `BucketList`.`sp_addUserInfo`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addUserInfo`(
    IN p_user_id bigint(20),
    IN p_user_age int,
    IN p_user_education varchar(255),
    IN p_user_description text,
    IN p_file_path varchar(200)
)
BEGIN
    replace into tbl_user_info(
        user_id,
        user_age,
        user_education,
        user_description,
        user_prof_pic
    )
    values
    (
        p_user_id,
        p_user_age,
        p_user_education,
        p_user_description,
        p_file_path
    );
    

END$$
 
DELIMITER ;
;