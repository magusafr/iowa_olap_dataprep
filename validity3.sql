--Regular expression patterns: all zip code consist of 5 digits
SELECT 
	LENGTH(zip_code) AS length_of_zip,
	COUNT(LENGTH(zip_code)) + SUM(CASE WHEN zip_code IS NULL THEN 1 ELSE 0 END) AS total
FROM iowa_drink_sales
GROUP BY length_of_zip
ORDER BY length_of_zip;
