USE [BD]GO--т.к. READ COMMITTED защищает от грязного и чернового чтения, то все зависаетSET TRANSACTION ISOLATION LEVEL READ COMMITTEDBEGIN TRANSACTIONSELECT * FROM car_brand
WHERE volume = 70
COMMIT