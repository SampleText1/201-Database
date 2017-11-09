use test;

create table orderContent(
ordc_num integer not null,
ordc_proID integer not null,
ordc_quantity integer,
constraint ordc_pk primary key (ordc_num, ordc_proID),
constraint ordc_fk2 foreign key (ordc_num)
references orders (ord_num),
constraint ordc_fk1 foreign key (ordc_proID)
references products (pro_ID)


); select*from ordercontent;

insert into orderContent(ordc_num, ordc_proID, ordc_quantity)
values(1, 111, 10),
(2, 222, 15),
(3, 333, 5),
(4, 444, 7),
(5,555, 4),
(6, 666, 2);




select*from sale;

drop table orderContent;