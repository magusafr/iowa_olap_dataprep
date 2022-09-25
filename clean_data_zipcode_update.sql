-- fiter zip code 5116
SELECT *
FROM iowa_drink_sales
WHERE store_number = '5116'
ORDER BY zip_code;

-- update zip code store 5116 from 50702 to 50208
--UPDATE iowa_drink_sales 
--SET zip_code = '50208'
--WHERE store_name = '5116' AND zip_code = '50702';
