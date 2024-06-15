DELIMITER $$
CREATE PROCEDURE between_values(IN value1 INT, IN value2 INT)
BEGIN
SELECT lname as last_name, fname as first_name
FROM reservation_offers
WHERE pre_cost BETWEEN value1 AND value2;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE details (IN lastname VARCHAR(20))
BEGIN
SELECT lname as last_name, fname as first_name, offers_id as offer_id
FROM reservation_offers
inner join offers on offers_id=sp_offers_id
WHERE lname=lastname 
GROUP BY offers_id;
IF(SELECT COUNT(*)
FROM reservation_offers
WHERE lname=lastname)>1
THEN SELECT DISTINCT  lname as last_name ,COUNT(*)
FROM reservation_offers
inner join offers on offers_id=sp_offers_id
WHERE lname=lastname 
GROUP BY offers_id;
END IF;


END$$
DELIMITER ;
