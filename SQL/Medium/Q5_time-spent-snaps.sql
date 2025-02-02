-- Assume you're given tables with information on Snapchat users, including their ages and time spent sending and opening snaps.

-- Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these activities grouped by age group. Round the percentage to 2 decimal places in the output.

-- Notes:

-- Calculate the following percentages:
-- time spent sending / (Time spent sending + Time spent opening)
-- Time spent opening / (Time spent sending + Time spent opening)
-- To avoid integer division in percentages, multiply by 100.0 and not 100.

-- https://datalemur.com/questions/time-spent-snaps

WITH cte AS (
  SELECT
    ab.age_bucket,
    SUM(CASE WHEN a.activity_type = 'send'
        THEN a.time_spent ELSE 0 END) AS send_time,
    SUM(CASE WHEN a.activity_type = 'open'
        THEN a.time_spent ELSE 0 END) AS open_time,
    SUM(a.time_spent) AS total_time
  FROM activities a
  JOIN age_breakdown ab
  ON a.user_id = ab.user_id
  WHERE a.activity_type IN ('open','send')
  GROUP BY ab.age_bucket
  )
  
SELECT 
  age_bucket,
  ROUND(100.0 * send_time / total_time, 2) AS send_perc,
  ROUND(100.0 * open_time / total_time, 2) AS open_perc
FROM cte
