CREATE OR REPLACE TABLE SHARADA_DB.PUBLIC.my_inventory(
  sku VARCHAR,
  price NUMBER,
  comments VARCHAR
);

EXECUTE IMMEDIATE FROM './insert-inventory_1.sql';

SELECT sku, price, comments
  FROM SHARADA_DB.PUBLIC.my_inventory
  ORDER BY price DESC;