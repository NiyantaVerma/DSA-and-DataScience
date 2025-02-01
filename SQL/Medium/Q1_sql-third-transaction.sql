-- Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.
-- https://datalemur.com/questions/sql-third-transaction

WITH cte AS (
  SELECT 
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS row_no,
    user_id,
    spend,
    transaction_date
  FROM transactions
  )
  
SELECT 
  user_id,
  spend,
  transaction_date
FROM cte
WHERE row_no = 3