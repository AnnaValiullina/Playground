use [BD]

go


--удалим из базы клиентов, которые живут в 25 регионе
--ЖУЖГИН НЕ ДОЛЖЕН ОСТАТЬСЯ

DELETE FROM client
WHERE client_id in(
	SELECT client_id
	FROM client
	INNER JOIN adress 
	ON adress.adress_id = client.location_id
	AND adress.city_area = '25'
	)


select client.first_name
from client

--перестанем использовать очень старые машины
--НУУУ

DELETE FROM car
WHERE DATEDIFF (yy, car.manufacture_year, GETDATE()) > 10

select car_id
from car

--повысим зарплату всем операторам, работающим в фирме больше 7 лет 
--НЕ РАБОТАЕТ((

UPDATE employee
SET salary = 70000
	FROM employee 
	LEFT JOIN job 
	ON employee.job_id = job.job_id
	WHERE job.description = 'оператор'
	AND DATEPART(yy, employee.hire_date) between 2000 and 2009 


select e.last_name, e.salary
from employee e, job j
where j.job_id = e.job_id
and j.description = 'оператор'

--провели то для некоторых машин, изменим дату последнего то
--КАК БЫ НЕ ЗНАЮ, ПОЧЕМУ

UPDATE car
SET last_vehicle_inspection = '2016-04-03'
WHERE DATEPART(yy, last_vehicle_inspection) = 2014


select car_id, last_vehicle_inspection
from car
where last_vehicle_inspection = '2016-04-03'

