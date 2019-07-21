USE[BD]
GOSET TRANSACTION ISOLATION LEVEL READ UNCOMMITTEDBEGIN TRANSACTIONUPDATE car_brand SET brand_name = brand_name + '!!'
WHERE volume = 70
COMMIT


--а давайте потеряем
BEGIN TRANSACTION

SELECT * INTO newtable1 FROM car_brand
UPDATE newtable1 SET brand_name = brand_name + '!!'
WHERE volume = 70

	
UPDATE car_brand 
SET car_brand.brand_name = newtable1.brand_name 
FROM car_brand join newtable1 on car_brand.brand_id = newtable1.brand_id 
WHERE car_brand.volume = 70

COMMIT

select* from newtable1
select* from car_brand

DROP TABLE[newtable1]