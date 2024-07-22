CREATE OR REPLACE TABLE my_inventory(
  sku VARCHAR,
  price NUMBER,
  comments VARCHAR
);

EXECUTE IMMEDIATE FROM './insert-inventory_1.sql';

SELECT sku, price, comments
  FROM my_inventory
  ORDER BY price DESC;