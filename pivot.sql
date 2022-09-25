-- Month vertical
SELECT EXTRACT(Year FROM date) yr,
       EXTRACT(Month FROM date) mt,
       ROUND(CAST(SUM(sale_dollars) AS NUMERIC),2) total_sales
FROM iowa_drink_sales
GROUP BY 1, 2
ORDER BY 1;

-- Month horizontal
-- Ref crosstab: https://www.postgresql.org/docs/current/tablefunc.html

-- Install crosstab tablefunc in psql tool
CREATE EXTENSION tablefunc;

SELECT * FROM crosstab(
  'SELECT EXTRACT(Year FROM date) tahun, EXTRACT(Month FROM date) bulan, ROUND(CAST(SUM(sale_dollars) AS NUMERIC),2) total_sales
			 FROM iowa_drink_sales GROUP BY 1,2 ORDER by 1',
  'SELECT m FROM generate_series(1,12) m'
) as (
  year int,
  "1" FLOAT,
  "2" FLOAT,
  "3" FLOAT,
  "4" FLOAT,
  "5" FLOAT,
  "6" FLOAT,
  "7" FLOAT,
  "8" FLOAT,
  "9" FLOAT,
  "10" FLOAT,
  "11" FLOAT,
  "12" FLOAT
);

