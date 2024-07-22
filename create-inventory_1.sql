CREATE OR REPLACE TABLE my_inventory(
  sku VARCHAR,
  price NUMBER,
  comments varchar
);

EXECUTE IMMEDIATE FROM './insert-inventory_1.sql';

SELECT sku, price, varchar
  FROM my_inventory
  ORDER BY price DESC;