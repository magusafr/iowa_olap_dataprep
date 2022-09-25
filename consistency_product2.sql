-- Consistency product 2
SELECT *
FROM iowa_drink_sales
WHERE item_number IN (SELECT item_number 
					 FROM (
						SELECT 
						  item_number,
						  COUNT(DISTINCT(item_description)) AS total_item_description,
						  COUNT(DISTINCT(category_name)) AS total_category_name,
						  COUNT(DISTINCT(category)) AS total_category_number
						FROM 
							iowa_drink_sales
						GROUP BY
							item_number
						HAVING 
							COUNT(DISTINCT(item_description)) > 1 OR
							COUNT(DISTINCT(category_name)) > 1 OR
							COUNT(DISTINCT(category)) > 1
						ORDER BY 
							total_item_description DESC, item_number;
						)A
			)
ORDER BY item_number;
