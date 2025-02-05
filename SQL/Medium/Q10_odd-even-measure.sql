-- Assume you're given a table with measurement values obtained from a Google sensor over multiple days with measurements taken multiple times within each day.

-- Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and display the results in two different columns. Refer to the Example Output below for the desired format.

-- Definition:

-- Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements, and measurements taken at 2nd, 4th, and 6th times are considered even-numbered measurements.

-- https://datalemur.com/questions/odd-even-measurements

WITH cte AS(
  SELECT
    ROW_NUMBER() OVER (PARTITION BY measurement_time::DATE ORDER BY measurement_time),
    measurement_id,
    measurement_value,
    measurement_time
  FROM measurements
  ORDER BY measurement_time
  )
  
SELECT 
  measurement_time::DATE AS measurement_day,
  SUM(CASE WHEN row_number%2=1 THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM(CASE WHEN row_number%2=0 THEN measurement_value ELSE 0 END) AS even_sum
FROM cte
GROUP BY measurement_time::DATE
ORDER BY measurement_day