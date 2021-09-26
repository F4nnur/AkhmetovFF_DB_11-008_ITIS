
CREATE DATABASE "Akhmetov_11-008"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
create table clients (Name varchar, Phone_numb varchar);

insert into clients (Name, Phone_numb) values ('Kane', '89291938192');
insert into clients (Name, Phone_numb) values ('Sasha', '8168472364');
insert into clients (Name, Phone_numb) values ('Grisha', '82313421356');
insert into clients (Name, Phone_numb) values ('Ilya', '89333221351');
insert into clients (Name, Phone_numb) values ('Maks', '88343641352');
insert into clients (Name, Phone_numb) values ('Elena', '83414424398');
insert into clients (Name, Phone_numb) values ('Olya', '87383321347');
insert into clients (Name, Phone_numb) values ('Natasha', '89373321345');
insert into clients (Name, Phone_numb) values ('Rustam', '88516451356');
insert into clients (Name, Phone_numb) values ('Egor', '87353341656');

create table drivers (Name varchar, Car_number varchar, Phone_number varchar);

insert into drivers (Name, Car_number, Phone_number) values ('Андрей', 'y 374 kk', '+79135353208');
insert into drivers (Name, Car_number, Phone_number) values ('Вася', 'д 334 оо', '+79132346408');
insert into drivers (Name, Car_number, Phone_number) values ('Петр', 'а 178 ва', '+79235435231');
insert into drivers (Name, Car_number, Phone_number) values ('Алексей', 'к 467 ру', '+78135136534');
insert into drivers (Name, Car_number, Phone_number) values ('Михаил', 'р 312 лл', '+73135536278');
insert into drivers (Name, Car_number, Phone_number) values ('Павел', 'м 356 фф', '+77735534857');
insert into drivers (Name, Car_number, Phone_number) values ('Нурсултан', 'о 001 оо', '+79245138538');
insert into drivers (Name, Car_number, Phone_number) values ('Омар', 'к 111 кк', '+79635334238');
insert into drivers (Name, Car_number, Phone_number) values ('Денис', 'д 364 он', '+79135136238');
insert into drivers (Name, Car_number, Phone_number) values ('Валентин', 'к 333 кк', '+79535635238');

create table cars (Mark varchar, Numb varchar, Color varchar);

insert into cars (Mark, Numb, Color) values ('Toyota', 'y 374 kk', 'blue');
insert into cars (Mark, Numb, Color) values ('Hundai', 'д 334 оо', 'white');
insert into cars (Mark, Numb, Color) values ('Chevrolet', 'а 178 ва', 'green');
insert into cars (Mark, Numb, Color) values ('Land Kruser', 'к 467 ру', 'black');
insert into cars (Mark, Numb, Color) values ('Reno', 'р 312 лл', 'purple');
insert into cars (Mark, Numb, Color) values ('Nissan', 'м 356 фф', 'white');
insert into cars (Mark, Numb, Color) values ('Subaru', 'о 001 оо', 'yellow');
insert into cars (Mark, Numb, Color) values ('Lexsus', 'к 111 кк', 'gray');
insert into cars (Mark, Numb, Color) values ('Mitsubishi', 'д 364 он', 'orrange');
insert into cars (Mark, Numb, Color) values ('Akura', 'к 333 кк', 'multicolor');

create table driver_loc (Driver varchar, district varchar);

insert into driver_loc (Driver, district) values ('Андрей', 'Вахитовский');
insert into driver_loc (Driver, district) values ('Вася', 'Приволжский');
insert into driver_loc (Driver, district) values ('Петр', 'Авиастрой');
insert into driver_loc (Driver, district) values ('Омар', 'Вахитовский');
insert into driver_loc (Driver, district) values ('Нурсултан', 'Московский');
insert into driver_loc (Driver, district) values ('Михаил', 'Ново-Савиновский');
insert into driver_loc (Driver, district) values ('Адексей', 'Советский');
insert into driver_loc (Driver, district) values ('Павел', 'Московский');
insert into driver_loc (Driver, district) values ('Денис', 'Кировский');
insert into driver_loc (Driver, district) values ('Валентин', 'Ново-Савиновский');

create table orders (date varchar, driver varchar, client varchar);

insert into orders (date, driver, client) values ('2021-09-20', 'Андрей', 'Kane');
insert into orders (date, driver, client) values ('2021-03-01', 'Вася', 'Maks');
insert into orders (date, driver, client) values ('2021-06-25', 'Петр', 'Sasha');
insert into orders (date, driver, client) values ('2021-07-23', 'Алексей', 'Grisha');
insert into orders (date, driver, client) values ('2021-03-13', 'Омар', 'Olya');
insert into orders (date, driver, client) values ('2021-01-26', 'Нурсултан', 'Natasha');
insert into orders (date, driver, client) values ('2021-08-30', 'Денис', 'Rustam');
insert into orders (date, driver, client) values ('2021-03-31', 'Валентин', 'Ilya');
insert into orders (date, driver, client) values ('2021-09-12', 'Павел', 'Elena');
insert into orders (date, driver, client) values ('2021-02-21', 'Михаил', 'Egor');







