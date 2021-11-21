CREATE TABLE HOTEL(
	hotel_id SERIAL PRIMARY KEY,
	hotel_name VARCHAR(50),
	hotel_addres VARCHAR(100),
	cat VARCHAR(50)
);

CREATE TABLE POSIT(
	position_id SERIAL PRIMARY KEY,
	title VARCHAR(20)
);

CREATE TABLE EMPLOYEE(
	employee_id SERIAL PRIMARY KEY,
	emp_name VARCHAR(50),
	position_id INT, FOREIGN KEY (position_id) REFERENCES POSIT(position_id),
	selery VARCHAR(50),
	hotel_id INT, FOREIGN KEY (hotel_id) REFERENCES HOTEL(hotel_id),
	UNIQUE (position_id, hotel_id)
);

CREATE TABLE ROOM(
	room_id SERIAL PRIMARY KEY,
	romm_num INT,
	place_num INT,
	cat VARCHAR(100),
	hotel_id INT, FOREIGN KEY (hotel_id) REFERENCES HOTEL(hotel_id),
	UNIQUE (hotel_id)
);

CREATE TABLE CLEANING(
	clean_id SERIAL PRIMARY KEY,
	c_time VARCHAR(100),
	staffer_id INT, FOREIGN KEY (staffer_id) REFERENCES EMPLOYEE(employee_id),
	room_id INT, FOREIGN KEY (room_id) REFERENCES ROOM(room_id),
	UNIQUE (staffer_id, room_id)
);

CREATE TABLE GUEST(
	guest_id SERIAL PRIMARY KEY,
	g_name VARCHAR(100),
	doc VARCHAR(50),
	contacts VARCHAR(100)
);

CREATE TABLE LIVING(
	living_id SERIAL PRIMARY KEY,
	per VARCHAR(100),
	payment INT,
	guest_id INT, FOREIGN KEY (guest_id) REFERENCES GUEST(guest_id),
	room_id INT, FOREIGN KEY (room_id) REFERENCES ROOM(room_id),
	UNIQUE (room_id, guest_id)
);