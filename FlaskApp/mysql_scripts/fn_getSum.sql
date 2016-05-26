DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `getSum2`(
    p_project_id int
) RETURNS int(11)
BEGIN
    select COALESCE(sum(project_like), 0) into @sm from tbl_likes where project_id = p_project_id;
RETURN @sm;
END$$
DELIMITER ;