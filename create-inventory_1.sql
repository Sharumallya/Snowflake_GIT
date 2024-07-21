CREATE OR REPLACE TABLE my_inventory(
  sku VARCHAR,
  price NUMBER
);

EXECUTE IMMEDIATE FROM './insert-inventory_1.sql';

SELECT sku, price
  FROM my_inventory
  ORDER BY price DESC;