DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getLikeStatus`(
    IN p_project_id int,
    IN p_user_id int
)
BEGIN
    select getSum2(p_project_id),hasLiked(p_project_id,p_user_id);
END$$
DELIMITER 