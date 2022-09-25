-- Consistency vendor 1
SELECT 
  vendor_number,
  COUNT(DISTINCT(vendor_name)) AS total_vendor_name
FROM 
	iowa_drink_sales
GROUP BY
	vendor_number
HAVING 
	COUNT(DISTINCT(vendor_name)) > 1 
ORDER BY 
	total_vendor_name DESC, vendor_number;
