USE[BD]GO--этот уровень изол€ции не защищает от неповтор€ющегос€ чтени€SET TRANSACTION ISOLATION LEVEL READ COMMITTEDBEGIN TRANSACTIONSELECT * FROM car_brand
WHERE volume = 70

SELECT * FROM car_brand
WHERE volume = 70
COMMIT

