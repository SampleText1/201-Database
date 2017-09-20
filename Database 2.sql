use test;
CREATE TABLE orders (
    ord_num INTEGER NOT NULL,
    PRIMARY KEY (ord_num),
    FOREIGN KEY (ord_cusID)
        REFERENCES store (cus_ID),
    ord_name VARCHAR(20),
    ord_date VARCHAR(20),
    ord_cusID INTEGER NOT NULL,
    ord_status VARCHAR(30)
);

insert into orders(ord_num, ord_name, ord_date, ord_cusID, ord_status)
values(1, "Hovedkort", "22.09.92", 3, "Sendt");

insert into orders(ord_num, ord_name, ord_date, ord_cusID, ord_status)
values(2, "Grafikkort", "24.09.92", 5, "Sendt");

SELECT 
    *
FROM
    store,
    orders
WHERE
    cus_ID = ord_cusID;

SELECT 
    *
FROM
    store
        INNER JOIN
    orders ON cus_ID = ord_cusID;

SELECT 
    *
FROM
    orders;

DELETE FROM
    orders
WHERE cus_ID = ord_cusID;