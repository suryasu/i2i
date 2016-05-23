USE `BucketList`;
DROP procedure IF EXISTS `BucketList`.`sp_deleteNotification`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_deleteNotification`(
    IN p_notif_id int
)
BEGIN
    delete from tbl_notifications where notif_id = p_notif_id;

END$$
 
DELIMITER ;
;