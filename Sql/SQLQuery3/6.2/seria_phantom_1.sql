USE[BD]
GO

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION 
SELECT * FROM car_brand
WHERE volume = 70

COMMIT
