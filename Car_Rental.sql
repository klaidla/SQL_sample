-- USE car_rental;
CREATE TABLE samochody(
	id_samochody INTEGER PRIMARY KEY,
    producer VARCHAR(30),
    model VARCHAR(30),
    year INTEGER,
    horse_power INTEGER,
    price_per_day INTEGER
);

CREATE TABLE klienci(
	id_klient INTEGER PRIMARY KEY,
    imie VARCHAR(30),
    nazwisko VARCHAR(100),
    adres TEXT,
    miasto VARCHAR(30)
);

CREATE TABLE zamowienia(
	id_zamowienia INTEGER PRIMARY KEY,
    id_klient INTEGER,
    id_samochody INTEGER,
    data_start DATE,
    data_koniec DATE,
    wartosc_zamowienia INTEGER
);

-- ALTER TABLE: auto inkrementacja ID
ALTER TABLE klienci MODIFY COLUMN id_klient INTEGER AUTO_INCREMENT;
ALTER TABLE samochody MODIFY COLUMN id_samochody INTEGER AUTO_INCREMENT;
ALTER TABLE zamowienia MODIFY COLUMN id_zamowienia INTEGER AUTO_INCREMENT;

-- ALTER TABLE: nadanie właściwości foreign key
ALTER TABLE zamowienia ADD CONSTRAINT id_klient_fk FOREIGN KEY (id_klient) REFERENCES klienci(id_klient);
ALTER TABLE zamowienia ADD CONSTRAINT id_samochody_fk FOREIGN KEY (id_samochody) REFERENCES samochody(id_samochody);


-- insety
INSERT INTO klienci(imie, nazwisko, adres, miasto) VALUES('Jan', 'Kowalski', 'ul. Florianska 12', 'Krakow');
INSERT INTO klienci(imie, nazwisko, adres, miasto) VALUES('Andrzej', 'Nowak', 'ul. Saska 43', 'Wroclaw');

INSERT INTO klienci(imie, nazwisko, adres, miasto) VALUES
('Michal', 'Taki', 'os. Srodkowe 12', 'Poznan'),
 ('Pawel', 'Ktory', 'ul. Stara 11', 'Gdynia'),
 ('Anna', 'Inna', 'os. Srednie 1', 'Gniezno'),
 ('Alicja', 'Panna', 'os. Duze 33', 'Torun'),
 ('Damian', 'Papa', 'ul. Skosna 66', 'Warszawa'),
 ('Marek', 'Troska', 'os. Male 90', 'Radom'),
 ('Jakub', 'Klos', 'os. Polskie 19', 'Wadowice'),
 ('Lukasz', 'Lis', 'os. Podlaskie 90', 'Bialystok');

SELECT * FROM klienci;

INSERT INTO SAMOCHODY(producer, model, year, horse_power, price_per_day) VALUES ('Seat', 'Leon', 2016, 80, 200);
INSERT INTO SAMOCHODY(producer, model, year, horse_power, price_per_day) VALUES ('Toyota', 'Avensis', 2014, 72, 100);

INSERT INTO
SAMOCHODY(producer, model, year, horse_power, price_per_day)
VALUES
 ('Mercedes', 'CLK', 2018, 190, 400),
 ('Hyundai', 'Coupe', 2014, 165, 300),
 ('Dacia', 'Logan', 2015, 103, 150),
 ('Saab', '95', 2012, 140, 140),
 ('BMW', 'E36', 2007, 110, 80),
 ('Fiat', 'Panda', 2016, 77, 190),
 ('Honda', 'Civic', 2019, 130, 360),
 ('Volvo', 'XC70', 2013, 180, 280);
SELECT * FROM SAMOCHODY;


INSERT INTO ZAMOWIENIA(id_klient, id_samochody, data_start, data_koniec, wartosc_zamowienia) VALUES (1, 2, '2020-07-05', '2020-07-06', 100);
INSERT INTO ZAMOWIENIA(id_klient, id_samochody, data_start, data_koniec, wartosc_zamowienia) VALUES (2, 2, '2020-07-10', '2020-07-12', 200);

INSERT INTO ZAMOWIENIA(id_klient, id_samochody, data_start, data_koniec, wartosc_zamowienia)  VALUES
 (3, 3, '2020-07-06', '2020-07-08', 400),
 (6, 10, '2020-07-10', '2020-07-16', 1680),
 (4, 5, '2020-07-11', '2020-07-14', 450),
 (5, 4, '2020-07-11', '2020-07-13', 600),
 (7, 3, '2020-07-12', '2020-07-14', 800),
 (5, 7, '2020-07-14', '2020-07-17', 240),
 (3, 8, '2020-07-14', '2020-07-16', 380),
 (5, 9, '2020-07-15', '2020-07-18', 1080),
 (6, 10, '2020-07-16', '2020-07-20', 1120),
 (8, 1, '2020-07-16', '2020-07-19', 600),
 (9, 2, '2020-07-16', '2020-07-21', 500),
 (10, 6, '2020-07-17', '2020-07-19', 280),
 (1, 9, '2020-07-17', '2020-07-19', 720),
 (3, 7, '2020-07-18', '2020-07-21', 240),
 (5, 4, '2020-07-18', '2020-07-22', 1200);
SELECT * FROM ZAMOWIENIA;
/*
INSERT INTO ZAMOWIENIA(id_klient, id_samochody, data_start, data_koniec, wartosc_zamowienia) 
	VALUES (1, 2, '2020-07-05', '2020-07-06', 100),
    (2, 2, '2020-07-10', '2020-07-12', 200);
    ;
*/


-- CZYSCZENIE rekordów w tabelkach

SET FOREIGN_KEY_CHECKS = 0; -- ustawia warunek, zeby nie krzyczał,że usuwamy dane z kluczami glownymi

TRUNCATE samochody; #CZYŚCI TABELĘ DANYCH
TRUNCATE klienci; #CZYŚCI TABELĘ DANYCH
TRUNCATE zamowienia; #CZYŚCI TABELĘ DANYCH

SET FOREIGN_KEY_CHECKS = 1;