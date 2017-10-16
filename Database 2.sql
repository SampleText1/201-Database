use test;
CREATE TABLE orders (
    ord_num INTEGER NOT NULL,
    PRIMARY KEY (ord_num , ord_proID),
    FOREIGN KEY (ord_cusID)
        REFERENCES customer (cus_ID),
    FOREIGN KEY (ord_proID)
        REFERENCES products (pro_ID),
    ord_date VARCHAR(20),
    ord_cusID INTEGER NOT NULL,
    ord_proID INTEGER NOT NULL,
    ord_status VARCHAR(30),
    ord_quantity integer
);

insert into orders(ord_num, ord_date, ord_cusID, ord_proID, ord_quantity, ord_status)
values(1,"22.09.92", 3, 222, 4, "Sendt"),
(2, "24.09.92", 5, 111, 2, "Sendt"),
(3, "25.09.92", 4, 333, 1, "Sendt"),
(4, "26.09.92", 1, 444, 3, "Sendt"),
(5, "27.09.92", 2, 333, 3, "Sendt"),
(6, "28.09.92", 6, 666, 2, "Behandlet"),
(7, "29.09.92", 7, 999, 5, "Behandlet"),
(8, "30.09.92", 8, 333, 3, "Behandlet"),
(9, "01.10.92", 9, 555, 2, "Behandlet"),
(10, "02.10.92",10, 777,1, "Mottat"),
(11, "03.10.92", 1, 888,2, "Mottat"),
(12, "04.10.92", 5, 222,3,"Mottatt"),
(13, "04.10.92", 7, 111,4, "Mottat");

SELECT 
    LEFT(ord_name, 5)
FROM
    customer,
    orders,
    products
WHERE
    cus_ID = ord_cusID
        AND pro_ID = ord_proID
        AND ord_date LIKE '%08.15%'
        AND ord_name LIKE '%gra%';

SELECT 
    left(pro_name,10) as name, (pro_quantity-pro_reorder) as quantityBeforeReorder
FROM
    customer,
    orders,
    products
WHERE
    cus_ID = ord_cusID
        AND pro_ID = ord_proID
        AND pro_name LIKE '%en%';
        
        
        SELECT 
    cus_fname, ord_num, (pro_price*ord_quantity) as Sum
FROM
    customer,
    orders,
    products
WHERE
    cus_ID = ord_cusID
        AND pro_ID = ord_proID;
       
        

SELECT 
    *
FROM
    orders;

DELETE FROM orders 
WHERE
    cus_ID = ord_cusID;

DROP TABLE orders;

UPDATE orders 
SET 
    ord_date = '22.08.15'
WHERE
    ord_num = 001;

UPDATE orders 
SET 
    ord_date = '24.08.15'
WHERE
    ord_num = 002;

ALTER table orders
ADD ord_quantity INTEGER;

UPDATE orders 
SET 
    ord_quantity = 1
WHERE
    ord_num = 001;

UPDATE orders 
SET 
    ord_quantity = 1
WHERE
    ord_num = 002;

UPDATE orders 
SET 
    ord_quantity = 1
WHERE
    ord_num = 003;

SELECT 
    cus_fname, pro_quantity, pro_name
FROM
    customer
        INNER JOIN
    orders ON cus_ID = ord_cusID
        INNER JOIN
    products ON pro_id = ord_proid;
    
    drop table orders;
    
    create view sales as select cus_fname, ord_num, (ord_quantity*pro_price) as totalAmount 
FROM
    customer,
    orders,
    products
WHERE
    cus_ID = ord_cusID
        AND pro_ID = ord_proID;
        
        select * from sales;
        
        
        
	drop table orders;
    
    

