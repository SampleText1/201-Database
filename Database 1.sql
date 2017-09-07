use test;
create table store (
cus_ID integer not null,
primary key(cus_ID),
cus_fname varchar (20),
cus_lname varchar(20) default 'Smith',
cus_adress varchar(30),
cus_mail varchar(30),
cus_phone integer,
cus_username varchar(30) 
);

insert into store(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username)
values(1, 'Preben', 'Tjemsland', 'homseby', 'preben@mail', 113, 'Kripsus');


select * from store; 
 