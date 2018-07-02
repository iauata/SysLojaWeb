DELIMITER $$

USE `lojaweb` $$

DROP PROCEDURE IF EXISTS `sp_InsereUsuario` $$

CREATE PROCEDURE sp_InsereUsuario(in v_nmusu  VARCHAR(45), in v_login VARCHAR(45), 
                                  in v_senha VARCHAR(45), in v_email VARCHAR(80), in v_tipouser tinyint(3), out iduser int)
BEGIN
	IF ( (v_nmusu != '') && (v_login != '') && (v_senha != '') && (v_email != '') && (IFNULL(v_tipouser, 0) > 0) ) THEN
	    
        INSERT INTO tab_usuario (nm_usuario, login,   senha,   email,   id_tipo_usuario)
						 VALUES (v_nome,     v_login, v_senha, v_email, v_tipouser );
		
        SELECT LAST_INSERT_ID() as iduser;
        
    ELSE
        SELECT 'Há campos vazios!' AS Msg;
    END IF; 
END;