-- Mandatory constrains: invoice_and_item_number is unique 
SELECT invoice_and_item_number
FROM iowa_drink_sales
WHERE invoice_and_item_number IS NULL;

-- Unique constraints : Each column is unique. It can be checked in data description and in postgresql
SELECT *
FROM iowa_drink_sales
LIMIT 100;
