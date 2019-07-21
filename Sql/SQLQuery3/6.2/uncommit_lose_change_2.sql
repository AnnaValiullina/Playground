USE[BD]
GO--почти потеренные изменения. --READ UNCOMMITTED просек этот случай и заблочилSET TRANSACTION ISOLATION LEVEL READ UNCOMMITTEDBEGIN TRANSACTIONUPDATE car_brand SET brand_name = brand_name + '&&'
WHERE volume = 70
COMMIT

SELECT * FROM car_brand
WHERE volume = 70

---------------------
--а давайте потеряем
BEGIN TRANSACTION

SELECT * INTO newtable2 FROM car_brand
UPDATE newtable2 SET brand_name = brand_name + '&&'
WHERE volume = 70

	
UPDATE car_brand 
SET car_brand.brand_name = newtable2.brand_name 
FROM car_brand join newtable2 on car_brand.brand_id = newtable2.brand_id 
WHERE car_brand.volume = 70

COMMIT

select* from newtable2
select* from car_brand

DROP TABLE[newtable2]



