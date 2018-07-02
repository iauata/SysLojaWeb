 DELIMITER $$  
 
 USE `lojaweb`$$
 
 DROP FUNCTION IF EXISTS `fct_crypt_str`$$  

 CREATE FUNCTION `fct_crypt_str`(p_str VARCHAR(15)) RETURNS VARCHAR(40)  
 BEGIN    
                        
     RETURN SHA1(p_str);  
     
 END$$ 
 
 DELIMITER ;