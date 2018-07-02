DELIMITER $$

USE `lojaweb`

DROP FUNCTION IF EXISTS `fct_ValidaUsuario`

CREATE DEFINER=`root`@`localhost` FUNCTION `fct_ValidaUsuario`(v_login VARCHAR(45), v_senha VARCHAR(45)) RETURNS INT 
BEGIN
   
   DECLARE vid_usuario INT;
   
   SELECT id_usuario
     INTO vid_usuario
     FROM tab_usuario
    WHERE login = UPPER(v_login)
      AND senha = fct_crypt_str(v_senha);
   
   RETURN IFNULL(vid_usuario,0);

END;

DELIMITER ;