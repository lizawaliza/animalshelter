--USUWANIE BAZY DANYCH SCHRONISKO jakby bylo potrzebne/wczesniej nieudane tworzenie

drop table Rehabilitacje;
drop table Przebyte_operacje;
drop table Leczenia;
drop table Zwierzeta_Wolontariuszy;
drop table Zwierzeta;
drop table Weterynarze;
drop table Klatki;
drop table Domy_tymczasowe;
drop table Wolontariusze;
drop table Gatunki;
drop table Wlasciciele;

--Tworzenie tabel

create table Wlasciciele(
    PESEL number(11),
    imie varchar2(30 char) not null,
    nazwisko varchar2(30 char) not null,
    numer_telefonu number(9) not null,
    adres_zamieszkania varchar2(150 char) not null,
    unique(numer_telefonu),
    primary key(PESEL)
);



create table Gatunki(
    id_gatunku number(6) GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1),
    nazwa varchar2(30 char),
    rasa varchar2(30 char) default null,
    unique(nazwa,rasa),
    primary key(id_gatunku)
);



create table Wolontariusze(
    PESEL number(11),
    imie varchar2(30 char) not null,
    nazwisko varchar2(30 char) not null,
    numer_telefonu number(9) not null,
    unique(numer_telefonu),
    primary key(PESEL) 
);



create table Domy_tymczasowe(
    adres varchar2(50 char) not null,
    pojemnosc number(2) not null,
    zajetosc number(2) not null,
    wolontariusz references Wolontariusze(PESEL) on delete cascade not null,
    unique(adres),
    primary key(wolontariusz)
);



create table Klatki(
    nr_seryjny number(9),
    status_klatki varchar2(9 char) check(status_klatki in('PELNA', 'PUSTA', 'POZYCZONA')) not null,
    typ varchar2(6 char) check(typ in('LAPKA', 'ZWYKLA')) not null,
    wysokosc_cm number(5,2) not null,
    szerokosc_cm number(5,2) not null,
    glebokosc_cm number(5,2) not null,
    primary key(nr_seryjny)
);



create table Weterynarze(
    PESEL number(11),
    imie varchar2(30 char) not null,
    nazwisko varchar2(30 char) not null,
    numer_telefonu number(9) not null,
    adres_gabinetu varchar2(50 char) not null,
    specjalizacja varchar2(30 char) not null,
    unique(numer_telefonu),
    primary key(PESEL)
);



create table Zwierzeta(
    imie varchar2(15 char),
    data_przyjecia date,
    wiek number(4,2) not null,
    waga number(5,2) not null,
    gotowosc_do_adopcji varchar2(12 char) check(gotowosc_do_adopcji in ('ZAADOPTOWANY', 'GOTOWY', 'NIEGOTOWY')) not null,
    data_adpocji date default null,
    uwagi varchar2(100 char) default null,
    dom_tymczasowy null references Domy_tymczasowe(wolontariusz),
    klatka null references Klatki(nr_seryjny),
    wlasciciel null references Wlasciciele(PESEL),
    gatunek not null references Gatunki(id_gatunku),
    wolontariusz not null references Wolontariusze(PESEL),
    constraint chk_pesele check(dom_tymczasowy = wolontariusz),
    constraint chk_miejsce check(klatka is not null or wlasciciel is not null or dom_tymczasowy is not null),
    primary key(imie, data_przyjecia)
);



create table Zwierzeta_Wolontariuszy(
    wolontariusz references Wolontariusze(PESEL) on delete cascade,
    imie_zwierzecia,
    data_przyjecia_zwierzecia,
    foreign key(imie_zwierzecia, data_przyjecia_zwierzecia) 
        references Zwierzeta(imie, data_przyjecia) on delete cascade,
    primary key(wolontariusz, imie_zwierzecia, data_przyjecia_zwierzecia)
);



create table Leczenia(
    nazwa varchar2(50 char),
    data_rozpoczecia date not null,
    okres_leczenia varchar2(30 char) not null,
    calkowity_koszt number(7,2) not null,
    przyjmowane_leki varchar2(100 char) default null,
    dawka varchar2(100 char) default null,
    imie_zwierzecia,
    data_przyjecia_zwierzecia,
    weterynarz not null references Weterynarze(PESEL),
    foreign key(imie_zwierzecia, data_przyjecia_zwierzecia)
         references Zwierzeta(imie, data_przyjecia) on delete cascade,
    primary key(nazwa, imie_zwierzecia, data_przyjecia_zwierzecia)
);



create table Przebyte_operacje(
    opis varchar2(100 char),
    data_operacji date,
    koszt number(7,2) not null,
    status_operacji varchar2(8 char) check(status_operacji in ('UDANA', 'NIEUDANA')) not null,
    powiklania varchar2(100 char) default null,
    nazwa_leczenia,
    imie_zwierzecia,
    data_przyjecia_zwierzecia,
    foreign key(nazwa_leczenia, imie_zwierzecia, data_przyjecia_zwierzecia) 
        references Leczenia(nazwa, imie_zwierzecia, data_przyjecia_zwierzecia) on delete cascade,
    primary key(opis, data_operacji, nazwa_leczenia, imie_zwierzecia, data_przyjecia_zwierzecia)
);



create table Rehabilitacje(
    typ_schorzenia varchar2(50 char),
    opis varchar2(100 char) not null,
    koszt number(7,2) not null,
    data_rozpoczecia date not null,
    okres_rehabilitacji varchar2(30 char) not null,
    nazwa_leczenia,
    imie_zwierzecia,
    data_przyjecia_zwierzecia,
    foreign key(nazwa_leczenia, imie_zwierzecia, data_przyjecia_zwierzecia) 
        references Leczenia(nazwa, imie_zwierzecia, data_przyjecia_zwierzecia) on delete cascade,
    primary key(typ_schorzenia, nazwa_leczenia, imie_zwierzecia, data_przyjecia_zwierzecia)
);