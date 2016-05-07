DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `getSum2`(
    p_project_id int
) RETURNS int(11)
BEGIN
    select sum(project_like) into @sm from tbl_likes where project_id = p_project_id;
RETURN @sm;
END$$
DELIMITER ;