use [BD]

go

/*truncate table [items_in_order] 
truncate table [delivery_delays]
truncate table [orders] 
truncate table [cars_in_order]
truncate table [items_in_cars] 
truncate table [items_to_deliver] 
truncate table [item_type] 
truncate table [client] 
truncate table [technical_service]
truncate table [car] 
truncate table [car_brand] 
truncate table [employee] 
truncate table [job]
truncate table [department] 
truncate table [adress] 
truncate table [city]
*/
delete from [items_in_cars]
delete from [delivery_delays]
delete from [cars_in_order]
delete from [items_in_order] 
delete from [items_to_deliver]
delete from [item_type] 
delete from [orders]   
delete from [client] 
delete from [technical_service]
delete from [car] 
delete from [car_brand] 
delete from [employee] 
delete from [job]
delete from [department] 
delete from [adress] 
delete from [city]


SET IDENTITY_INSERT job ON
INSERT INTO job (job_id, description) VALUES (1, '��������')
SET IDENTITY_INSERT job OFF
DBCC CHECKIDENT (job, reseed, 1)
INSERT INTO job (description) VALUES ('�������') --2
INSERT INTO job (description) VALUES ('���������')
INSERT INTO job (description) VALUES ('��������')--4
INSERT INTO job (description) VALUES ('�����������')
INSERT INTO job (description) VALUES ('���������')--6
INSERT INTO job (description) VALUES ('�������')
INSERT INTO job (description) VALUES ('��������')--8
INSERT INTO job (description) VALUES ('��������')
INSERT INTO job (description) VALUES ('�������� ���������')--10

SET IDENTITY_INSERT car_brand ON
INSERT INTO car_brand (brand_id, brand_name, volume, capacity)  VALUES (1, '������_NEXT',70, 1)
SET IDENTITY_INSERT car_brand OFF
DBCC CHECKIDENT (car_brand, reseed, 1)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('���-3302', 65, 1)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('���-2705', 65, 1.5)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('����-�������', 75, 2)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('����-������1', 70, 1)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('����-������2', 68, 1.5)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('����-������3', 65, 2)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('����-������4', 65, 1.7)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('���-2700', 67, 2)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('���-2707', 65, 2.2)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('���-3352', 70, 2)--10

SET IDENTITY_INSERT city ON
INSERT INTO city (city_id, city_name) VALUES (1, '������������')
SET IDENTITY_INSERT city OFF
DBCC CHECKIDENT (city, reseed, 1)
INSERT INTO city (city_name) VALUES ('�����������')
INSERT INTO city (city_name) VALUES ('����')
INSERT INTO city (city_name) VALUES ('�����')
INSERT INTO city (city_name) VALUES ('�����')
INSERT INTO city (city_name) VALUES ('���')
INSERT INTO city (city_name) VALUES ('�����������')
INSERT INTO city (city_name) VALUES ('������')
INSERT INTO city (city_name) VALUES ('�����')
INSERT INTO city (city_name) VALUES ('������������')--10


SET IDENTITY_INSERT item_type ON
INSERT INTO item_type (item_type_id, type_name) VALUES (1, '�����')
SET IDENTITY_INSERT item_type OFF
DBCC CHECKIDENT (item_type, reseed, 1)
INSERT INTO item_type (type_name) VALUES ('����')
INSERT INTO item_type (type_name) VALUES ('��������-��������')
INSERT INTO item_type (type_name) VALUES ('�����')
INSERT INTO item_type (type_name) VALUES ('�����')
INSERT INTO item_type (type_name) VALUES ('������')
INSERT INTO item_type (type_name) VALUES ('����')
INSERT INTO item_type (type_name) VALUES ('����-����')
INSERT INTO item_type (type_name) VALUES ('�������-������')
INSERT INTO item_type (type_name) VALUES ('������')--10


SET IDENTITY_INSERT adress ON
INSERT INTO adress (adress_id, street, house, city_id, zip_code, city_area) VALUES (1, '�����������', 25, 2, 620062, 66)
SET IDENTITY_INSERT adress OFF
DBCC CHECKIDENT (adress, reseed, 1)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('������������', 72, 3, 675204, 67)--2
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('������', 52, 3, 845205, 23)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('��������', 43, 4, 547803, 56)--4
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('������������', 72, 6, 458620, 23)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('����������', 144, 7, 625498, 40)--6
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('���� ����������', 89, 9, 450378, 51)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('����� �����', 12, 4, 348957, 25)--8
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('��������', 54, 5, 234856, 85)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('���������', 78, 9, 645230, 58)--10
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('���������������', 5, 3, 245058, 46)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('������', 2, 2, 232562, 20)--12
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('���������', 7, 1, 513258, 63)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('�����������', 52, 1, 113452, 36)--14
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('��������', 78, 1, 251235, 3)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('���������', 89, 1, 232355, 4)--16
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('�������', 87, 1, 281219, 39)--17



SET IDENTITY_INSERT department ON
INSERT INTO department (department_id, department_name, location_id ) VALUES (1, '��������1', 1)
SET IDENTITY_INSERT department OFF
DBCC CHECKIDENT (department, reseed, 1)
INSERT INTO department (department_name, location_id ) VALUES ('��������2', 2)--2
INSERT INTO department (department_name, location_id ) VALUES ('��������1', 1)--3
INSERT INTO department (department_name, location_id ) VALUES ('����������1', 1)--4
INSERT INTO department (department_name, location_id ) VALUES ('������� ����', 10)--5
INSERT INTO department (department_name, location_id ) VALUES ('����������2', 2)--6
INSERT INTO department (department_name, location_id ) VALUES ('��������2', 2)--7
INSERT INTO department (department_name, location_id ) VALUES ('��������3', 3)--8
INSERT INTO department (department_name, location_id ) VALUES ('��������3', 3)--9
INSERT INTO department (department_name, location_id ) VALUES ('����������1', 1)--10

SET IDENTITY_INSERT car ON
INSERT INTO car (car_id, car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES (1, '�456��-95', 2010, 3, 6, '2015-02-17')
SET IDENTITY_INSERT car OFF
DBCC CHECKIDENT (car, reseed, 1)
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�542��-95', 2010, 3, 6, '2015-01-15')--2
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�845��-95', 2010, 3, 5, '2014-03-28')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�202��-95', 2013, 3, 5, '2015-07-02')--4
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�578��-95', 2011, 2, 2, '2015-07-28')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�452��-95', 2011, 2, 2, '2015-07-13')--6
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�587��-95', 2015, 2, 4, '2015-12-23')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�652��-95', 2014, 2, 1, '2014-04-04')--8
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�375��-95', 2012, 2, 3, '2014-04-04')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�204��-95', 2013, 2, 6, '2015-06-28')--10
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�257��-95', 2006, 2, 9, '2015-06-28')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�308��-95', 2003, 2, 10, '2015-06-28')--12
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�001��-78', 2007, 2, 7, '2008-01-01')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�002��-78', 2007, 2, 6, '2008-02-02')--14
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('�003��-78', 2007, 2, 8, '2008-03-03')

SET IDENTITY_INSERT employee ON
INSERT INTO employee (employee_id, last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	(1, '������', '������', 1, 1, '2000-02-14', NULL, 100000, 2000, 4) 
SET IDENTITY_INSERT employee OFF
DBCC CHECKIDENT (employee, reseed, 1)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('������', '����', 1, 1, '2007-05-17', '2010-11-24' ,75000, 2000, 1)--2
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('�������', '�����', 1, 1, '2002-12-04', NULL,80000, 1500, 1)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('����������', '����', 3, 1, '2005-11-28', NULL,75000, 2500, 1)--4
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('�������', '�������', 5, 1, '2007-01-25', NULL,75000, 2000, 2)	
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('�����', '�������', 5, 1, '2010-04-03', NULL,80000, 3500, 2)--6
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('������', '�����', 5, 1, '2011-03-15', NULL,70000, 1000, 2)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('����������', '�������', 5, 1, '2011-04-15', NULL,70000, 1000, 2)--8
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('������', '������', 5, 1, '2011-04-16', NULL,70000, 1000, 2)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('�������', '������', 5, 2, '2008-12-14', NULL,55000,1500, 2)--10				
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('�����', '�������', 3, 2, '2008-12-17', NULL,56000,1500, 1)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('�������', '��������', 1, 4, '2009-12-01', NULL, 60000, 1000, 4)--12  
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('�����������', '�������', 12, 4, '2010-04-23', NULL, 65000, 1000, 1)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('�������', '�����', 1, 5, '2012-05-07', NULL, 60000, 550, 1)--14
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('�������', '�����', 1, 5, '2013-04-23', NULL, 60000, 700, 1)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('������', '���������', 1, 5, '2014-01-25', NULL, 60000, 1000, 3)--16
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('������', '����', 1, 5, '2014-01-25', NULL, 60000, 1000, 3)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('���������', '���������', 2, 5, '2014-01-24', NULL, 60000, 1000, 3)--18
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('�������', '�����', 2, 1, '2014-02-23', NULL, 60000, 1000, 2)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('������', '����', 2, 1, '2014-01-20', NULL, 60000, 1000, 2)--20


SET IDENTITY_INSERT technical_service ON
INSERT INTO technical_service (id, departmen_id, serviceman_id, car_id, start_date, finish_date, type_of_work) VALUES (1, 4, 14, 2, '2014-07-12', '2014-07-12', '������_�����')
SET IDENTITY_INSERT technical_service OFF
DBCC CHECKIDENT (technical_service, reseed, 1)
INSERT INTO technical_service (departmen_id, serviceman_id, car_id, start_date, finish_date, type_of_work) VALUES (4, 13, 3, '2014-07-23', '2014-07-30', '�����_�������')
INSERT INTO technical_service (departmen_id, serviceman_id, car_id, start_date, finish_date, type_of_work) VALUES (4, 12, 7, '2014-09-10', '2014-09-13', '������_������')
INSERT INTO technical_service (departmen_id, serviceman_id, car_id, start_date, finish_date, type_of_work) VALUES (4, 13, 2, '2014-10-23', '2014-10-23', '�����_��������')
INSERT INTO technical_service (departmen_id, serviceman_id, car_id, start_date, finish_date, type_of_work) VALUES (4, 14, 5, '2014-10-23', '2014-10-25', '������_������')

SET IDENTITY_INSERT client ON
INSERT INTO client (client_id, first_name, last_name, location_id, phone_number) VALUES (1, '��������', '������', 4, '9175002030')
SET IDENTITY_INSERT client OFF
DBCC CHECKIDENT (client, reseed, 1)
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('����������', '���������', 5, '9155003525')--2
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('�������', '�������', 6, '9155002805')
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('����������', '����', 7, '9122058456')--4
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('������', '������', 8, '9305469852')
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('��������', '������', 9, '9205482365')--6
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('��������', '����', 11, '9522712364')
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('�������', '����', 12, '98257458521')--8
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('��������', '�������', 13, '99122528789')
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('������', '�����', 14, '99122585648')--10


SET IDENTITY_INSERT orders ON
INSERT INTO orders (order_id, client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES (1, 1, 1, 1500,'2015-01-10', '2015-01-12', '2015-01-16', 4, '����������')
SET IDENTITY_INSERT orders OFF
DBCC CHECKIDENT (orders, reseed, 1)
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(2, 1, 2000, '2015-01-10', '2015-01-14', '2015-01-16', 4, '����������')--2
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(2, 1, 2000, '2015-02-01', '2015-02-01', '2015-02-15', 10, '����������')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(1, 2, 2500, '2015-02-09', '2015-02-14', '2015-02-20', 7, '����������')--4
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(5, 3, 3300, '2015-02-07', '2015-02-14', '2015-02-18', 1, '����������')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(6, 5, 3500, '2015-04-12', '2015-04-14', '2015-04-23', 12, '��������������')--6
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(4, 3, 2700, '2015-04-13', '2015-04-14', '2015-04-25', 1, '��������������')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(3, 4, 3000, '2016-02-20', '2016-02-22', '2016-03-01', 6, '����������')--8
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(5, 4, 3250, '2016-02-15', '2016-02-27', '2016-03-04', 9, '����������')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 5, 4000, '2015-02-18', '2015-02-20', '2015-03-05', 1, '����������')--10
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(5, 6, 3200, '2015-03-01', '2015-03-02', '2015-03-04', 14, '����������')--���
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(2, 7, 2850, '2015-03-09', '2015-03-10', '2015-03-15', 16, '����������')--12 --���
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(3, 6, 1500, '2015-03-08', '2015-03-10', '2015-03-12', 15, '����������')--���
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(7, 8, 1000, '2015-03-11', '2015-03-12', '2015-03-14', 17, '����������')--14 --���
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1200, '2015-03-13', '2015-03-14', '2015-03-15', 13, '����������')--���
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1200, '2015-03-13', '2015-03-15', '2015-03-16', 13, '����������')--16
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1100, '2015-03-13', '2015-03-16', '2015-03-17', 13, '����������')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1300, '2015-03-13', '2015-03-17', '2015-03-20', 13, '����������')--18
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1250, '2015-03-13', '2015-03-18', '2015-03-21', 13, '����������')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1400, '2015-03-13', '2015-03-19', '2015-03-20', 13, '����������')--20

SET IDENTITY_INSERT items_to_deliver ON
INSERT INTO items_to_deliver (item_id, item_type_id, item_name, item_capacity, item_volume) VALUES (1, 3, '��������������', 70, 10)
SET IDENTITY_INSERT items_to_deliver OFF
DBCC CHECKIDENT (items_to_deliver, reseed, 1)
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (6, '������2577', 3000, 1.5)--2
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (1, '����������257', 5000, 2)--���
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (1, '���������325', 1500, 1)--4 --���
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (2, '����23', 10000, 6)
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (4, '������3000', 2500, 3)--6 --���
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (5, '��������2', 700, NULL )--���
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (2, '��������73', 8000, 5)--8
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (5, '������������', 1500, NULL)
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (10, '������������', 3000, 1)--10
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (10, '�������', 3000, 1)
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (10, '�������2000', 3000, 1)--12
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (10, '������', 3000, 1)
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (10, '���������', 3000, 1)--14


SET IDENTITY_INSERT cars_in_order ON
INSERT INTO cars_in_order (cars_in_order_id, car_id, driver_id) VALUES (1, 1, 2)
SET IDENTITY_INSERT cars_in_order OFF
DBCC CHECKIDENT (cars_in_order, reseed, 1)
INSERT INTO cars_in_order (car_id, driver_id) VALUES (2, 1)--2
INSERT INTO cars_in_order (car_id, driver_id) VALUES (3, 3)
INSERT INTO cars_in_order (car_id, driver_id) VALUES (4, 12)--4
INSERT INTO cars_in_order (car_id, driver_id) VALUES (5, 14)
INSERT INTO cars_in_order (car_id, driver_id) VALUES (6, 15)--6
INSERT INTO cars_in_order (car_id, driver_id) VALUES (7, 16)
INSERT INTO cars_in_order (car_id, driver_id) VALUES (6, 15)--8
INSERT INTO cars_in_order (car_id, driver_id) VALUES (5, 18)
INSERT INTO cars_in_order (car_id, driver_id) VALUES (6, 18)--10
INSERT INTO cars_in_order (car_id, driver_id) VALUES (4, 18)
INSERT INTO cars_in_order (car_id, driver_id) VALUES (6, 18)--12



SET IDENTITY_INSERT delivery_delays ON
INSERT INTO delivery_delays (delay_id, car_in_order_id, delay_reason, expected_delay_time) VALUES (1, 1, '������', '02-07-2016')
SET IDENTITY_INSERT delivery_delays OFF
DBCC CHECKIDENT (delivery_delays, reseed, 1)


INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (1,1)--1
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (1,2)--2
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (1,3) --���
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (2,4)--4 --���
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (2,5)
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,6)--6 --���
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,7)--���
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,8)--8
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,9)
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,10)--10

INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (9,11)
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (10,12)--12
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,13)
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (2,14)--14


INSERT INTO items_in_order (item_id, order_id) VALUES (1,2)
INSERT INTO items_in_order (item_id, order_id) VALUES (2,11)--2
INSERT INTO items_in_order (item_id, order_id) VALUES (3,11)--���
INSERT INTO items_in_order (item_id, order_id) VALUES (4,13)--4 --���
INSERT INTO items_in_order (item_id, order_id) VALUES (5,3)
INSERT INTO items_in_order (item_id, order_id) VALUES (6,15)--6 --���
INSERT INTO items_in_order (item_id, order_id) VALUES (7,15)--���
INSERT INTO items_in_order (item_id, order_id) VALUES (8,4)--8
INSERT INTO items_in_order (item_id, order_id) VALUES (9,15)
INSERT INTO items_in_order (item_id, order_id) VALUES (10,16)--10
INSERT INTO items_in_order (item_id, order_id) VALUES (11,17)
INSERT INTO items_in_order (item_id, order_id) VALUES (12,18)--12
INSERT INTO items_in_order (item_id, order_id) VALUES (13,19)
INSERT INTO items_in_order (item_id, order_id) VALUES (14,20)--14

select* 
from employee

 
									