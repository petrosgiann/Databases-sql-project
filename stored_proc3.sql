delimiter $$
create procedure delete_admin(IN fname VARCHAR(20),IN lname VARCHAR(20))
BEGIN
DECLARE admin_AT varchar(20);
Declare admin_type varchar(20);

SELECT distinct adm_type,adm_AT
INTO admin_type,admin_AT
FROM admin 
inner join worker on wrk_at=adm_at
WHERE wrk_name=fname and wrk_lname=lname;


 SET @result = (SELECT  EXISTS (SELECT DISTINCT 1 FROM manages WHERE mng_adm_AT = admin_AT));

IF (@result = 0  AND admin_type='ADMINISTRATIVE') THEN
  DELETE FROM admin WHERE  adm_AT=ADMIN_AT; 
  DELETE FROM worker WHERE wrk_name=fname AND wrk_lname=lname AND WRK_AT=ADMIN_AT;
 
  SELECT 'Deleted successfully
  ' as message;
 ELSE
SELECT 'No Delete' as message;
END IF ;

 END $$
delimiter ;





