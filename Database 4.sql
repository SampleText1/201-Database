use test;
create table invoice(
inv_num integer primary key,
inv_dateiss varchar(30),
inv_datepay varchar (30),
inv_creditnr integer,
inv_holdname varchar(30),
inv_expdate varchar(30)
);

insert into invoice(inv_num, inv_dateiss, inv_datepay, inv_creditnr, inv_holdname, inv_expdate)
values(1, "10.10.2017", "11.10.2017", 102030, "James Bond", "20.10.2017"),
(2, "1.10.2017", "5.10.2017", 304050, "Sherlock Holmes", "10.10.2017"),
(3, "25.09.2017", "27.10.2017", 607080, "Clark Kent", "01.10.2017");

select * from invoice;