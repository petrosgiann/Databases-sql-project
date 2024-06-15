CREATE TABLE offers
(
	offers_id INT(10) AUTO_INCREMENT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    cost INT(11),
    dst_id INT(11) ,
    PRIMARY KEY(offers_id),
    FOREIGN KEY (dst_id) REFERENCES destination(dst_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE reservation_offers
(
	res_offers_id INT(10) AUTO_INCREMENT,
    lname VARCHAR(20),
    fname VARCHAR(20),
    sp_offers_id INT(10),
    pre_cost INT(10),
    PRIMARY KEY(res_offers_id),
    FOREIGN KEY (sp_offers_id) REFERENCES offers(offers_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO offers (offers_id, start_date, end_date, cost, dst_id) VALUES 
(1, '2022-01-01', '2022-01-15', 1000, 1),
(2, '2022-02-01', '2022-02-15', 1500, 2),
(3, '2022-03-01', '2022-03-15', 2000, 3);