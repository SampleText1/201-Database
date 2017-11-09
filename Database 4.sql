use test;
create table invoice(
inv_num integer primary key,
inv_dateiss varchar(30),
inv_datepay varchar (30),
inv_creditnr integer,
inv_holdname varchar(30),
inv_expdate varchar(30),
inv_ordnum integer

);

insert into invoice(inv_num, inv_dateiss, inv_datepay, inv_creditnr, inv_holdname, inv_expdate)
values(1, "10.10.2017", "11.10.2017", 102030, "James Bond", "20.10.2017"),
(2, "1.10.2017", "5.10.2017", 304050, "Sherlock Holmes", "10.10.2017"),
(3, "25.09.2017", "27.10.2017", 607080, "Clark Kent", "01.10.2017");




select * from invoice;

drop table invoice;


SELECT 
    cus_fname, ord_num, (pro_price*ordc_quantity) as Sum
FROM
    customer
INNER JOIN orders on customer.cus_ID = orders.ord_cusID
INNER JOIN orderContent on orders.ord_num = orderContent.ordc_num
INNER JOIN products on orderContent.ordc_proID = products.pro_ID;




