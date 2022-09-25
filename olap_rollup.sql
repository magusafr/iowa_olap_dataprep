-- From cities
SELECT city, 
       county,
       SUM(sale_dollars) total_sales
FROM iowa_drink_sales
GROUP BY city, county
ORDER BY city;

-- To Counties
SELECT county,
       SUM(total_sales)
FROM (
      SELECT city, county, SUM(sale_dollars) total_sales
      FROM iowa_drink_sales
      GROUP BY city, county
	  ORDER BY city 
     ) city_table
GROUP BY county;
