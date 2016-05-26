DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `hasLiked`(
    p_project int,
    p_user int
) RETURNS int(11)
BEGIN
	if exists (select * from tbl_likes where project_id = p_project and user_id = p_user) then
		select project_like into @myval from tbl_likes where project_id = p_project and user_id = p_user;
	else
		select 0 into @myval;
	end if;
RETURN @myval;
END$$

DELIMITER ;
