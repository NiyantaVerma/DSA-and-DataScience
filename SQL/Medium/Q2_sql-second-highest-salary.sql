-- Imagine you're an HR analyst at a tech company tasked with analyzing employee salaries. Your manager is keen on understanding the pay distribution and asks you to determine the second highest salary among all employees.

-- It's possible that multiple employees may share the same second highest salary. In case of duplicate, display the salary only once.
-- https://datalemur.com/questions/sql-second-highest-salary
WITH cte AS (
  SELECT
    salary,  
    ROW_NUMBER() OVER(ORDER BY salary DESC) as row_no
    FROM employee
  )

SELECT salary
FROM cte
WHERE row_no = 2