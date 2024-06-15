DELIMITER $$
CREATE PROCEDURE add_driver(IN id_number CHAR(10), IN first_name VARCHAR(20), IN last_name VARCHAR(20), IN salary FLOAT(7,2), IN license_type ENUM('A','B','C','D'), IN route_type ENUM('LOCAL','ABROAD'), IN experience TINYINT)
BEGIN
DECLARE branch_code INT;
 SELECT br_code 
 into branch_code
    FROM branch 
    INNER JOIN worker ON worker.wrk_br_code = branch.br_code 
    INNER join driver ON drV_AT=wRK_AT
    GROUP BY branch.br_code 
    ORDER BY COUNT(worker.wrk_br_code) ASC 
    limit 1;
    INSERT INTO worker (wrk_AT, wrk_name, wrk_lname, wrk_salary, wrk_br_code) VALUES (id_number, first_name, last_name, salary, branch_code);
    INSERT INTO driver VALUES (id_number, license_type, route_type, experience);
END$$
DELIMITER ;


drop procedure add_driver;