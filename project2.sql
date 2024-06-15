CREATE TABLE IT
(
 IT_AT CHAR(10),
 IT_password CHAR(10) DEFAULT 'password',
 start_date DATE NOT NULL,
 end_date  DATE,
 PRIMARY KEY(IT_AT),
 FOREIGN KEY(IT_AT) REFERENCES worker(wrk_AT)  
);

INSERT INTO IT (IT_AT, IT_password, start_date, end_date) VALUES ('A021', 'password', '2022-01-01', '2022-12-31');
INSERT INTO IT (IT_AT, IT_password, start_date, end_date) VALUES ('A022', 'password', '2022-02-01', NULL);
INSERT INTO IT (IT_AT, IT_password, start_date, end_date) VALUES ('A023', 'password', '2022-03-01', NULL);
INSERT INTO IT (IT_AT, IT_password, start_date, end_date) VALUES ('A024', 'password', '2022-04-01', NULL);