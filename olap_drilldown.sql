-- From cities
SELECT zip_code,
       city,
       SUM(sale_dollars) total_sales
FROM iowa_drink_sales
GROUP BY zip_code, city
ORDER BY zip_code;

-- To zip_code
SELECT zip_code,
       SUM(sale_dollars) total_sales
FROM iowa_drink_sales
GROUP BY zip_code
ORDER BY zip_code;
