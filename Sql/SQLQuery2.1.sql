use [BD]

go

--фамили€ клиента, заказавшего на наибольшую стоимость в 2015 году (от него наибольша€ выручка)
--ѕавловска€
SELECT TOP 1 c.first_name 
FROM client c
LEFT JOIN orders o ON c.client_id = o.client_id
WHERE DATEPART(yy, o.order_date) = 2015
GROUP BY c.first_name
ORDER BY sum(o.price) DESC

--какую машину реже всего используют при доставке товаров
--о452си-95
SELECT TOP 1 c.car_number
FROM car c
RIGHT JOIN cars_in_order cio ON c.car_id = cio.car_id
GROUP BY c.car_number
ORDER BY count(*) DESC

--количество клиентов, живущих в ≈катеринбурге
-- 2 человека: яковенко и ѕушн€к
SELECT COUNT (c.first_name) AS number_of_client
FROM client c
LEFT JOIN adress a ON c.location_id = a.adress_id
LEFT JOIN city ON city.city_id = a.city_id
WHERE city.city_name = '≈катеринбург'



--сколько в среднем заказывали люстр?
SELECT AVG( number) AS average_number
FROM(
	SELECT COUNT(iio.item_id) AS number 
	FROM items_in_order  iio
	LEFT JOIN items_to_deliver itd ON iio.item_id = itd.item_id
	LEFT JOIN item_type it ON it.item_type_id = itd.item_type_id
	WHERE it.type_name = 'люстра'
	GROUP BY iio.order_id
) num
















