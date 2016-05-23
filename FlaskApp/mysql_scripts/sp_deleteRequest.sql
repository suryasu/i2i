USE `BucketList`;
DROP procedure IF EXISTS `BucketList`.`sp_deleteRequest`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_deleteRequest`(
    IN p_request_id int
)
BEGIN
    delete from tbl_requests where request_id = p_request_id;

END$$
 
DELIMITER ;
;