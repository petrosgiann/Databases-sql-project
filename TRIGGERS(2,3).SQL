
delimiter $$
CREATE trigger prevent
BEFORE UPDATE ON trip
FOR EACH ROW
BEGIN
IF (NEW.tr_departure <>OLD.tr_departure OR NEW.tr_return <> OLD.tr_return OR NEW.tr_cost <> OLD.tr_cost) AND (SELECT COUNT(*) FROM RESERVATION inner join trip on res_tr_id=tr_id WHERE res_tr_id=OLD.tr_id ) >0
THEN
SIGNAL SQLSTATE '45000'  
SET MESSAGE_TEXT= 'Cannot change departure date  or return date or cost for trip with existing reservations';
END IF;
END$$
delimiter ;

drop trigger prevent;


delimiter $$
CREATE trigger reduce_salary
BEFORE UPDATE ON worker
FOR EACH ROW
BEGIN
IF (NEW.wrk_salary < OLD.wrk_salary)
THEN
SIGNAL SQLSTATE '45000'  
SET MESSAGE_TEXT= 'Cannot reduce the salary of a worker';
END IF;
END$$
delimiter ;