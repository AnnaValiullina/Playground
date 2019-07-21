--###################################################################################################################################
--�� ��������� �������� � ������ ������ ������, � ������� ���������� ����������, ��������������� �������� �������� ����� 4 ��� �����.

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
--�� �������� � ��������� 4 ����
	BEGIN
	INSERT INTO cars_in_order SELECT car_id, driver_id FROM [inserted]
	END
ELSE
	BEGIN
	RAISERROR ('������ ����������, �� �������� �� ��������!', 16, 1);
	END
GO

*/
--###################################################################################################################################
--��� �� ����� �������, �� � ������������� ����������� � ������� ������ ���������� �������

IF OBJECT_ID ('trip_insert_trig', 'TR') IS NOT NULL
   DROP TRIGGER trip_insert_trig;
GO
CREATE TRIGGER [dbo].[trip_insert_trig]
ON [dbo].[cars_in_order] INSTEAD OF INSERT
AS
DECLARE @car_id INT
DECLARE @fetch_status INT

--������ ��� ���������� ���������
DECLARE my_cursor CURSOR FOR
SELECT DISTINCT car_id FROM [inserted]
OPEN my_cursor
  
--�������� ������������ ������ �� �������
FETCH NEXT FROM my_cursor
INTO @car_id
--@@FETCH_STATUS ���������� ��������� ��������� ���������� FETCH,
SELECT @fetch_status=@@FETCH_STATUS


--@fetch_status = -1, ����� ���������� ���������� FETCH ����������� �������� ��� 
--������ ��������� ��� �������� ��������������� ������.
WHILE @fetch_status<>-1
BEGIN
  --@fetch_status = -2, ����� ��������� ������ �����������
  IF (@fetch_status<>-2)
  BEGIN
--  ���������� �������� ��� ��������
	IF EXISTS(SELECT 1 FROM car WHERE car_id=@car_id AND DATEDIFF(yy, last_vehicle_inspection, GETDATE()) < 4)
	BEGIN
		INSERT INTO cars_in_order 
			SELECT car_id, driver_id
			FROM [inserted]
			WHERE car_id=@car_id
		
	END
	ELSE
	BEGIN
		RAISERROR ('������ ����������, �� �������� �� ��������!', 16, 1);
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
--���� ���������� ���� �������: ���������� � ������������.
--13, 14, 15 �� ��������

--��
Begin transaction 
	INSERT INTO cars_in_order (car_id, driver_id) VALUES (10, 1)
rollback

--�������� �� ������
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




