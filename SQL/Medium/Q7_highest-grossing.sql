-- Assume you're given a table containing data on Amazon customers and their spending on products in different category, write a query to identify the top two highest-grossing products within each category in the year 2022. The output should include the category, product, and total spend.

-- https://datalemur.com/questions/sql-highest-grossing

WITH spend_cte AS (
  SELECT 
    category,
    product,
    SUM(spend) AS total_spend,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY SUM(spend) DESC)
  FROM product_spend
  WHERE transaction_date BETWEEN '01/01/2022 00:00:00' AND '12/31/2022 23:59:59'
  GROUP BY category, product
  ORDER BY category, total_spend
)

SELECT
  category,
  product,
  total_spend
FROM spend_cte
WHERE row_number <= 2
ORDER BY category,total_spend DESC