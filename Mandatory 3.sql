drop database example;
create database example;
use example;

create table Bruker(
bru_ID int primary key,
bru_navn varchar (20),
f_navn varchar (30),
e_navn varchar (30),
email varchar (30),
tlf int (8),
passord varchar (30),
er_admin int (1)
);


create table Kurs(
kur_ID int not null,
kur_navn varchar (40),
kur_kode varchar (20),

constraint kur_pk primary key (kur_ID)

);

create table kursMedlem(
med_kurID int,
med_bruID int,
med_er_admin int (1),

constraint med_fk1 foreign key (med_kurID) references Kurs(kur_ID),
constraint med_fk2 foreign key (med_bruID) references Bruker(bru_ID),
CONSTRAINT med_pk PRIMARY KEY (med_kurID, med_bruID)
);




create table Moduloppgave(
modopp_ID int primary key,
modopp_kurID int not null,
modopp_navn varchar(30),
modopp_besk varchar(100),
modopp_krav varchar (100),
modopp_handin int (1),
constraint modopp_fk foreign key (modopp_kurID) references Kurs(kur_ID)
);

create table Læringsmål(
mål_ID int primary key,
mål_modoppID int,
beskrivelse varchar(100),
constraint mal_fk foreign key (mål_modoppID) references Moduloppgave(modopp_ID)
);

create table Modulbesvarelse(
bes_ID int primary key,
bes_bruID int,
bes_modoppID int,
innhold varchar (500),
kommentar varchar(100),
constraint bes_fk1 foreign key (bes_bruID) references Bruker(bru_ID),
constraint bes_fk2 foreign key (bes_modoppID) references Moduloppgave(modopp_ID)
);

create table Tilbakemelding(
til_ID int primary key,
til_bruID int,
til_besID int,
innhold varchar(500),
poeng int,
constraint til_fk1 foreign key (til_bruID) references Bruker(bru_ID),
constraint til_fk2 foreign key (til_besID) references Modulbesvarelse(bes_ID)
);

create table Varsel(
var_ID int primary key,
var_kurID int, 
var_mel varchar (100),
constraint var_fk1 foreign key (var_kurID) references Kurs(kur_ID)
);

create table Blogg(
blo_ID int primary key,
blo_bruID int,
constraint blo_fk foreign key (blo_bruID) references Bruker(bru_ID)
);

create table Blogginnlegg(
inn_ID int primary key,
inn_kurID int,
inn_bloID int,
tittel varchar(30),
innhold varchar (500),
constraint inn_fk1 foreign key (inn_kurID) references Kurs(kur_ID),
constraint inn_fk2 foreign key (inn_bloID) references Blogg(blo_ID)

);

create table Studentstatus(
sta_ID int primary key,
gjennomsnitt int,
antpoeng int

);


insert into Bruker(bru_ID, bru_navn, f_navn, e_navn, email, tlf, passord, er_admin)
values(1, 'marigk', 'Marius', 'Kaurin', 'marius@hotmail.no', 96756431, 'abcd', 0),
(2, 'Prebt', 'Preben', 'Tjemsland', 'preben@gmail.com', 43567798, '1234', 0),
(3, '1/2geir', 'Hallgeir', 'Nilsen', 'hallgeir@gmail.com', 99451233, 'fnutter',1),
(4, 'Lornis', 'Jørgen', 'Kongsberg', 'jørgen@uia.no', 90674532, 'tripaloski',0),
(5, 'doyouEven', 'Even', 'Larsen', 'even@live.no', 45621398, 'Java', 1),
(6, 'Abdiman','Abdi', 'Gureye', 'abdi@gmail.com', 47431198, 'Homenet',0);

insert into Kurs(kur_ID, kur_navn, kur_kode)
values(1101, 'Introduksjon til Java', 'IS-109'),
(1102, 'Videre introduksjon til Java', 'IS-110');

insert into Kursmedlem(med_kurID, med_bruID, med_er_admin)
values(1101, 1, 0),
(1101, 3, 1);


insert into Moduloppgave(modopp_ID, modopp_kurID, modopp_navn, modopp_besk, modopp_krav, modopp_handin)
values(1, 1101, 'Modul 1: BlueJ', 'Åpne et prosjekt i BlueJ', 'Kunne åpne BlueJ og oprette et prosjekt',0 ),
(2, 1101, 'Modul 2', 'Lage et enkelt prosjekt', 'Lage et enkelt prosjekt, med funksjonalitet', 1),
(3, 1101, 'Modul 3', 'Bruke for og while loops i et prosjekt', 'Lage et prosjekt som tar i bruk for og while loops',1);
insert into Læringsmål(mål_ID, mål_modoppID, beskrivelse)
values(1, 1, 'Eleven ha bestått når han kan åpne et prosjekt i BlueJ');

insert into Modulbesvarelse(bes_ID, bes_bruID, bes_modoppID, innhold, kommentar)
values(1, 2, 1, 'Trykk "open prosject"', 'Levert av Preben'),
(2,3, 1, 'Trykk "new project"', 'Levert av Jørgen');
insert into Modulbesvarelse(bes_ID, bes_bruID, bes_modoppID, innhold, kommentar)
values(3, 2, 2, 'En terning', 'Levert av Preben');


insert into Tilbakemelding(til_ID, til_bruID, til_besID, innhold, poeng)
values(101, 2, 1, 'Godt gjort', 10),
(112,3,2, 'Ikke helt riktig', 5);

insert into Varsel (var_ID, var_kurID, var_mel)
values(1,1,'Husk å levere Modulbesvarelse innen fredag!');

Insert into Blogg(blo_ID, blo_bruID)
values(10,1),
(11,2);


select * from kursmedlem ;
describe kurs;
drop table Moduloppgave;
select * from Modulbesvarelse;
select bes_bruID, count(*) from Modulbesvarelse 
group by bes_ID;
where 
drop table Kurs;
select * from kurs;

create view userModule1 as select bru_navn, modopp_navn
from Bruker , Moduloppgave
group by bru_ID
order by count()
WITH READ ONLY;

