use [BD]

go

DROP TABLE items_in_order
DROP TABLE items_in_cars
DROP TABLE delivery_delays
DROP TABLE cars_in_order
DROP TABLE items_to_deliver
DROP TABLE orders
DROP TABLE client
DROP TABLE technical_service
DROP TABLE employee
DROP TABLE car
DROP TABLE department
DROP TABLE adress
DROP TABLE item_type
DROP TABLE city
DROP TABLE car_brand
DROP TABLE job


CREATE TABLE job(
	job_id smallint identity primary key, 
	description varchar(30)
);

CREATE TABLE car_brand(
	brand_id tinyint identity primary key,
	brand_name varchar(15),
	volume tinyint not null,
	capacity decimal(2,1) not null
);

CREATE TABLE city(
	city_id int identity primary key,
	city_name varchar(15)
);

CREATE TABLE item_type(
	item_type_id smallint identity primary key,
	type_name varchar(30) not null
);

CREATE TABLE adress(
	adress_id int identity primary key,
	street varchar(20),
	house tinyint,
	city_id int not null references city (city_id) on update cascade on delete no action,
	zip_code int,
	city_area tinyint
	
);

CREATE TABLE department(
	department_id smallint identity primary key,
	department_name varchar(15),
	location_id int references adress (adress_id) on update cascade on delete no action
);

CREATE TABLE car(
	car_id smallint identity primary key,
	car_number varchar(9) not null,
	manufacture_year datetime not null,
	department_id smallint not null references department (department_id) on update cascade on delete no action,
	brand_id tinyint not null references car_brand (brand_id) on update cascade on delete no action,
	last_vehicle_inspection datetime not null,
constraint correct_manufacture_year check ( manufacture_year >=1990 and manufacture_year <2050 )
);


CREATE TABLE employee(
	employee_id int identity primary key,
	last_name varchar(15) not null,
	first_name varchar(15) not null,
	manager_id int references employee(employee_id),
	job_id smallint not null references job (job_id) on update cascade on delete no action,
	hire_date datetime not null,
	end_date datetime,
	salary decimal(9,2),
	commision decimal(9,2),
	department_id smallint not null references department (department_id) on update cascade on delete no action,
constraint correct_date check (hire_date <= end_date or end_date is NULL)
);

CREATE TABLE technical_service(
	id int identity primary key,
	departmen_id smallint not null references department (department_id) ,
	serviceman_id int not null references employee (employee_id) ,
	car_id smallint not null references car (car_id) ,
	start_date datetime,
	finish_date datetime,
	type_of_work varchar(30),
constraint correct_work_date check (start_date <= finish_date or finish_date is NULL)
);

CREATE TABLE client(
	client_id int identity primary key,
	first_name varchar(15) not null,
	last_name varchar(15) not null,
	location_id int not null 
--references adress (adress_id) on update cascade on delete no action, 
	CONSTRAINT fk_client FOREIGN KEY (location_id) REFERENCES adress (adress_id), 
	phone_number varchar(11)
);

CREATE TABLE orders(
	order_id int identity primary key,
	client_id int not null,
	accountant_id int not null references employee (employee_id) ,
	price int not null,
	order_date datetime not null,
	arrival_date datetime,
	expected_delivery_date datetime not null,
	arrival_location_id int not null references adress (adress_id),
	status varchar(20),
constraint correct_arrival_date check ( (order_date <= arrival_date or arrival_date is NULL) and order_date <= expected_delivery_date)
);

CREATE TABLE items_to_deliver(
	item_id int identity primary key,
	item_type_id smallint not null references item_type (item_type_id) on update cascade on delete no action,
	item_name varchar(25),
	item_capacity smallint not null, 
	item_volume smallint
);

CREATE TABLE cars_in_order(
	cars_in_order_id int identity primary key,
	car_id smallint not null references car (car_id) on update cascade on delete no action,
	driver_id int not null references employee (employee_id) on update no action
);

CREATE TABLE delivery_delays(
	delay_id smallint identity primary key,
	car_in_order_id int not null references cars_in_order (cars_in_order_id) on update no action,
	delay_reason varchar(15),
	expected_delay_time datetime not null
);

CREATE TABLE items_in_cars(
	cars_in_order_id int not null references cars_in_order (cars_in_order_id) on update no action,
	item_id int not null references items_to_deliver (item_id) on update no action
constraint key1 primary key (cars_in_order_id, item_id)
);

CREATE TABLE items_in_order(
	item_id int not null references items_to_deliver (item_id) on update cascade on delete no action,
	order_id int not null references orders (order_id) on update cascade on delete no action,
constraint key2 primary key (item_id, order_id)
);

Select * 
from employee