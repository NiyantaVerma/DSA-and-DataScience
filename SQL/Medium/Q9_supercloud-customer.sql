-- A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product from every product category listed in the products table.

-- Write a query that identifies the customer IDs of these Supercloud customers.

-- https://datalemur.com/questions/supercloud-customer

WITH product_cte AS (
  SELECT 
    c.customer_id,
    COUNT(DISTINCT p.product_category) AS product_count
  FROM customer_contracts c
  JOIN products p ON c.product_id = p.product_id
  GROUP BY c.customer_id
  )
  
SELECT 
  customer_id
FROM product_cte
WHERE product_count = (
                    SELECT COUNT(DISTINCT product_category)
                    FROM products
                    )