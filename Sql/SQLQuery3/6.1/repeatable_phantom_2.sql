USE[BD]
GO
--��������� ������ ����

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION 
INSERT INTO car_brand (brand_name, volume, capacity)  
VALUES ('���7', 70, 1)
COMMIT
