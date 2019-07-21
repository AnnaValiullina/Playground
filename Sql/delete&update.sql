use [BD]

go


--������ �� ���� ��������, ������� ����� � 25 �������
--������ �� ������ ��������

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

--���������� ������������ ����� ������ ������
--����

DELETE FROM car
WHERE DATEDIFF (yy, car.manufacture_year, GETDATE()) > 10

select car_id
from car

--������� �������� ���� ����������, ���������� � ����� ������ 7 ��� 
--�� ��������((

UPDATE employee
SET salary = 70000
	FROM employee 
	LEFT JOIN job 
	ON employee.job_id = job.job_id
	WHERE job.description = '��������'
	AND DATEPART(yy, employee.hire_date) between 2000 and 2009 


select e.last_name, e.salary
from employee e, job j
where j.job_id = e.job_id
and j.description = '��������'

--������� �� ��� ��������� �����, ������� ���� ���������� ��
--��� �� �� ����, ������

UPDATE car
SET last_vehicle_inspection = '2016-04-03'
WHERE DATEPART(yy, last_vehicle_inspection) = 2014


select car_id, last_vehicle_inspection
from car
where last_vehicle_inspection = '2016-04-03'

