USE `BucketList`;
DROP procedure IF EXISTS `BucketList`.`sp_addRequest`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addRequest`(
    IN p_user_id int,
    IN p_owner_id int,
    IN p_proj_id int,
    IN p_proj_title varchar(255)
)
BEGIN
    insert into tbl_requests(
        user_id,
        owner_id,
        proj_id,
        proj_title
    )
    values
    (
        p_user_id,
        p_owner_id,
        p_proj_id,
        p_proj_title
    );

END$$
 
DELIMITER ;
;