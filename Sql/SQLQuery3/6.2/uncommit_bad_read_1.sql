USE[BD]
GOSET TRANSACTION ISOLATION LEVEL READ UNCOMMITTEDBEGIN TRANSACTIONSELECT * FROM car_brand
WHERE volume = 70

COMMIT
