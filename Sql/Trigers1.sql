--###################################################################################################################################
--не позволяет добавить в список рейсов запись, в которой фигурирует автомобиль, техобслуживание которого пройдено более 4 лет назад.
IF OBJECT_ID ('trip_insert_trig_cor', 'TR') IS NOT NULL
   DROP TRIGGER trip_insert_trig_cor;
GO

CREATE TRIGGER [dbo].[trip_insert_trig_cor]
ON [dbo].[cars_in_order] INSTEAD OF INSERT
AS

INSERT INTO cars_in_order
SELECT ins.car_id, ins.driver_id
	FROM [inserted] ins
	INNER JOIN car ON ins.car_id=car.car_id
	WHERE DATEDIFF(yy, last_vehicle_inspection, GETDATE()) < 4


-------------------------------------------------------------------------------------------------------------------------------------
--тест добавления двух записей: корректной и некорректной.
--13, 14, 15 не подходят

--ОК
Begin transaction 
	INSERT INTO cars_in_order (car_id, driver_id) VALUES (10, 1)
rollback

--работать НЕ должно
Begin transaction 
	INSERT INTO cars_in_order (car_id, driver_id) VALUES (13, 1)
rollback

Begin transaction 
	INSERT INTO BD_copy..cars_in_order (car_id, driver_id) VALUES (10, 1)
	INSERT INTO BD_copy..cars_in_order (car_id, driver_id) VALUES (13, 1)
	INSERT INTO BD_copy..cars_in_order (car_id, driver_id) VALUES (14, 1)
	INSERT INTO BD_copy..cars_in_order  (car_id, driver_id) VALUES (7, 1)
rollback




Select *
from cars_in_order