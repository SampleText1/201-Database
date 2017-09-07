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

insert into store(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username)
values(2, 'Jørgen', 'Kongsberg', 'Fredrikstad', 'jørgen@mail', 110, 'Ripsus');

insert into store(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username)
values(3, 'Marius', 'Kaurin', 'Moss', 'marius@mail', 111, 'Krektus');

update store set cus_adress = 'Kristiansand' where cus_ID = 3;

delete from store where cus_fname = 'Preben';

insert into store(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username)
values(1, 'Abdi', 'Gureye', 'Rud', 'Abdi@mail', 112, 'Abdigur');

insert into store(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username)
values(4, 'Mikael', 'Kimerud', 'Bamble', 'mikael@mail', 114, 'Mikime');

insert into store(cus_ID, cus_fname, cus_lname, cus_adress, cus_mail, cus_phone, cus_username)
values(5, 'Kaula', 'Smith', 'Texas', 'kaula@mail', 115, 'kausmi');


Select cus_fname, cus_mail from store;

select * from store where cus_fname like '%Kau%';

select * from store;
 