use test;
CREATE TABLE products (
    pro_name VARCHAR(40),
    pro_price INTEGER,
    pro_quantity INTEGER,
    pro_ID INTEGER NOT NULL,
    PRIMARY KEY (pro_ID)
);

insert into products (pro_name, pro_price, pro_quantity, pro_ID)
values ("Grafikkort", 2999, 20, 001);

insert into products (pro_name, pro_price, pro_quantity, pro_ID)
values ("Hovedkort", 1999, 20, 002);

insert into products (pro_name, pro_price, pro_quantity, pro_ID)
values ("Star Wars", 199, 30, 003);

insert into products (pro_name, pro_price, pro_quantity, pro_ID)
values ("Starcraft II", 499, 50, 004);

SELECT 
    *
FROM
    products;