USE `BucketList`;
DROP procedure IF EXISTS `BucketList`.`sp_addNotification`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addNotification`(
    IN p_user_id int,
    IN p_sender_id int,
    IN p_proj_id int,
    IN p_proj_title varchar(255),
    IN p_notif_type varchar(255)
)
BEGIN
    insert into tbl_notifications(
        user_id,
        sender_id,
        proj_id,
        proj_title,
        notif_type
        
    )
    values
    (
        p_user_id,
        p_sender_id,
        p_proj_id,
        p_proj_title,
        p_notif_type
    );

END$$
 
DELIMITER ;
;