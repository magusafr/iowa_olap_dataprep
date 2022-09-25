-- Data preparation clean data zip code
SELECT store_number,
       COUNT(DISTINCT(store_name)) AS total_store__name,
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
       COUNT(DISTINCT(zip_code)) > 1
ORDER BY 
       total_store_name DESC, store_number;
