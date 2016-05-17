USE `BucketList`;
DROP procedure IF EXISTS `sp_addLanguages`;
 
DELIMITER $$
USE `BucketList`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addLanguages`(
    IN p_java int,
    IN p_python int,
    IN p_c int,
    IN p_ruby int,
    IN p_hadoop int,
    IN p_css int,
    IN p_php int,
    IN p_haskell int,
    IN p_mysql int,
    IN p_mathematica int,
    IN p_matlab int,
    IN p_solidworks int,
    IN p_cuda int,
    IN p_assembly int,
    IN p_user_id int
)
BEGIN
    replace into tbl_languages(
		 user_id,
		 Java,
		 Python,
		 C,
		 Ruby,
		 Hadoop,
		 CSS,
		 PHP,
		 Haskell,
		 Mysql,
		 Mathematica,
		 Matlab,
		 Solid_Works, 
		 Cuda,
		 Assembly
    )
    values
    (
		 p_user_id,
		 p_java,
		 p_python,
		 p_c,
		 p_ruby,
		 p_hadoop,
		 p_css,
		 p_php,
		 p_haskell,
		 p_mysql,
		 p_mathematica,
		 p_matlab,
		 p_solidworks, 
		 p_cuda,
		 p_assembly
    );
END$$
 
DELIMITER ;