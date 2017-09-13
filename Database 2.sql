use test;
create table order (
p_order integer not null,
primary key(p_order),
p_name varchar (20),
p_date varchar(20),
p_delivery varchar(30),
p_status varchar(30)
)