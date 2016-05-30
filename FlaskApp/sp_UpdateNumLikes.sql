USE `BucketList`;
DROP procedure IF EXISTS `sp_UpdateNumLikes`;

DELIMITER $$

 
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateNumLikes`(
    p_user_id int
)
BEGIN
	replace into tbl_performance(
        user_id,
        num_likes
    )
SELECT
    p_user_id,
	sum(project_like)
FROM tbl_likes where user_id = p_user_id;
END