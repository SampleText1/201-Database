use test;
CREATE TABLE orders (
    ord_num INTEGER NOT NULL,
    PRIMARY KEY (ord_num ),
    FOREIGN KEY (ord_cusID)
        REFERENCES customer (cus_ID),
	constraint invnum foreign key (ord_invnum)
    references invoice (inv_num),
    ord_date VARCHAR(20),
    ord_cusID INTEGER NOT NULL,
    ord_status VARCHAR(30),
    ord_invnum integer
    
);

insert into orders(ord_num, ord_date, ord_cusID, ord_status)
values(1,"22.09.92", 3, "Sendt"),
(2, "24.09.92", 5, "Sendt"),
(3, "25.09.92", 4, "Sendt"),
(4, "26.09.92", 1, "Sendt"),
(5, "27.09.92", 2, "Sendt"),
(6, "28.09.92", 6, "Behandlet"),
(7, "29.09.92", 7, "Behandlet"),
(8, "30.09.92", 8, "Behandlet"),
(9, "01.10.92", 9, "Behandlet"),
(10, "02.10.92",10, "Mottat"),
(11, "03.10.92", 1, "Mottat"),
(12, "04.10.92", 5,"Mottatt"),
(13, "04.10.92", 7, "Mottat");

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
    cus_fname, ord_num, (pro_price*ordc_quantity) as Sum
FROM
    customer
INNER JOIN orders on customer.cus_ID = orders.ord_cusID
INNER JOIN orderContent on orders.ord_num = orderContent.ordc_num
INNER JOIN products on orderContent.ordc_proID = products.pro_ID;


describe products



describe customer
select * from orderContent
        
        
CREATE VIEW sale as select cus_fname, ord_num, (ordc_quantity*pro_price) as totalAmount 
FROM
    customer
INNER JOIN orders on customer.cus_ID = orders.ord_cusID
INNER JOIN orderContent on orders.ord_num = orderContent.ordc_num
INNER JOIN products on orderContent.ordc_proID = products.pro_ID;


       
        

SELECT 
    *
FROM
    sale;

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
    pro_ID, ordc_quantity
FROM
    customer
        INNER JOIN
    orders ON cus_ID = ord_cusID
        INNER JOIN
    products ON pro_id = ordc_proid;
    
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
    
    

