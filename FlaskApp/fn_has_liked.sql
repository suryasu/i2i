DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `hasLiked`(
    p_project int,
    p_user int
) RETURNS int(11)
BEGIN
     
    select project_like into @myval from tbl_likes where project_id = p_project and user_id = p_user;
RETURN @myval;
END$$

DELIMITER ;
