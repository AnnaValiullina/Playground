--###################################################################################################################################
--не позвол€ет добавить в список рейсов запись, в которой фигурирует автомобиль, техобслуживание которого пройдено более 4 лет назад.

/*
CREATE TRIGGER [dbo].[trip_insert_trig]
ON [dbo].[cars_in_order] INSTEAD OF INSERT
AS
DECLARE
@car_id INT

SELECT @car_id=[car_id] FROM [inserted]
IF EXISTS(SELECT 1 
			FROM car 
			WHERE car_id = @car_id AND DATEDIFF(yy, last_vehicle_inspection, GETDATE()) < 4 )
--то пройдено в ближайшие 4 года
	BEGIN
	INSERT INTO cars_in_order SELECT car_id, driver_id FROM [inserted]
	END
ELSE
	BEGIN
	RAISERROR ('¬ыбран автомобиль, “ќ которого не пройдено!', 16, 1);
	END
GO

*/
--###################################################################################################################################
--тот же самый триггер, но с множественным добавлением и выбором только подход€щих записей

IF OBJECT_ID ('trip_insert_trig', 'TR') IS NOT NULL
   DROP TRIGGER trip_insert_trig;
GO
CREATE TRIGGER [dbo].[trip_insert_trig]
ON [dbo].[cars_in_order] INSTEAD OF INSERT
AS
DECLARE @car_id INT
DECLARE @fetch_status INT

--курсор дл€ построчной обработки
DECLARE my_cursor CURSOR FOR
SELECT DISTINCT car_id FROM [inserted]
OPEN my_cursor
  
--получаем определенную строку из курсора
FETCH NEXT FROM my_cursor
INTO @car_id
--@@FETCH_STATUS возвращает состо€ние последней инструкции FETCH,
SELECT @fetch_status=@@FETCH_STATUS


--@fetch_status = -1, когда выполнение инструкции FETCH завершилось неудачно или 
--строка оказалась вне пределов результирующего набора.
WHILE @fetch_status<>-1
BEGIN
  --@fetch_status = -2, когда выбранна€ строка отсутствует
  IF (@fetch_status<>-2)
  BEGIN
--  определ€ем действи€ над курсором
	IF EXISTS(SELECT 1 FROM car WHERE car_id=@car_id AND DATEDIFF(yy, last_vehicle_inspection, GETDATE()) < 4)
	BEGIN
		INSERT INTO cars_in_order 
			SELECT car_id, driver_id
			FROM [inserted]
			WHERE car_id=@car_id
		
	END
	ELSE
	BEGIN
		RAISERROR ('¬ыбран автомобиль, “ќ которого не пройдено!', 16, 1);
	END

    FETCH NEXT FROM my_cursor
    INTO @car_id
    SELECT @fetch_status=@@FETCH_STATUS

  END --IF (@fetch_status<>-2)
END --WHILE @fetch_status<>-1

CLOSE my_cursor
DEALLOCATE my_cursor

*/

-------------------------------------------------------------------------------------------------------------------------------------
--тест добавлени€ двух записей: корректной и некорректной.
--13, 14, 15 не подход€т

--ќ 
Begin transaction 
	INSERT INTO cars_in_order (car_id, driver_id) VALUES (10, 1)
rollback

--работать Ќ≈ должно
Begin transaction 
	INSERT INTO cars_in_order (car_id, driver_id) VALUES (13, 1)
rollback

Begin transaction 
	INSERT INTO cars_in_order (car_id, driver_id) VALUES (10, 1)
	INSERT INTO cars_in_order (car_id, driver_id) VALUES (13, 1)
	INSERT INTO cars_in_order (car_id, driver_id) VALUES (14, 1)
	INSERT INTO cars_in_order (car_id, driver_id) VALUES (7, 1)
rollback


Select *
from cars_in_order




