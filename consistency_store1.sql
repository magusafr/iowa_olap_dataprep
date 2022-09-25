-- store consistency
SELECT 
  store_number,
  COUNT(DISTINCT(store_name)) AS total_store_name,
  COUNT(DISTINCT(address)) AS total_address,
  COUNT(DISTINCT(city)) AS total_city,
  COUNT(DISTINCT(zip_code)) AS total_zip_code,
  COUNT(DISTINCT(store_location)) AS total_store_location,
  COUNT(DISTINCT(county_number)) AS total_county_number,
  COUNT(DISTINCT(county)) AS total_county
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
	total_store_name DESC, store_number;
