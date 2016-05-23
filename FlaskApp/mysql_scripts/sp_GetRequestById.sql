USE `BucketList`;
DROP procedure IF EXISTS `sp_GetRequestById`;
 
DELIMITER $$
USE `BucketList`$$
CREATE PROCEDURE `sp_GetRequestById` (
IN p_request_id bigint
)
BEGIN
    select * from tbl_requests where request_id = p_request_id;
END$$
 
DELIMITER ;