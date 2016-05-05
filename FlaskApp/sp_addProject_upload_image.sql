USE `BucketList`;
DROP procedure IF EXISTS `BucketList`.`sp_addProject`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addProject`(
    IN p_title varchar(255),
    IN p_category varchar(255),
    IN p_completion_time varchar(255),
    IN p_num_collaborators varchar(255),
    IN p_description text,
    IN p_tags text,
    IN p_user_id bigint, 
    IN p_file_path varchar(200)
)
BEGIN
    insert into tbl_projects(
        proj_title,
        proj_category,
        proj_completion_time,
        proj_n_collaborators,
        proj_description,
        proj_tags,
        proj_user_id,
        proj_date, 
        proj_file_path
    )
    values
    (
        p_title,
        p_category,
        p_completion_time,
        p_num_collaborators,
        p_description,
        p_tags,
        p_user_id,
        NOW(),
        p_file_path
    );
END$$
 
DELIMITER ;
;