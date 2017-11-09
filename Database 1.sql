use test;
CREATE TABLE customer (
    cus_ID INTEGER NOT NULL,
    PRIMARY KEY (cus_ID),
    cus_fname VARCHAR(20),
    cus_lname VARCHAR(20) DEFAULT 'Smith',
    cus_adress VARCHAR(30),
    cus_mail VARCHAR(30),
    cus_phone INTEGER,
    cus_username VARCHAR(30)
    
);

insert into customer(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username)
values(1, 'Preben', 'Tjemsland', 'Stavanger', 'preben@mail', 113, 'Kripsus'),
(2, 'Jørgen', 'Kongsberg', 'Fredrikstad', 'jørgen@mail', 110, 'Ripsus'),
(3, 'Marius', 'Kaurin', 'Moss', 'marius@mail', 111, 'Krektus'),
(4, 'Mikael', 'Kimerud', 'Bamble', 'mikael@mail', 114, 'Mikime'),
(5, 'Kaula', 'Smith', 'Texas', 'kaula@mail', 115, 'kausmi'),
(6, 'Per', 'Olsen', 'Hamar', 'Per@mail', 116, 'Perol'),
(7, 'George', 'Clooney', 'Lexington', 'George@mail', 117, 'Geoclo'),
(8, 'Donald', 'Trump', 'New York', 'Donald@mail', 118, 'Dontru'),
(9, 'Charlotte', 'Aubert', 'Paris', 'Charlotte@mail', 119, 'Chaube'),
(10, 'Fred', 'Flintstone', 'Bedrock', 'Fred@mail', 120, 'Freflin'),
(11, 'Abdi', 'Gureye', 'Rud', 'Abdi@mail', 112, 'Abdigur');

update customer
set cus_phone = 200 where cus_fname = 'Marius';
commit;



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
    
drop table customer;