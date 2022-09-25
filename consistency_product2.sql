-- Consistency product 2
SELECT *
FROM iowa_drink_sales
WHERE store_number IN (SELECT store_number 
					 FROM (
							SELECT 
							  store_number,
							  COUNT(DISTINCT(store_name)) AS total_store_name,
							  COUNT(DISTINCT(address)) AS total_store_address,
							  COUNT(DISTINCT(city)) AS total_store_address,
							  COUNT(DISTINCT(zip_code)) AS total_store_zip_code,
							  COUNT(DISTINCT(store_location)) AS total_store_location,
							  COUNT(DISTINCT(county_number)) AS total_store_anumber,
							  COUNT(DISTINCT(county)) AS total_store_county
							FROM 
								iowa_drink_sales
							GROUP BY
								store_number
							HAVING 
								COUNT(DISTINCT(store_name)) > 1 OR
						 		COUNT(DISTINCT(address)) > 1 OR
						 		COUNT(DISTINCT(city)) > 1 OR
						 		COUNT(DISTINCT(zip_code)) > 1 OR
						 		COUNT(DISTINCT(store_location)) > 1 OR
						 		COUNT(DISTINCT(county_number)) > 1 OR
						 		COUNT(DISTINCT(county)) > 1
							ORDER BY 
								total_store_name DESC, store_number
								)A
					)
ORDER BY store_number;
