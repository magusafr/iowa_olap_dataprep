-- Consistency vendor 2  
SELECT *
FROM iowa_drink_sales
WHERE vendor_number IN (SELECT vendor_number 
					 FROM (
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
                    total_vendor_name DESC, vendor_number
						)A
			)
ORDER BY vendor_number;
