USE[BD]
GO

--должно зависать, потому что  никакая другая транзакция 
--не может изменять данные, читаемые текущей транзакцией,
-- пока та не окончена.

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION 
UPDATE car_brand SET brand_name = 'тротото' 
WHERE volume = 70
COMMIT