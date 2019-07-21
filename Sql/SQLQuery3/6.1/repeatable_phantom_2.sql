USE[BD]
GO
--фантомное чтение есть

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION 
INSERT INTO car_brand (brand_name, volume, capacity)  
VALUES ('для7', 70, 1)
COMMIT
