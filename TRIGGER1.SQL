  
  
  create table log (
	user varchar(80),
    action varchar(20)
  );
  

  DELIMITER $$
  CREATE TRIGGER delete_trip
  AFTER delete ON trip
  FOR EACH ROW
	BEGIN
        INSERT into log
        VALUES(current_user () ,'delete');
        
        END$$
        DELIMITER ;
        
        SELECT * FROM LOG;
        SELECT * FROM trip;
        INSERT INTO trip VALUES(35,	'2022-01-03 10:00:00',	'2022-01-03 12:00:00',	20	,200.00,	3,	'A020',	'A006');
        
		
  

  
  