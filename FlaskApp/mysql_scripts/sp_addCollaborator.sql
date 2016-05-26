USE `BucketList`;
DROP procedure IF EXISTS `BucketList`.`sp_addCollaborator`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addCollaborator`(
    IN p_proj_id int,
    IN p_user_id int
)
BEGIN
    insert into tbl_collaborators(
        proj_id,
        user_id
    )
    values
    (
        p_proj_id,
        p_user_id
    );

END$$
 
DELIMITER ;
;