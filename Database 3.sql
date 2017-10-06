use test;
CREATE TABLE products (
    pro_name VARCHAR(40),
    pro_price INTEGER,
    pro_quantity INTEGER,
    pro_ID INTEGER NOT NULL,
    PRIMARY KEY (pro_ID),
    pro_reorder INTEGER
);

insert into products (pro_name, pro_price, pro_quantity, pro_ID, pro_reorder)
values ("Grafikkort", 2999, 20, 001, 5),
("Hovedkort", 1999, 20, 002, 5),
("Star Wars", 199, 30, 003, 5),
("Starcraft II", 499, 50, 004, 5),
("Datamus", 599, 20, 005, 5),
("Tastatur", 899, 10, 006, 5),
("Skjerm", 1199, 40, 007, 5),
("Harddisk", 999, 25, 008, 5),
("Prosessor", 2499, 15, 009, 5);

SELECT 
    *
FROM
    products;
    
drop table products;

UPDATE products 
SET 
    pro_reorder = 5
WHERE
    pro_ID = 004;


alter table products
add pro_reorder integer;