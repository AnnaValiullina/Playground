use [BD]

go
----------------------------------------------------------------------------------------
--рейс(заказ), водитель, дата прибытия, дата приблизительного прибытия, место назначения 
----------------------------------------------------------------------------------------
IF OBJECT_ID ('dbo.trip_info', 'V') IS NOT NULL
    DROP VIEW dbo.trip_info
go

CREATE VIEW dbo.trip_info 
AS
SELECT ord.order_id AS trip_id, e.last_name AS driver, ord.arrival_date, ord.expected_delivery_date, ord.arrival_location_id
FROM orders ord
LEFT JOIN items_in_order iio ON ord.order_id = iio.order_id
INNER JOIN items_to_deliver itd ON itd.item_id = iio.item_id
LEFT JOIN items_in_cars iic ON iic.item_id = itd.item_id
LEFT JOIN cars_in_order cio ON cio.cars_in_order_id = iic.cars_in_order_id
LEFT JOIN employee e ON e.employee_id = cio.driver_id
LEFT JOIN  car c ON c.car_id = cio.car_id   
GO




UPDATE trip_info 
SET driver = 'Петров'
WHERE trip_id = 20 

SELECT *
FROM trip_info
ORDER BY trip_id


---------------------------------------------------------------------------------------------
--Марка автомобиля, грузоподъемность, количество рейсов за месяц
---------------------------------------------------------------------------------------------
IF OBJECT_ID ('dbo.car_info', 'V') IS NOT NULL
    DROP VIEW dbo.car_info
go

CREATE VIEW dbo.car_info 
AS
SELECT c.car_id, cb.brand_name AS brand, cb.capacity, MONTH(ord.expected_delivery_date) AS trip_month,  YEAR(ord.expected_delivery_date) AS trip_year, count(*) AS number_of_trips 
FROM car c
LEFT JOIN car_brand cb ON c.brand_id = cb.brand_id
LEFT JOIN cars_in_order cio ON c.car_id = cio.car_id
LEFT JOIN items_in_cars iic ON iic.cars_in_order_id = cio.cars_in_order_id
INNER JOIN items_to_deliver itd ON itd.item_id = iic.item_id
LEFT JOIN items_in_order iio ON iio.item_id = itd.item_id
LEFT JOIN orders ord ON ord.order_id = iio.order_id
WHERE ord.arrival_date IS NOT NULL
GROUP BY c.car_id, cb.brand_name, cb.capacity, YEAR(ord.expected_delivery_date), MONTH(ord.expected_delivery_date)
go

SELECT *
FROM car_info

----------------------------------------------------------------------------------------
--Водитель, количество рейсов за месяц, наиболее часто используемая им марка автомобиля.
----------------------------------------------------------------------------------------

IF OBJECT_ID ('dbo.help1_driver_info', 'V') IS NOT NULL
    DROP VIEW dbo.help1_driver_info
go

CREATE VIEW dbo.help1_driver_info
AS
SELECT cio.driver_id, e.last_name, MONTH(ord.expected_delivery_date) AS months,  count(*) AS number_in_month
FROM cars_in_order cio
LEFT JOIN car c ON c.car_id = cio.car_id
LEFT JOIN car_brand cb ON cb.brand_id = c.brand_id
LEFT JOIN items_in_cars iic ON cio.cars_in_order_id = iic.cars_in_order_id
LEFT JOIN items_to_deliver itd ON itd.item_id = iic.item_id
LEFT JOIN items_in_order iio ON iio.item_id = itd.item_id
LEFT JOIN orders ord ON ord.order_id = iio.order_id
LEFT JOIN employee e ON cio.driver_id = e.employee_id
WHERE ord.arrival_date IS NOT NULL
GROUP BY cio.driver_id, e.last_name, YEAR(ord.expected_delivery_date), MONTH(ord.expected_delivery_date)
go

SELECT*
FROM help1_driver_info


IF OBJECT_ID ('dbo.help2_driver_info', 'V') IS NOT NULL
    DROP VIEW dbo.help2_driver_info
go

CREATE VIEW dbo.help2_driver_info
AS
SELECT cio.driver_id, e.last_name, cb.brand_name , COUNT(*) AS number_of_use
FROM cars_in_order cio 
LEFT JOIN car c ON c.car_id = cio.car_id
LEFT JOIN car_brand cb ON cb.brand_id = c.brand_id
LEFT JOIN employee e ON e.employee_id = cio.driver_id
GROUP BY cio.driver_id, e.last_name, cb.brand_name
HAVING COUNT(*) >= ALL (SELECT COUNT(*) AS number_of_use
					FROM cars_in_order cio2
					LEFT JOIN car c ON c.car_id = cio2.car_id
					LEFT JOIN car_brand cb ON cb.brand_id = c.brand_id
					LEFT JOIN employee e ON e.employee_id = cio2.driver_id
					GROUP BY cio2.driver_id, e.last_name, cb.brand_name
					HAVING cio2.driver_id = cio.driver_id)
go

SELECT *
FROM help2_driver_info



SELECT help2_driver_info.driver_id, help1_driver_info.months, help1_driver_info.number_in_month, help2_driver_info.brand_name
FROM help2_driver_info 
INNER JOIN help1_driver_info ON help2_driver_info.driver_id = help1_driver_info.driver_id



-----------------------------------------------------------------------------------------
--клиент, заказываемые им товары, их количество
------------------------------------------------------
IF OBJECT_ID ('dbo.client_info', 'V') IS NOT NULL
    DROP VIEW dbo.client_info
go

CREATE VIEW dbo.client_info
AS
SELECT ord.client_id, it.type_name, Count(*) AS number
FROM client c 
RIGHT JOIN orders ord ON ord.client_id = c.client_id
INNER JOIN items_in_order iio ON ord.order_id = iio.order_id
INNER JOIN items_to_deliver itd ON itd.item_id = iio.item_id
INNER  JOIN item_type it ON it.item_type_id = itd.item_type_id
GROUP BY ord.client_id, it.type_name 

go


SELECT *
FROM client_info




-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--										ВЫБОРОКИ
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

--фамилия водителя, направляющегося в 13, после 2015-03-02
SELECT DISTINCT driver
FROM dbo.trip_info 
WHERE arrival_location_id = 13 AND arrival_date>= '2015-03-02'



--клиент и общее количество товара, что он заказал
SELECT client_id, SUM(number) AS total_number
FROM client_info
GROUP BY client_id

--вывести машины, имеющий грузоподъемность больше 1,5 тонн
SELECT car_id, capacity
FROM car_info
WHERE capacity >=1.5



--3 таблицы, можно добавлять новые строки в базу

IF OBJECT_ID ('dbo.extra1', 'V') IS NOT NULL
    DROP VIEW dbo.extra1
go

CREATE VIEW dbo.extra1
AS
SELECT d.department_id, a.street, a.house, c.city_nameб с.city_id
FROM department d
INNER JOIN adress a ON d.location_id = a.adress_id
INNER JOIN city c ON c.city_id = a.city_id
GO
SELECT* 
FROM extra1

GO
UPDATE extra1
SET street = 'Белинского'
WHERE street = 'Яблоневая' 

INSERT INTO extra1 (city_name)  VALUES ('Чита')





















