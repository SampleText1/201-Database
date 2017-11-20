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
poeng int,
constraint til_fk1 foreign key (til_bruID) references Bruker(bru_ID),
constraint til_fk2 foreign key (til_besID) references Modulbesvarelse(bes_ID)
);

create table Kommentar(
kom_ID int auto_increment primary key ,
kom_tilID int,
kom_text varchar (500),
constraint kom_fk foreign key (kom_tilID) references Tilbakemelding(til_ID));

create table Resursser(
res_ID int auto_increment primary key,
res_modoppID int,
res_text varchar(500),
constraint res_fk foreign key (res_modoppID) references Moduloppgave(modopp_ID)
);

create table Spørsmål(
sp_ID int auto_increment primary key,
sp_modoppID int,
sp_text varchar (500),
constraint sp_fk foreign key (sp_modoppID) references Moduloppgave(modopp_ID)

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


insert into Moduloppgave(modopp_ID, modopp_kurID, modopp_navn, modopp_krav, modopp_handin)
values(1, 1101, 'Modul 1: BlueJ', 'Kunne åpne BlueJ og oprette et prosjekt',0 ),
(2, 1101, 'Modul 2', 'Lage et enkelt prosjekt, med funksjonalitet', 1),
(3, 1101, 'Modul 3', 'Lage et prosjekt som tar i bruk for og while loops',1);
insert into Læringsmål(mål_ID, mål_modoppID, beskrivelse)
values(1, 1, 'Eleven ha bestått når han kan åpne et prosjekt i BlueJ');

insert into Modulbesvarelse(bes_ID, bes_bruID, bes_modoppID, innhold, kommentar)
values(1, 2, 1, 'Trykk "open prosject"', 'Levert av Preben'),
(2,3, 1, 'Trykk "new project"', 'Levert av Jørgen');
insert into Modulbesvarelse(bes_ID, bes_bruID, bes_modoppID, innhold, kommentar)
values(3, 2, 2, 'En terning', 'Levert av Preben');


insert into Tilbakemelding(til_ID, til_bruID, til_besID, poeng)
values(101, 2, 1, 10),
(112,3,2, 5),
(113,2,3,7);

insert into Varsel (var_ID, var_kurID, var_mel)
values(1,1,'Husk å levere Modulbesvarelse innen fredag!');

Insert into Blogg(blo_ID, blo_bruID)
values(10,1),
(11,2);

insert into Kommentar(kom_tilID, kom_text)
values(101, 'Dette var bra. Du er flink'),
(101, 'Håper du ikke jukset'),
(112, 'Dette var ikke helt rett, prøv igjen lol :^)'),
(113, 'Du er inne på noe, fortsett å prøv så blir det full pott neste gang');

insert into Spørsmål (sp_modoppID, sp_text)
values(1,'Hvordan åpner man et prosjekt i BlueJ?'),
(2,'Hvordan lager man et enkelt prosjekt?'),
(3,'Hvordan bruker man for og while loops i et prosjekt?'),
(3, 'Hva er forskjellen på for og while?');

insert into Resursser(res_modoppID, res_text)
values(1, 'BlueJ for dummies: Side 1'),
(2, 'https://www.youtube.com/watch?v=Vhh_GeBPOhs'),
(3, 'BlueJ for dummies: kapittel 5');

drop table Spørsmål;




select * from kursmedlem ;
describe kurs;
drop table Kommentar;
select * from Modulbesvarelse;
create view Besvarelse as select bes_bruID as studentID, count(*) 
as modulbesvarselser from Modulbesvarelse 
group by bes_bruID 
with read only;
where 
drop table Kurs;
select * from kurs;

create view tests as select bru_ID as Bruker, modopp_navn as Test, poeng as Poeng, count(sp_modoppID) as Spørsmål
from ((((Bruker
inner join Modulbesvarelse on Bruker.bru_ID = Modulbesvarelse.bes_ID)
inner join Moduloppgave on Modulbesvarelse.bes_ID = Moduloppgave.modopp_ID)
inner join Spørsmål on Moduloppgave.modopp_ID = Spørsmål.sp_ID)
inner join Tilbakemelding on Moduloppgave.modopp_ID = Tilbakemelding.til_ID);

create view comments as select bes_ID as Modul, kom_tilID 
from ((Tilbakemelding
right join Kommentar on Tilbakemelding.til_ID = Kommentar.kom_ID)
right join Modulbesvarelse on Kommentar.kom_ID = Modulbesvarelse.bes_ID);
order by bes_ID;






