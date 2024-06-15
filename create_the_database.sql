CREATE DATABASE travel_agency;

USE travel_agency;

CREATE TABLE phones
(
 ph_br_code INT(11) AUTO_INCREMENT,
 ph_number  CHAR(10) DEFAULT 'unknown' NOT NULL,
 PRIMARY KEY (ph_number, ph_br_code),
 FOREIGN KEY (ph_br_code) REFERENCES branch(br_code)
 ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE manages
(
 mng_adm_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
 mng_br_code INT(11) AUTO_INCREMENT,
 PRIMARY KEY (mng_adm_AT, mng_br_code),
 FOREIGN KEY(mng_br_code) REFERENCES branch(br_code)
 ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE event
(
 ev_tr_id INT(11) AUTO_INCREMENT,
 ev_start DATETIME DEFAULT 'unknown' NOT NULL,
 ev_end DATETIME DEFAULT 'unknown' NOT NULL,
 ev_descr TEXT DEFAULT 'unknown' NOT NULL,
 PRIMARY KEY (ev_tr_id, ev_start),
 FOREIGN KEY(ev_tr_id) REFERENCES trip(tr_id)
 ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE languages
(
 lng_gui_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
 lng_language VARCHAR(30) DEFAULT 'unknown' NOT NULL,
 PRIMARY KEY (lng_gui_AT, lng_language),
 FOREIGN KEY(lng_gui_AT) REFERENCES guide(gui_AT)
 ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE reservation
(
 res_tr_id INT(11) AUTO_INCREMENT,
 res_seatnum TINYINT(4) NOT NULL,
 res_name VARCHAR(20)  DEFAULT 'unknown' NOT NULL,
 res_lname VARCHAR(20) DEFAULT  'unknown' NOT NULL,
 res_isadult ENUM ('ADULT', 'MINOR') NOT NULL,
 PRIMARY KEY(res_tr_id, res_seatnum),
 FOREIGN KEY(res_tr_id) REFERENCES trip(tr_id)
 ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE travel_to
(
 to_tr_id INT(11) AUTO_INCREMENT,
 to_dst_id INT(11) AUTO_INCREMENT,
 to_arrival DATETIME DEFAULT 'unknown' NOT NULL,
 to_departure DATETIME DEFAULT 'unknown' NOT NULL,
 PRIMARY KEY(to_tr_id, to_dst_id),
 FOREIGN KEY(to_dst_id) REFERENCES destination(dst_id)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY(to_tr_id) REFERENCES trip(tr_id)
 ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE driver
(
 drv_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
 drv_license ENUM ('A', 'B', 'C', 'D'),
 drv_route ENUM ('LOCAL', 'ABROAD'),
 drv_experience TINYINT(4),
 PRIMARY KEY (drv_AT),
 FOREIGN KEY(drv_AT) REFERENCES worker(wrk_AT)
 ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE destination
(
 dst_id INT(11) AUTO_INCREMENT,
 dst_name VARCHAR(50) DEFAULT 'unknown' NOT NULL,
 dst_descr TEXT DEFAULT 'unknown' NOT NULL,
 dst_rtype ENUM ('LOCAL', 'ABROAD'),
 dst_language VARCHAR(30) DEFAULT 'unknown' NOT NULL,
 dst_location INT(11) NOT NULL,
 PRIMARY KEY(dst_id),
 FOREIGN KEY (dst_location) REFERENCES destination(dst_id)
 ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE guide 
(
 gui_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
 gui_cv TEXT DEFAULT 'unknown' NOT NULL,
 PRIMARY KEY(gui_AT) 
);


CREATE TABLE trip
(
 tr_id INT(11) AUTO_INCREMENT,
 tr_departure DATETIME DEFAULT 'unknown' NOT NULL,
 tr_return DATETIME DEFAULT 'unknown' NOT NULL,
 tr_maxseats TINYINT(4) NOT NULL,
 tr_cost FLOAT(7,2) NOT NULL,
 tr_br_code INT(11) NOT NULL,
 tr_gui_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
 tr_drv_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
 PRIMARY KEY (tr_id),
 FOREIGN KEY(tr_br_code) REFERENCES branch(br_code)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY(tr_drv_AT) REFERENCES driver(drv_AT)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY(tr_gui_AT) REFERENCES guide(gui_AT)
 ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE worker
(
 wrk_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
 wrk_name VARCHAR(20) DEFAULT 'unknown' NOT NULL,
 wrk_lname VARCHAR(20) DEFAULT 'unknown' NOT NULL,
 wrk_salary FLOAT(7,2) NOT NULL,
 wrk_br_code INT(11) NOT NULL,
 PRIMARY KEY(wrk_AT),
 FOREIGN KEY(wrk_br_code) REFERENCES branch(br_code)
 ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE admin
(
 adm_AT CHAR(10) DEFAULT 'unknown' NOT NULL,
 adm_type ENUM ('LOGISTICS', 'ADMINISTRATIVE', 'ACCOUNTING'),
 adm_diploma VARCHAR(200),
 PRIMARY KEY(adm_AT),
 FOREIGN KEY(adm_AT) REFERENCES worker(wrk_AT)
);


CREATE TABLE branch
(
 br_code INT(11) NOT NULL,
 br_street VARCHAR(30) DEFAULT 'unknown' NOT NULL,
 br_num INT(4) NOT NULL,
 br_city VARCHAR(30) DEFAULT 'unknown' NOT NULL,
 PRIMARY KEY(br_code) 
);
CREATE TABLE reservation_offers (
  res_offers_id int NOT NULL AUTO_INCREMENT,
  lname varchar(20) DEFAULT NULL,
  fname varchar(20) DEFAULT NULL,
  sp_offers_id int DEFAULT NULL,
  pre_cost int DEFAULT NULL,
  PRIMARY KEY (res_offers_id),
  FOREIGN KEY (sp_offers_id) REFERENCES offers (offers_id) 
  ON UPDATE CASCADE ON DELETE CASCADE
) ;
CREATE TABLE offers (
  offers_id int NOT NULL AUTO_INCREMENT,
  start_date date NOT NULL,
  end_date date NOT NULL,
  cost int DEFAULT NULL,
  dst_id int DEFAULT NULL,
  PRIMARY KEY (offers_id),
  
   FOREIGN KEY (dst_id) REFERENCES destination (dst_id) ON DELETE CASCADE ON UPDATE CASCADE
) ;
CREATE TABLE it(
  IT_AT char(10) NOT NULL,
  IT_password char(10) DEFAULT 'password',
  start_date date NOT NULL,
  end_date date DEFAULT NULL,
  PRIMARY KEY (IT_AT),
  CONSTRAINT it_ibfk_1 FOREIGN KEY (IT_AT) REFERENCES worker (wrk_AT)
) ;





INSERT INTO phones (ph_number,ph_br_code) VALUES ('0934567891', 1);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('0934567892', 2);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('0934567893', 3);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('0934567894', 4);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('0934567895', 5);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('0934567896', 6);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('0934567897', 7);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('0934567898', 8);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('0934567899', 9);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('0934567890', 10);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('09345678911', 11);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('09345678912', 12);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('09345678913', 13);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('09345678914', 14);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('09345678915', 15);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('09345678916', 16);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('09345678917', 17);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('09345678918', 18);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('09345678919', 19);
INSERT INTO phones (ph_number,ph_br_code) VALUES ('09345678920', 20);



INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (3, 3, 'Michael','Williams','ADULT');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (4, 4, 'Emily','Jones','ADULT');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (5, 5, 'Madison','Brown','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (6, 6, 'Jacob','Miller','ADULT');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (7, 7, 'Olivia','Davis','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (8, 8, 'Isabella','Garcia','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (9, 9, 'Ethan','Rodriguez','ADULT');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (10, 10, 'Aria','Martinez','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (11, 11, 'Elijah','Hernandez','ADULT');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (12, 12, 'Avery','Lopez','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (13, 13, 'Lily','Gonzalez','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (14, 14, 'Eli','Wilson','ADULT');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (15, 15, 'Sofia','Anderson','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (16, 16, 'Mia','Thomas','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (17, 17, 'Evelyn','Jackson','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (19, 19, 'Natalie','DiMaria','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (20, 20, 'Margaret','Dybala','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (19, 21, 'James','German','MINOR');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (18, 22, 'Simon','Grealish','ADULT');
INSERT INTO reservation (res_tr_id,res_seatnum,res_name,res_lname,res_isadult) VALUES (17, 23, 'Erietta','Messi','MINOR');


INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (1, 15, '2022-01-01 12:00:00', '2022-01-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (2, 13, '2022-02-01 12:00:00', '2022-02-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (3, 12, '2022-03-01 12:00:00', '2022-03-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (4, 11, '2022-04-01 12:00:00', '2022-04-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (5, 10, '2022-05-01 12:00:00', '2022-05-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (6, 9, '2022-06-01 12:00:00', '2022-06-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (7, 8, '2022-07-01 12:00:00', '2022-07-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (8, 5, '2022-08-01 12:00:00', '2022-08-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (9, 4, '2022-09-01 12:00:00', '2022-09-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (10, 3, '2022-10-01 12:00:00', '2022-10-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (11, 1, '2022-11-01 12:00:00', '2022-11-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (12, 2, '2022-12-01 12:00:00', '2022-12-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (13, 17, '2023-01-01 12:00:00', '2023-01-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (14, 20, '2023-02-01 12:00:00', '2023-02-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (15, 19, '2023-03-01 12:00:00', '2023-03-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (16, 14, '2023-04-01 12:00:00', '2023-04-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (17, 16, '2023-05-01 12:00:00', '2023-05-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (18, 18, '2023-06-01 12:00:00', '2023-06-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (19, 6, '2023-07-01 12:00:00', '2023-07-02 12:00:00');
INSERT INTO travel_to (to_tr_id, to_dst_id, to_arrival, to_departure) VALUES (20, 7, '2023-08-01 12:00:00', '2023-08-02 12:00:00');


INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A001', 1);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A002', 2);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A003', 3);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A004', 4);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A004', 5);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A001', 6);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A002', 7);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A003', 8);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A004', 9);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A003', 10);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A004', 11);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A002', 12);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A003', 13);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A001', 14);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A002', 15);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A001', 16);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A003', 17);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A002', 18);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A004', 19);
INSERT INTO manages (mng_adm_AT, mng_br_code) VALUES ('A003', 20);


INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (1, '2022-01-01 12:00:00', '2022-01-01 14:00:00', 'Event 1 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (2, '2022-01-02 14:00:00', '2022-01-02 16:00:00', 'Event 2 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (3, '2022-01-03 10:00:00', '2022-01-03 12:00:00', 'Event 3 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (4, '2022-01-04 09:00:00', '2022-01-04 11:00:00', 'Event 4 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (5, '2022-01-05 08:00:00', '2022-01-05 10:00:00', 'Event 5 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (6, '2022-01-06 07:00:00', '2022-01-06 09:00:00', 'Event 6 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (7, '2022-01-07 06:00:00', '2022-01-07 08:00:00', 'Event 7 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (8, '2022-01-08 05:00:00', '2022-01-08 07:00:00', 'Event 8 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (9, '2022-01-09 04:00:00', '2022-01-09 06:00:00', 'Event 9 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (10, '2022-01-10 03:00:00', '2022-01-10 05:00:00', 'Event 10 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (11, '2022-01-11 02:00:00', '2022-01-11 04:00:00', 'Event 11 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (12, '2022-01-12 01:00:00', '2022-01-12 03:00:00', 'Event 12 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (13, '2022-01-13 00:00:00', '2022-01-13 02:00:00', 'Event 13 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (14, '2022-01-14 23:00:00', '2022-01-14 01:00:00', 'Event 14 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (15, '2022-01-15 22:00:00', '2022-01-15 00:00:00', 'Event 15 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (16, '2022-01-16 21:00:00', '2022-01-16 23:00:00', 'Event 16 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (17, '2022-01-17 20:00:00', '2022-01-17 22:00:00', 'Event 17 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (18, '2022-01-18 19:00:00', '2022-01-18 21:00:00', 'Event 18 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (19, '2022-01-19 18:00:00', '2022-01-19 20:00:00', 'Event 19 Description');
INSERT INTO event (ev_tr_id, ev_start, ev_end, ev_descr) VALUES (20, '2022-01-20 17:00:00', '2022-01-20 19:00:00', 'Event 20 Description');


INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A001', 'English');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A002', 'French');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A003', 'German');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A004', 'Spanish');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A005', 'Italian');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A006', 'Portuguese');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A007', 'Russian');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A008', 'Chinese');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A009', 'Japanese');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A010', 'Korean');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A011', 'Arabic');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A012', 'Hindi');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A013', 'Bengali');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A014', 'Polish');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A015', 'Dutch');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A016', 'Swedish');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A017', 'Danish');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A018', 'Turkish');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A019', 'Czech');
INSERT INTO languages (lng_gui_AT, lng_language) VALUES ('A020', 'Greek');


INSERT INTO guide (gui_AT, gui_name, gui_lname, gui_dob, gui_gender) VALUES ('A015', 'Johanna', 'Penguin', '1999-03-15', 'F');
INSERT INTO guide (gui_AT, gui_name, gui_lname, gui_dob, gui_gender) VALUES ('A016', 'Nicholas', 'Martin', '1990-03-01', 'M');
INSERT INTO guide (gui_AT, gui_name, gui_lname, gui_dob, gui_gender) VALUES ('A017', 'Abigail', 'Thompson', '1995-04-01', 'F');
INSERT INTO guide (gui_AT, gui_name, gui_lname, gui_dob, gui_gender) VALUES ('A018', 'Christopher', 'Garcia', '2000-05-01', 'M');
INSERT INTO guide (gui_AT, gui_name, gui_lname, gui_dob, gui_gender) VALUES ('A019', 'Alyssa', 'Martinez', '1985-06-01', 'F');
INSERT INTO guide (gui_AT, gui_name, gui_lname, gui_dob, gui_gender) VALUES ('A020', 'Brandon', 'Robinson', '1990-07-01', 'M');

INSERT INTO driver (drv_AT, drv_license, drv_route, drv_experience) VALUES ('A006', 'A', 'ABROAD', 10);
INSERT INTO driver (drv_AT, drv_license, drv_route, drv_experience) VALUES ('A007', 'B', 'LOCAL', 7);
INSERT INTO driver (drv_AT, drv_license, drv_route, drv_experience) VALUES ('A008', 'C', 'ABROAD', 20);
INSERT INTO driver (drv_AT, drv_license, drv_route, drv_experience) VALUES ('A009', 'A', 'LOCAL', 18);
INSERT INTO driver (drv_AT, drv_license, drv_route, drv_experience) VALUES ('A010', 'B', 'ABROAD', 15);
INSERT INTO driver (drv_AT, drv_license, drv_route, drv_experience) VALUES ('A011', 'C', 'LOCAL', 12);
INSERT INTO driver (drv_AT, drv_license, drv_route, drv_experience) VALUES ('A012', 'A', 'ABROAD', 8);
INSERT INTO driver (drv_AT, drv_license, drv_route, drv_experience) VALUES ('A013', 'B', 'LOCAL', 5);
INSERT INTO driver (drv_AT, drv_license, drv_route, drv_experience) VALUES ('A014', 'C', 'ABROAD', 10);


INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (1, 'Paris', 'The city of love', 'LOCAL', 'French', 2);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (2, 'Rome', 'The eternal city', 'ABROAD', 'Italian',1);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (3, 'New York', 'The city that never sleeps', 'ABROAD', 'English',4);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (4, 'Tokyo', 'The most populous city in the world', 'ABROAD', 'Japanese',3);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (5, 'Sydney', 'The largest city in Australia', 'LOCAL', 'English',2);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (6, 'London', 'The capital of England', 'LOCAL', 'English',1);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (7, 'Barcelona', 'Famous for its architecture', 'ABROAD', 'Spanish',2);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (8, 'Beijing', 'The capital of China', 'ABROAD', 'Chinese',4);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (9, 'Cairo', 'The city of the Pharaohs', 'ABROAD', 'Arabic',5);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (10, 'Dubai', 'The city of Luxury', 'LOCAL', 'Arabic',6);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (11, 'Hong Kong', 'The city of skyscrapers', 'ABROAD', 'Chinese',7);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (12, 'Las Vegas', 'The entertainment capital of the world', 'ABROAD', 'English',8);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (13, 'Mexico City', 'The capital of Mexico', 'LOCAL', 'Spanish',9);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (14, 'Moscow', 'The capital of Russia', 'ABROAD', 'Russian',10);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (15, 'Mumbai', 'The financial capital of India', 'ABROAD', 'Hindi',11);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (16, 'Seoul', 'The capital of South Korea', 'ABROAD', 'Korean',12);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (17, 'Shanghai', 'The commercial capital of China', 'ABROAD', 'Chinese',13);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (18, 'Singapore', 'The city-state of Southeast Asia', 'LOCAL', 'English',14);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (19, 'Taipei', 'The capital of Taiwan', 'ABROAD', 'Mandarin',15);
INSERT INTO destination (dst_id, dst_name, dst_descr, dst_rtype, dst_language, dst_location) VALUES (20, 'Venice', 'The city of canals', 'LOCAL', 'Italian',16);


INSERT INTO branch (br_code, br_street, br_num, br_city) VALUES (1, 'Main St', '23', 'New York');
INSERT INTO branch (br_code, br_street, br_num, br_city) VALUES (2, 'Elm St', '45', 'Los Angeles');
INSERT INTO branch (br_code, br_street, br_num, br_city) VALUES (3, 'Market St', '56', 'San Francisco');
INSERT INTO branch (br_code, br_street, br_num, br_city) VALUES (4, 'Park Ave', '78', 'New York');
INSERT INTO branch (br_code, br_street, br_num, br_city) VALUES (5, 'Maple St', '90', 'Chicago');



INSERT INTO trip (tr_id, tr_departure, tr_return, tr_maxseats, tr_cost, tr_br_code, tr_gui_AT, tr_drv_AT) VALUES
(1, '2022-01-01 10:00:00', '2022-01-01 12:00:00', 20, 100.00, 1, 'A015', 'A014'),
(2, '2022-01-02 10:00:00', '2022-01-02 12:00:00', 20, 150.00, 2, 'A016', 'A010'),
(3, '2022-01-03 10:00:00', '2022-01-03 12:00:00', 20, 200.00, 3, 'A020', 'A006'),
(4, '2022-01-04 10:00:00', '2022-01-04 12:00:00', 20, 250.00, 4, 'A016', 'A007'),
(5, '2022-01-05 10:00:00', '2022-01-05 12:00:00', 20, 300.00, 5, 'A018', 'A008'),
(6, '2022-01-06 10:00:00', '2022-01-06 12:00:00', 20, 350.00, 6, 'A020', 'A006'),
(7, '2022-01-07 10:00:00', '2022-01-07 12:00:00', 20, 400.00, 7, 'A020', 'A007'),
(8, '2022-01-08 10:00:00', '2022-01-08 12:00:00', 20, 450.00, 8, 'A017', 'A008'),
(9, '2022-01-09 10:00:00', '2022-01-09 12:00:00', 20, 500.00, 9, 'A015', 'A009'),
(10, '2022-01-10 10:00:00', '2022-01-10 12:00:00', 20, 550.00, 10, 'A016','A010'),
(11, '2022-01-11 10:00:00', '2022-01-11 12:00:00', 20, 600.00, 11, 'A018','A011'),
(12, '2022-01-12 10:00:00', '2022-01-12 12:00:00', 20, 650.00, 12, 'A019', 'A012'),
(13, '2022-01-13 10:00:00', '2022-01-13 12:00:00', 20, 700.00, 13, 'A018', 'A013'),
(14, '2022-01-14 10:00:00', '2022-01-14 12:00:00', 20, 750.00, 14, 'A020', 'A014'),
(15, '2022-01-15 10:00:00', '2022-01-15 12:00:00', 20, 750.00, 15, 'A015', 'A006'),
(16, '2022-01-16 10:00:00', '2022-01-16 12:00:00', 20, 800.00, 16, 'A016', 'A007'),
(17, '2022-01-17 10:00:00', '2022-01-17 12:00:00', 20, 850.00, 17, 'A017', 'A013'),
(18, '2022-01-18 10:00:00', '2022-01-18 12:00:00', 20, 900.00, 18, 'A018', 'A014'),
(19, '2022-01-19 10:00:00', '2022-01-19 12:00:00', 20, 950.00, 19, 'A019', 'A012'),
(20, '2022-01-20 10:00:00', '2022-01-20 12:00:00', 20, 1000.00, 20, 'A020', 'A011');


INSERT INTO admin (adm_AT, adm_type, adm_diploma) VALUES
('A001', 'LOGISTICS', 'Bachelors in Logistics'),
('A002', 'ADMINISTRATIVE', 'Masters in Business Administration'),
('A003', 'ACCOUNTING', 'Bachelors in Accounting'),
('A004', 'LOGISTICS', 'Masters in Supply Chain Management'),
('A005', 'ADMINISTRATIVE', 'Bachelors in Public Administration');


INSERT INTO worker (wrk_AT, wrk_name, wrk_lname, wrk_salary, wrk_br_code) VALUES
('A001', 'John', 'Doe', 35000.00, 1),
('A002', 'Jane', 'Smith', 40000.00, 2),
('A003', 'Michael', 'Johnson', 45000.00, 3),
('A004', 'Emily', 'Williams', 50000.00, 4),
('A005', 'Matthew', 'Jones', 50000.00, 5),
('A006', 'Daniel', 'Brown', 55000.00, 6),
('A007', 'David', 'Miller', 60000.00, 7),
('A008', 'William', 'Moore', 65000.00, 8),
('A009', 'Joseph', 'Anderson', 70000.00, 9),
('A010', 'Joshua', 'Thomas', 75000.00, 10),
('A011', 'Jacob', 'Jackson', 80000.00, 11),
('A012', 'Nicholas', 'White', 85000.00, 12),
('A013', 'Christopher', 'Harris', 90000.00, 13),
('A014', 'Ryan', 'Martin', 95000.00, 14),
('A015', 'Eric', 'Thompson', 100000.00, 15),
('A016', 'Stephen', 'Garcia', 105000.00, 16),
('A017', 'Andrew', 'Martinez', 110000.00, 17),
('A018', 'Edward', 'Robinson', 115000.00, 18),
('A019', 'Jonathan', 'Clark', 120000.00, 19),
('A020', 'Adam', 'Rodriguez', 125000.00, 20);

















































drop database




