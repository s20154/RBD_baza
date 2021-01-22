use s20154;

set foreign_key_checks=0;
drop table if exists aukcje, oferty, uzytkownicy, adres, statusy, kategorie_statusow, przedmiot, kategorie_przedmiotow
set foreign_key_checks=1;

create table aukcje (
    id int not null auto_increment,
    data_stworzenia datetime not null,
    data_koncowa datetime not null,
    primary key (id),
    id_przedmiotu int not null,
    id_statusow int not null,
    id_ofert int not null,
    foreign key (id_przedmiotu) references przedmiot(id),
    foreign key (id_statusow) references statusy(id),
    foreign key (id_ofert) references oferty(id)
);

create table oferty (
    id int not null auto_increment,
    wysokosc_oferty varchar(45),
    data_stworzenia datetime not null,
    primary key (id)
);

create uzytkownicy (
    id int not null auto_increment,
    email varchar(80) not null,
    imie varchar(80),
    nazwisko varchar(80),
    haslo varchar(80) not null,
    primary key (id),
    id_aukcji int,
    id_ofert int,
    id_adresu int,
    foreign key (id_aukcji) references aukcje(id),
    foreign key (id_ofert) references oferty(id),
    foreign key (id_adresu) references adres(id)
);

create table adres (
    id int not null auto_increment,
    ulica varchar(80),
    nr_domu varchar(5),
    nr_mieszkania varchar(5),
    kod_pocztowy varchar(6),
    miasto varchar(6),
    nr_telefonu varchar(6),
    primary key (id)
);

create table statusy (
    id int not null auto_increment,
    data_stworzenia datetime not null,
    primary key (id),
    id_statusu int not null,
    foreign key (id_statusu) references kategorie_statusow(id)
);

create table kategorie_statusow (
    id int not null auto_increment,
    nazwa_statusu varchar(40) not null,
    primary key (id)
);

create table przedmiot (
    id int not null auto_increment,
    opis varchar(255),
    primary key (id),
    id_kategori int not null,
    foreign key (id_kategori) references kategorie_przedmiotow(id)
);

create table kategorie_przedmiotow (
    id int not null auto_increment,
    nazwa_kategori varchar(40) not null,
    primary key (id)
);


