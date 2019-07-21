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
INSERT INTO job (job_id, description) VALUES (1, 'водитель')
SET IDENTITY_INSERT job OFF
DBCC CHECKIDENT (job, reseed, 1)
INSERT INTO job (description) VALUES ('грузчик') --2
INSERT INTO job (description) VALUES ('секретарь')
INSERT INTO job (description) VALUES ('оператор')--4
INSERT INTO job (description) VALUES ('автомеханик')
INSERT INTO job (description) VALUES ('заправщик')--6
INSERT INTO job (description) VALUES ('уборщик')
INSERT INTO job (description) VALUES ('охранник')--8
INSERT INTO job (description) VALUES ('кадровик')
INSERT INTO job (description) VALUES ('помощник секретаря')--10

SET IDENTITY_INSERT car_brand ON
INSERT INTO car_brand (brand_id, brand_name, volume, capacity)  VALUES (1, 'газель_NEXT',70, 1)
SET IDENTITY_INSERT car_brand OFF
DBCC CHECKIDENT (car_brand, reseed, 1)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('газ-3302', 65, 1)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('газ-2705', 65, 1.5)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('форд-транзит', 75, 2)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('рено-трафик1', 70, 1)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('рено-трафик2', 68, 1.5)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('рено-трафик3', 65, 2)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('рено-трафик4', 65, 1.7)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('газ-2700', 67, 2)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('газ-2707', 65, 2.2)
INSERT INTO car_brand (brand_name, volume, capacity)  VALUES ('газ-3352', 70, 2)--10

SET IDENTITY_INSERT city ON
INSERT INTO city (city_id, city_name) VALUES (1, 'Екатеринбург')
SET IDENTITY_INSERT city OFF
DBCC CHECKIDENT (city, reseed, 1)
INSERT INTO city (city_name) VALUES ('Архангельск')
INSERT INTO city (city_name) VALUES ('Чита')
INSERT INTO city (city_name) VALUES ('Пермь')
INSERT INTO city (city_name) VALUES ('Тавда')
INSERT INTO city (city_name) VALUES ('Уфа')
INSERT INTO city (city_name) VALUES ('Березовский')
INSERT INTO city (city_name) VALUES ('Москва')
INSERT INTO city (city_name) VALUES ('Питер')
INSERT INTO city (city_name) VALUES ('Долгопрудный')--10


SET IDENTITY_INSERT item_type ON
INSERT INTO item_type (item_type_id, type_name) VALUES (1, 'ковер')
SET IDENTITY_INSERT item_type OFF
DBCC CHECKIDENT (item_type, reseed, 1)
INSERT INTO item_type (type_name) VALUES ('шкаф')
INSERT INTO item_type (type_name) VALUES ('кухонный-гарнитур')
INSERT INTO item_type (type_name) VALUES ('комод')
INSERT INTO item_type (type_name) VALUES ('полка')
INSERT INTO item_type (type_name) VALUES ('кресло')
INSERT INTO item_type (type_name) VALUES ('стул')
INSERT INTO item_type (type_name) VALUES ('шкаф-купе')
INSERT INTO item_type (type_name) VALUES ('зеркало-стекло')
INSERT INTO item_type (type_name) VALUES ('люстра')--10


SET IDENTITY_INSERT adress ON
INSERT INTO adress (adress_id, street, house, city_id, zip_code, city_area) VALUES (1, 'Маяковского', 25, 2, 620062, 66)
SET IDENTITY_INSERT adress OFF
DBCC CHECKIDENT (adress, reseed, 1)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Первомайская', 72, 3, 675204, 67)--2
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Ленина', 52, 3, 845205, 23)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Гагарина', 43, 4, 547803, 56)--4
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Луначарского', 72, 6, 458620, 23)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Белинского', 144, 7, 625498, 40)--6
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Розы Люксембург', 89, 9, 450378, 51)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Саввы Белых', 12, 4, 348957, 25)--8
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Энгельса', 54, 5, 234856, 85)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Яблоневая', 78, 9, 645230, 58)--10
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Красноармейская', 5, 3, 245058, 46)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Кирова', 2, 2, 232562, 20)--12
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Губайлово', 7, 1, 513258, 63)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Беклемишево', 52, 1, 113452, 36)--14
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Муницыно', 78, 1, 251235, 3)
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Бабайлово', 89, 1, 232355, 4)--16
INSERT INTO adress (street, house, city_id, zip_code, city_area) VALUES ('Немаево', 87, 1, 281219, 39)--17



SET IDENTITY_INSERT department ON
INSERT INTO department (department_id, department_name, location_id ) VALUES (1, 'парковка1', 1)
SET IDENTITY_INSERT department OFF
DBCC CHECKIDENT (department, reseed, 1)
INSERT INTO department (department_name, location_id ) VALUES ('парковка2', 2)--2
INSERT INTO department (department_name, location_id ) VALUES ('заправка1', 1)--3
INSERT INTO department (department_name, location_id ) VALUES ('мастерская1', 1)--4
INSERT INTO department (department_name, location_id ) VALUES ('главный офис', 10)--5
INSERT INTO department (department_name, location_id ) VALUES ('мастерская2', 2)--6
INSERT INTO department (department_name, location_id ) VALUES ('заправка2', 2)--7
INSERT INTO department (department_name, location_id ) VALUES ('парковка3', 3)--8
INSERT INTO department (department_name, location_id ) VALUES ('заправка3', 3)--9
INSERT INTO department (department_name, location_id ) VALUES ('мастерская1', 1)--10

SET IDENTITY_INSERT car ON
INSERT INTO car (car_id, car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES (1, 'х456ор-95', 2010, 3, 6, '2015-02-17')
SET IDENTITY_INSERT car OFF
DBCC CHECKIDENT (car, reseed, 1)
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('а542рп-95', 2010, 3, 6, '2015-01-15')--2
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('м845хк-95', 2010, 3, 5, '2014-03-28')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('а202пк-95', 2013, 3, 5, '2015-07-02')--4
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('т578пр-95', 2011, 2, 2, '2015-07-28')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('о452си-95', 2011, 2, 2, '2015-07-13')--6
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('и587пх-95', 2015, 2, 4, '2015-12-23')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('о652ск-95', 2014, 2, 1, '2014-04-04')--8
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('у375тп-95', 2012, 2, 3, '2014-04-04')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('и204шк-95', 2013, 2, 6, '2015-06-28')--10
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('о257то-95', 2006, 2, 9, '2015-06-28')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('и308пк-95', 2003, 2, 10, '2015-06-28')--12
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('н001ул-78', 2007, 2, 7, '2008-01-01')
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('н002ул-78', 2007, 2, 6, '2008-02-02')--14
INSERT INTO car (car_number, manufacture_year, department_id, brand_id, last_vehicle_inspection) VALUES ('н003ул-78', 2007, 2, 8, '2008-03-03')

SET IDENTITY_INSERT employee ON
INSERT INTO employee (employee_id, last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	(1, 'Иванов', 'Кирилл', 1, 1, '2000-02-14', NULL, 100000, 2000, 4) 
SET IDENTITY_INSERT employee OFF
DBCC CHECKIDENT (employee, reseed, 1)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Петров', 'Илья', 1, 1, '2007-05-17', '2010-11-24' ,75000, 2000, 1)--2
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Каримов', 'Антон', 1, 1, '2002-12-04', NULL,80000, 1500, 1)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Стежникова', 'Алла', 3, 1, '2005-11-28', NULL,75000, 2500, 1)--4
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Ульянов', 'Дмитрий', 5, 1, '2007-01-25', NULL,75000, 2000, 2)	
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Туров', 'Алексей', 5, 1, '2010-04-03', NULL,80000, 3500, 2)--6
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Шустов', 'Артем', 5, 1, '2011-03-15', NULL,70000, 1000, 2)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Овчинников', 'Николай', 5, 1, '2011-04-15', NULL,70000, 1000, 2)--8
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Шалаев', 'Андрей', 5, 1, '2011-04-16', NULL,70000, 1000, 2)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Пупышев', 'Михаил', 5, 2, '2008-12-14', NULL,55000,1500, 2)--10				
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Овцын', 'Дмитрий', 3, 2, '2008-12-17', NULL,56000,1500, 1)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Тащилин', 'Вячеслав', 1, 4, '2009-12-01', NULL, 60000, 1000, 4)--12  
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Трапезников', 'Дмитрий', 12, 4, '2010-04-23', NULL, 65000, 1000, 1)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Демашов', 'Данил', 1, 5, '2012-05-07', NULL, 60000, 550, 1)--14
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Денисов', 'Антон', 1, 5, '2013-04-23', NULL, 60000, 700, 1)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Ложкин', 'Александр', 1, 5, '2014-01-25', NULL, 60000, 1000, 3)--16
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Ложкин', 'Саша', 1, 5, '2014-01-25', NULL, 60000, 1000, 3)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Кравченко', 'Александр', 2, 5, '2014-01-24', NULL, 60000, 1000, 3)--18
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Погодин', 'Роман', 2, 1, '2014-02-23', NULL, 60000, 1000, 2)
INSERT INTO employee (last_name, first_name, manager_id, job_id, hire_date, end_date, salary, commision, department_id) VALUES	('Пожнин', 'Петр', 2, 1, '2014-01-20', NULL, 60000, 1000, 2)--20


SET IDENTITY_INSERT technical_service ON
INSERT INTO technical_service (id, departmen_id, serviceman_id, car_id, start_date, finish_date, type_of_work) VALUES (1, 4, 14, 2, '2014-07-12', '2014-07-12', 'замена_масла')
SET IDENTITY_INSERT technical_service OFF
DBCC CHECKIDENT (technical_service, reseed, 1)
INSERT INTO technical_service (departmen_id, serviceman_id, car_id, start_date, finish_date, type_of_work) VALUES (4, 13, 3, '2014-07-23', '2014-07-30', 'новые_рессоры')
INSERT INTO technical_service (departmen_id, serviceman_id, car_id, start_date, finish_date, type_of_work) VALUES (4, 12, 7, '2014-09-10', '2014-09-13', 'замена_резины')
INSERT INTO technical_service (departmen_id, serviceman_id, car_id, start_date, finish_date, type_of_work) VALUES (4, 13, 2, '2014-10-23', '2014-10-23', 'новые_дворники')
INSERT INTO technical_service (departmen_id, serviceman_id, car_id, start_date, finish_date, type_of_work) VALUES (4, 14, 5, '2014-10-23', '2014-10-25', 'замена_свечей')

SET IDENTITY_INSERT client ON
INSERT INTO client (client_id, first_name, last_name, location_id, phone_number) VALUES (1, 'Усманова', 'Карина', 4, '9175002030')
SET IDENTITY_INSERT client OFF
DBCC CHECKIDENT (client, reseed, 1)
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('Павловская', 'Анастасия', 5, '9155003525')--2
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('Петрова', 'Татьяна', 6, '9155002805')
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('Недзвецкий', 'Марк', 7, '9122058456')--4
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('Жужгин', 'Максим', 8, '9305469852')
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('Журавлев', 'Михаил', 9, '9205482365')--6
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('Ляпустин', 'Олег', 11, '9522712364')
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('Ермолов', 'Иван', 12, '98257458521')--8
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('Яковенко', 'Алексей', 13, '99122528789')
INSERT INTO client (first_name, last_name, location_id, phone_number) VALUES('Пушняк', 'Костя', 14, '99122585648')--10


SET IDENTITY_INSERT orders ON
INSERT INTO orders (order_id, client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES (1, 1, 1, 1500,'2015-01-10', '2015-01-12', '2015-01-16', 4, 'доставлено')
SET IDENTITY_INSERT orders OFF
DBCC CHECKIDENT (orders, reseed, 1)
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(2, 1, 2000, '2015-01-10', '2015-01-14', '2015-01-16', 4, 'доставлено')--2
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(2, 1, 2000, '2015-02-01', '2015-02-01', '2015-02-15', 10, 'доставлено')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(1, 2, 2500, '2015-02-09', '2015-02-14', '2015-02-20', 7, 'доставлено')--4
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(5, 3, 3300, '2015-02-07', '2015-02-14', '2015-02-18', 1, 'доставлено')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(6, 5, 3500, '2015-04-12', '2015-04-14', '2015-04-23', 12, 'обрабатывается')--6
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(4, 3, 2700, '2015-04-13', '2015-04-14', '2015-04-25', 1, 'обрабатывается')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(3, 4, 3000, '2016-02-20', '2016-02-22', '2016-03-01', 6, 'доставлено')--8
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(5, 4, 3250, '2016-02-15', '2016-02-27', '2016-03-04', 9, 'доставлено')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 5, 4000, '2015-02-18', '2015-02-20', '2015-03-05', 1, 'доставлено')--10
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(5, 6, 3200, '2015-03-01', '2015-03-02', '2015-03-04', 14, 'доставлено')--екб
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(2, 7, 2850, '2015-03-09', '2015-03-10', '2015-03-15', 16, 'доставлено')--12 --екб
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(3, 6, 1500, '2015-03-08', '2015-03-10', '2015-03-12', 15, 'доставлено')--екб
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(7, 8, 1000, '2015-03-11', '2015-03-12', '2015-03-14', 17, 'доставлено')--14 --екб
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1200, '2015-03-13', '2015-03-14', '2015-03-15', 13, 'доставлено')--екб
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1200, '2015-03-13', '2015-03-15', '2015-03-16', 13, 'доставлено')--16
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1100, '2015-03-13', '2015-03-16', '2015-03-17', 13, 'доставлено')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1300, '2015-03-13', '2015-03-17', '2015-03-20', 13, 'доставлено')--18
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1250, '2015-03-13', '2015-03-18', '2015-03-21', 13, 'доставлено')
INSERT INTO orders (client_id, accountant_id, price, order_date, arrival_date, expected_delivery_date, arrival_location_id, status) VALUES(8, 9, 1400, '2015-03-13', '2015-03-19', '2015-03-20', 13, 'доставлено')--20

SET IDENTITY_INSERT items_to_deliver ON
INSERT INTO items_to_deliver (item_id, item_type_id, item_name, item_capacity, item_volume) VALUES (1, 3, 'ХОЗЯЙКИНАМЕЧТА', 70, 10)
SET IDENTITY_INSERT items_to_deliver OFF
DBCC CHECKIDENT (items_to_deliver, reseed, 1)
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (6, 'КРЕСЛО2577', 3000, 1.5)--2
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (1, 'ПЕРСИДСКИЙ257', 5000, 2)--екб
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (1, 'ИНДИЙСКИЙ325', 1500, 1)--4 --екб
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (2, 'КУПЕ23', 10000, 6)
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (4, 'АТЛАНТ3000', 2500, 3)--6 --екб
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (5, 'ДЛЯШКОЛЫ2', 700, NULL )--екб
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (2, 'СТАНДАРТ73', 8000, 5)--8
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (5, 'ОФИССТАНДАРТ', 1500, NULL)
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (10, 'СКАЗОЧНЫЙЛЕС', 3000, 1)--10
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (10, 'СВЕТИЛО', 3000, 1)
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (10, 'СВЕТИЛО2000', 3000, 1)--12
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (10, 'НИМБУС', 3000, 1)
INSERT INTO items_to_deliver (item_type_id, item_name, item_capacity, item_volume) VALUES (10, 'ЖЕМЧУЖИНА', 3000, 1)--14


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
INSERT INTO delivery_delays (delay_id, car_in_order_id, delay_reason, expected_delay_time) VALUES (1, 1, 'пробки', '02-07-2016')
SET IDENTITY_INSERT delivery_delays OFF
DBCC CHECKIDENT (delivery_delays, reseed, 1)


INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (1,1)--1
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (1,2)--2
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (1,3) --екб
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (2,4)--4 --екб
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (2,5)
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,6)--6 --екб
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,7)--екб
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,8)--8
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,9)
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,10)--10

INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (9,11)
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (10,12)--12
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (3,13)
INSERT INTO items_in_cars (cars_in_order_id, item_id ) VALUES (2,14)--14


INSERT INTO items_in_order (item_id, order_id) VALUES (1,2)
INSERT INTO items_in_order (item_id, order_id) VALUES (2,11)--2
INSERT INTO items_in_order (item_id, order_id) VALUES (3,11)--екб
INSERT INTO items_in_order (item_id, order_id) VALUES (4,13)--4 --екб
INSERT INTO items_in_order (item_id, order_id) VALUES (5,3)
INSERT INTO items_in_order (item_id, order_id) VALUES (6,15)--6 --екб
INSERT INTO items_in_order (item_id, order_id) VALUES (7,15)--екб
INSERT INTO items_in_order (item_id, order_id) VALUES (8,4)--8
INSERT INTO items_in_order (item_id, order_id) VALUES (9,15)
INSERT INTO items_in_order (item_id, order_id) VALUES (10,16)--10
INSERT INTO items_in_order (item_id, order_id) VALUES (11,17)
INSERT INTO items_in_order (item_id, order_id) VALUES (12,18)--12
INSERT INTO items_in_order (item_id, order_id) VALUES (13,19)
INSERT INTO items_in_order (item_id, order_id) VALUES (14,20)--14

select* 
from employee

 
									