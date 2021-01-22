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
    id_statusu int not null,
    id_ofert int not null,
    foreign key (id_przedmiotu) references przedmiot(id),
    foreign key (id_statusu) references statusy(id),
    foreign key (id_ofert) references oferty(id)
);
insert into aukcje(data_stworzenia, data_koncowa, id_przedmiotu, id_statusu, id_oferty) values
("20120618 10:34:09 AM","20130618 10:34:09 AM", 1, 3, 1),
("20120619 9:34:09 AM","20120621 9:35:09 AM", 2, 3, 2);

create table oferty (
    id int not null auto_increment,
    wysokosc_oferty varchar(45),
    data_stworzenia datetime not null,
    primary key (id)
);
insert into oferty(wysokosc_oferty, data_stworzenia) values
("201", "20120618 11:34:09 AM"),
("2010", "20120620 8:34:09 AM");

create table uzytkownicy (
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
insert into uzytkownicy(email, imie, nazwisko, haslo, id_aukcji, id_ofert, id_adresu) values
("damian@kijanczuk.com","damian","kijanczuk","krokodylek123", 1, 2, 1);

create table adres (
    id int not null auto_increment,
    ulica varchar(80),
    nr_domu varchar(5),
    nr_mieszkania varchar(5),
    kod_pocztowy varchar(6),
    miasto varchar(30),
    nr_telefonu varchar(20),
    primary key (id)
);
insert into adres(ulica, nr_domu, nr_mieszkania, kod_pocztowy, miasto, nr_telefonu) values
("Niepodleglosci","649","5","81-855","Sopot","729378688"),
("Gorska","12","4","12-234","Sopot","823738107"),
("Gorska","13","4","12-234","Sopot","776334121"),
("Dolna","1","1","32-442","Zagorami","112342442"),
("Wysoka","546","101","33-655","Witojki Dolne","893482893"),

("Wysoka","4","12","99-123","Witojki dolne","123456789"),
("Dluga","65","23","11-111","Swiebodzin","987673123"),
("Jedyna","1","1","11-111","Pierwszewo","111111111"),
("Druga","2","22","22-222","Drogowo","222222222"),
("Trzczecinska","33","3","33-333","Trzeciewo","333333333"),

("Powitalna","6","77","67-776","Witajewo","444444444"),
("Druga","22","2","21-232","Nowe Drogowo","211232232"),
("Adama Mickiewicz","7","23","78-999","Pisarsko","645756867"),
("Pana Tadeusza","23","4","11-234","Pisarsko","432643215"),
("Staka Owerflola","9","6","32-654","Gugolki","321432543"),

("Przyjazna","1","23","44-567","Powitansko Dolne","6545434876"),
("Wesola","342","123","11-898","Zachodniowo",""),
("Formatowana","321","1","11-567","Powitansko Wysokie","789543567"),
("Nullowana","3","3","11-111","Nieznanowo","123234345"),
("Ostatnia","9","9","99-999","No w koncu","101202030");

create table statusy (
    id int not null auto_increment,
    data_stworzenia datetime not null,
    primary key (id),
    id_statusu int not null,
    foreign key (id_statusu) references kategorie_statusow(id)
);
insert into statusy(data_stworzenia, id_statusu) values
("20120618 10:34:09 AM", 3);

create table kategorie_statusow (
    id int not null auto_increment,
    nazwa_statusu varchar(40) not null,
    primary key (id)
);
insert into kategorie_statusow(nazwa_statusu) values
("Utworzona Ukryta"),
("Utworzona Widoczna"),
("W toku"),
("W toku Zalicytowana"),
("Zakonczona Niesprzedana"),
("Zakonczona Sprzedana"),
("Zamknieta"),
("Zarchiwizowana");


create table przedmiot (
    id int not null auto_increment,
    opis varchar(512),
    primary key (id),
    id_kategori int not null,
    foreign key (id_kategori) references kategorie_przedmiotow(id)
);
insert into przedmiot(opis, id_kategori) values
("Karta graficzna RTX 3080 MEGA SZYPKA OKAZJA!!!", 1),
("Mega modna kurtka Rozmiar M, Dmaska", 2),
("HUśtawka dla dziecka HIT", 4),
("Lampka do biurka idealna na nauke zdalna", 3),
("Pieluchy dzieciece uzywane tylko raz", 6),
("Odzywka do rzes eleverash", 7),
("Zestaw profesjonalnych pedzli do makijazu", 7),
("Revlon Colorstay Podkład z Pompką Tłusta Mieszana", 7),
("ZESTAW HENNA REFECTOCIL UTLENIACZ KIELISZEK TRYMER", 7),
("BLENDER GĄBKA DO MAKIJAŻU BEAUTY MAKE-UP gąbeczka", 7),
("TOYOTA AURIS 07r 1.4 BENZ * SERWISOWANA * KLIMA", 13),
("Volkswagen Golf z niesamowitą historią", 13),
("OPEL INSIGNIA CDTI HB LIFT ASO I WŁ SALON PL", 13),
("Ikona religijna MATKA BOŻA Z GUADALUPE", 16),
("Obraz recznie malowany PORTRET TANCZACEJ PARY", 16),
("JERZY KOSSAK OBRAZ OLEJNY 1921", 16),
("NARKOPOLIS, THAYIL JEET", 9),
("Moj książę Julia Quinn", 9),
("Prawiek i inne czasy Olga Tokarczuk Literackie", 9),
("Kawa ziarnista Lavazza Qualita Oro 1kg", 5);

create table kategorie_przedmiotow (
    id int not null auto_increment,
    nazwa_kategori varchar(40) not null,
    primary key (id)
);
insert into kategorie_przedmiotow(nazwa_kategori) values
("Elektronika"),
("Moda"),
("Dom"),
("Ogrod"),
("Supermarket"),

("Dziecko"),
("Uroda"),
("Zdrowie"),
("Kultura"),
("Rozrywka"),

("Sport"),
("Turystyka"),
("Motoryzacja"),
("Nieruchomosci"),
("Kolekcje"),

("Sztuka"),
("Dla Firmy"),
("Uslugi"),
("Dla graczy"),
("Na Zime");


