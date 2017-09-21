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
values ("Grafikkort", 2999, 20, 001, 5);

insert into products (pro_name, pro_price, pro_quantity, pro_ID, pro_reorder)
values ("Hovedkort", 1999, 20, 002, 5);

insert into products (pro_name, pro_price, pro_quantity, pro_ID, pro_reorder)
values ("Star Wars", 199, 30, 003, 5);

insert into products (pro_name, pro_price, pro_quantity, pro_ID, pro_reorder)
values ("Starcraft II", 499, 50, 004, 5);

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