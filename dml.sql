--insertowanie rekordow
insert into Gatunki values(default,'Kapibara', default);
insert into Gatunki values(default,'Kot', default);
insert into Gatunki values(default,'Pies', 'Welsh Corgie');
insert into Gatunki values(default,'Pies', 'Shiba Inu');
insert into Gatunki values(default,'Pies', default);
insert into Gatunki values(default,'Kot', 'Munchkin');

insert into Wlasciciele values(12345678910, 'Johan', 'Liebert', 123123123, 'ul. Kinderheim 511, Marburg, Niemcy');
insert into Wlasciciele values(21021021022, 'Tenma', 'Kenzo', 999999999, 'ul. Shiburu 42, Tokyo, Japonia');
insert into Wlasciciele values(14833414835, 'Eliza', 'Bartkowska', 888888888, 'ul. Polanka 70b/7, Poznań, Polska');

insert into Wolontariusze values(44444444444, 'Stanisław', 'Kokot', 333333333);
insert into Wolontariusze values(55555555555, 'Ryszard', 'Kinderek', 909090909);
insert into Wolontariusze values(66666666666, 'Jerzy', 'Tyczer', 888888888);
insert into Wolontariusze values(77777777777, 'Piotr', 'Rayman', 999999999);

insert into Domy_tymczasowe values('ul. Superowska 47, Supermiejsce, Polska', 5, 0, 55555555555);
insert into Domy_tymczasowe values('ul. Antenowa 6, Dipol Dwufazowy, Polska', 3, 0, 77777777777);
insert into Domy_tymczasowe values('ul. Oscyloskopowa 3, Warsztat, Polska', 1, 0, 66666666666);

insert into Klatki values(111111111, 'PUSTA', 'ZWYKLA', 30, 60, 50);
insert into Klatki values(323232323, 'PELNA', 'LAPKA', 100, 100, 150);
insert into Klatki values(676767677, 'POZYCZONA', 'ZWYKLA', 200, 200, 100);
insert into Klatki values(898989897, 'PUSTA', 'LAPKA', 120, 120, 150);
insert into Klatki values(565656566, 'POZYCZONA', 'ZWYKLA', 90, 100, 100);
insert into Klatki values(454545455, 'PELNA', 'ZWYKLA', 130, 130, 150);
insert into Klatki values(343434344, 'POZYCZONA', 'ZWYKLA', 60, 60, 80);
insert into Klatki values(121212122, 'PELNA', 'ZWYKLA', 90, 90, 90);

insert into Weterynarze values(88888888888, 'Dawid', 'Doktor', 909090909, 'ul. Doktorska 1, Doktorzyna, Polska', 'Koty');
insert into Weterynarze values(99999999999, 'Weronika', 'Nienowak', 539566399, 'ul. Nowakowska 5b, Nowa Mieścina, Polska', 'Psy');
insert into Weterynarze values(74654982375, 'Wojciech', 'Uderzczyk', 321534567, 'ul. Rowina 3, Chodzież, Polska', 'Zwierzeta Egzotyczne');

insert into Zwierzeta values('Kotieł', to_date('01-01-2023', 'dd-mm-yyyy'), 5, 7, 'NIEGOTOWY', default, 'niepełnosprawny', null, 111111111, null, (select id_gatunku from Gatunki where nazwa = 'Kot' and rasa = 'Munchkin'), 66666666666);
insert into Zwierzeta values('Corgas', to_date('02-01-2023', 'dd-mm-yyyy'), 2, 12, 'GOTOWY', default, default, 77777777777, null, null, (select id_gatunku from Gatunki where nazwa = 'Pies' and rasa = 'Welsh Corgie'), 77777777777);
insert into Zwierzeta values('Kapiba', to_date('06-12-2022', 'dd-mm-yyyy'), 1, 30, 'ZAADOPTOWANY', to_date('29-01-2023', 'dd-mm-yyyy'), default, null, null, 12345678910, (select id_gatunku from Gatunki where nazwa = 'Kapibara'), 66666666666);
insert into Zwierzeta values('Miauczysław', to_date('15-09-2022', 'dd-mm-yyyy'), 3, 6, 'ZAADOPTOWANY',  to_date('03-11-2022', 'dd-mm-yyyy'), default, null, null, 14833414835, (select id_gatunku from Gatunki where nazwa = 'Kot' and rasa is null), 55555555555);
insert into Zwierzeta values('Hauczysław', to_date('17-10-2022', 'dd-mm-yyyy'), 4, 15, 'ZAADOPTOWANY',  to_date('14-12-2022', 'dd-mm-yyyy'), default, null, null, 21021021022, (select id_gatunku from Gatunki where nazwa = 'Pies' and rasa = 'Shiba Inu'), 44444444444);

insert into Zwierzeta_Wolontariuszy (wolontariusz, imie_zwierzecia, data_przyjecia_zwierzecia)
select wolontariusz, imie, data_przyjecia from Zwierzeta;


insert into Leczenia values('Rekonstrukcja kończyn', to_date('03-01-2023', 'dd-mm-yyyy'), '2 miesiace', 5000, 'morfina', '500mg przed operacja', 'Kotieł', to_date('01-01-2023', 'dd-mm-yyyy'), 88888888888);
insert into Leczenia values('Koci katar', to_date('15-03-2023', 'dd-mm-yyyy'), '1 tydzien', 100, 'witamina C', '100mg dziennie', 'Kotieł', to_date('01-01-2023', 'dd-mm-yyyy'), 88888888888);

insert into Przebyte_operacje values('Rekonstrukcja lewej łapki', to_date('03-01-2023', 'dd-mm-yyyy'), 5000, 'UDANA', default, 'Rekonstrukcja kończyn', 'Kotieł', to_date('01-01-2023', 'dd-mm-yyyy'));
insert into Przebyte_operacje values('Rekonstrukcja prawej łapki', to_date('09-01-2023', 'dd-mm-yyyy'), 5000, 'UDANA', default, 'Rekonstrukcja kończyn', 'Kotieł', to_date('01-01-2023', 'dd-mm-yyyy'));

insert into Rehabilitacje values('Rehabilitacja lewej łapki', 'Wykonywanie ćwiczeń hipertroficznych i wzmacniających na lewą łapkę', 1000, to_date('16-01-2023', 'dd-mm-yyyy'), '3 miesiące', 'Rekonstrukcja kończyn', 'Kotieł', to_date('01-01-2023', 'dd-mm-yyyy'));
insert into Rehabilitacje values('Rehabilitacja prawej łapki', 'Wykonywanie ćwiczeń hipertroficznych i wzmacniających na prawą łapkę', 1000, to_date('16-01-2023', 'dd-mm-yyyy'), '3 miesiące', 'Rekonstrukcja kończyn', 'Kotieł', to_date('01-01-2023', 'dd-mm-yyyy'));

--tesowanie funkcjonalnosci

delete from zwierzeta where imie='Kotieł';
update zwierzeta_wolontariuszy
set wolontariusz=55555555555
where wolontariusz=66666666666;
update zwierzeta 
set wolontariusz=55555555555
where wolontariusz=66666666666;
delete from wolontariusze where pesel=66666666666;
select * from zwierzeta_wolontariuszy;
select * from leczenia;
select * from rehabilitacje;
select * from przebyte_operacje;