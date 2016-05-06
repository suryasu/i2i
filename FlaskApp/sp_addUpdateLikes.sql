DELIMITER $$
 
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddUpdateLikes`(
    p_project_id int,
    p_user_id int,
    p_like int
)
BEGIN
    if (select exists (select 1 from tbl_likes where project_id = p_project_id and project_id = p_project_id)) then
 
        update tbl_likes set project_like = p_like where project_id = p_project_id and user_id = p_user_id;
         
    else
         
        insert into tbl_likes(
            project_id,
            user_id,
			project_like
        )
        values(
            p_project_id,
            p_project_id,
            p_like
        );
 
    end if;
END