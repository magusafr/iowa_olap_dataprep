-- Range constraints: Month 1-12
SELECT DISTINCT(EXTRACT(MONTH FROM date)) month_number
FROM iowa_drink_sales
ORDER BY 1;

-- Range constraints: Date 1-31
SELECT DISTINCT(EXTRACT(DAY FROM date)) date_number
FROM iowa_drink_sales
ORDER BY 1;

-- Range constraints: all numerical columns > 0 except bottles_sold & sale_dollars
WITH check_range AS(SELECT 	invoice_and_item_number,
		pack,
		bottle_volume_ml,
		state_bottle_cost,
		state_bottle_retail,
		bottles_sold,
		sale_dollars,
		volume_sold_liters,
		volume_sold_gallons
FROM iowa_drink_sales
WHERE	pack <=0 OR
		bottle_volume_ml <=0 OR
		state_bottle_cost <=0 OR
		state_bottle_retail <=0 OR
		bottles_sold <=0 OR
		sale_dollars <=0 OR
		volume_sold_liters <0 OR
		volume_sold_gallons <0
ORDER BY bottles_sold)

SELECT  MIN(pack) pack,
		MIN(bottle_volume_ml) bottle_volume_ml,
		MIN(state_bottle_cost) state_bottle_cost,
		MIN(state_bottle_retail) state_bottle_retail,
		MIN(bottles_sold) bottles_sold,
		MIN(sale_dollars) sale_dollars,
		MIN(volume_sold_liters) volume_sold_liters,
		MIN(volume_sold_gallons)volume_sold_gallons
FROM check_range;
