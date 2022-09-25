-- Slice from city
SELECT zip_code,
       city,
       SUM(sale_dollars) total_sales
FROM iowa_drink_sales
GROUP BY zip_code, city
ORDER BY city;

-- To specific zip code 50613
SELECT zip_code,
       city,
       county,
       SUM(sale_dollars) total_sales
FROM iowa_drink_sales
WHERE zip_code = '50613'
GROUP BY zip_code, city, county;
