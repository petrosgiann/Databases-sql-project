delimiter $$
create procedure plan_trip(IN bra_code INT(11), IN start_date datetime, IN  end_date datetime)
BEGIN
SELECT tr_cost as cost,tr_maxseats as maxseats ,count(*) AS reservations,tr_maxseats-count(*) as empty_seats, t1.wrk_name as name_guide ,t1.wrk_lname AS lname_guide,t2.wrk_name AS name_driver,t2.wrk_lname AS lname_driver ,tr_departure as departure ,tr_return as trip_return 
from TRIP
inner join BRANCH on tr_br_code=br_code
inner join guide on gui_at=tr_gui_at
inner join worker AS t1 on t1.wrk_at=tr_gui_at
inner join driver on drv_AT=tr_drv_AT
inner join worker AS t2 on t2.wrk_at=tr_drv_AT
inner join reservation ON tr_id=res_tr_id
where br_code=bra_code AND tr_return > start_date AND tr_return < end_date 
group by res_tr_id;
END$$

delimiter ;