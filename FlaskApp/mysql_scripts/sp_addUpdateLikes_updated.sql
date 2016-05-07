USE `BucketList`;
DROP procedure IF EXISTS `sp_AddUpdateLikes`;

DELIMITER $$

 
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddUpdateLikes`(
    p_project_id int,
    p_user_id int,
    p_like int
)
BEGIN
    if (select exists (select 1 from tbl_likes where project_id = p_project_id and user_id = p_user_id)) then
 
         
        select project_like into @currentVal from tbl_likes where project_id = p_project_id and user_id = p_user_id;
         
        if @currentVal = 0 then
            update tbl_likes set project_like = 1 where project_id = p_project_id and user_id = p_user_id;
        else
            update tbl_likes set project_like = 0 where project_id = p_project_id and user_id = p_user_id;
        end if;
         
    else
         
        insert into tbl_likes(
            project_id,
            user_id,
			project_like
        )
        values(
            p_project_id,
            p_user_id,
            p_like
        );
 
    end if;
END