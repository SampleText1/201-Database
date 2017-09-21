use test;
CREATE TABLE customer (
    cus_ID INTEGER NOT NULL,
    PRIMARY KEY (cus_ID),
    cus_fname VARCHAR(20),
    cus_lname VARCHAR(20) DEFAULT 'Smith',
    cus_adress VARCHAR(30),
    cus_mail VARCHAR(30),
    cus_phone INTEGER,
    cus_username VARCHAR(30),
    cus_payment VARCHAR(30)
);

insert into customer(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username,cus_payment)
values(1, 'Preben', 'Tjemsland', 'homseby', 'preben@mail', 113, 'Kripsus', 'Bitcoins');

insert into customer(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username, cus_payment)
values(2, 'Jørgen', 'Kongsberg', 'Fredrikstad', 'jørgen@mail', 110, 'Ripsus', 'Mastercard');

insert into customer(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username, cus_payment)
values(3, 'Marius', 'Kaurin', 'Moss', 'marius@mail', 111, 'Krektus', 'Visa');

UPDATE customer 
SET 
    cus_adress = 'Kristiansand'
WHERE
    cus_ID = 3;

DELETE FROM customer 
WHERE
    cus_fname = 'Preben';

insert into customer(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username, cus_payment)
values(1, 'Abdi', 'Gureye', 'Rud', 'Abdi@mail', 112, 'Abdigur', 'Visa');

insert into customer(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username, cus_payment)
values(4, 'Mikael', 'Kimerud', 'Bamble', 'mikael@mail', 114, 'Mikime', 'Visa Debit');

insert into customer(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username, cus_payment)
values(5, 'Kaula', 'Smith', 'Texas', 'kaula@mail', 115, 'kausmi', 'Bitcoins');


SELECT 
    cus_fname, cus_mail
FROM
    customer;

SELECT 
    *
FROM
    customer
WHERE
    cus_fname LIKE '%Kau%';

SELECT 
    *
FROM
    customer;

describe customer;

DELETE FROM customer 
WHERE
    cus_ID = 5;
    
SELECT 
    cus_fname, ord_date, ord_status
FROM
    customer,
    orders
WHERE
    cus_ID = ord_cusID;
    
SELECT 
    cus_fname, ord_date, ord_status
FROM
    customer,
    orders;