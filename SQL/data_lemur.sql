--This file contains the specific data science questions from datalemur.com


-- Q1
-- Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
-- In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.
-- CTEs

WITH total_tweets AS (
  SELECT 
    user_id,
    COUNT(tweet_id) AS tweet_count_per_user
  FROM tweets
  WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
  GROUP BY user_id
  )
  
SELECT 
  tweet_count_per_user AS tweet_bucket,
  COUNT(user_id) AS users_num
FROM total_tweets
GROUP BY tweet_count_per_user


-- Q2
-- Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
-- Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

WITH candidate_id_count AS (
  SELECT 
    candidate_id, 
    COUNT(*) AS candidate_id_count
  FROM candidates
  WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
  GROUP BY candidate_id
  )
  
SELECT candidate_id
FROM candidate_id_count
WHERE candidate_id_count = 3;


--Q3
-- Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").
-- Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

SELECT p.page_id
FROM pages p 
LEFT JOIN page_likes pl
ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL


--Q4
-- Tesla is investigating production bottlenecks and they need your help to extract the relevant data. Write a query to determine which parts have begun the assembly process but are not yet finished.

SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL


--Q5
-- Assume you're given the table on user viewership categorised by device type where the three types are laptop, tablet, and phone.
-- Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership. Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.

SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('phone','tablet') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership

--Q6
-- Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. Output the user and number of the days between each user's first and last post.
SELECT 
  MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between,
  user_id
FROM posts
WHERE post_date BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY user_id
HAVING COUNT(post_id)>1


--Q7
-- Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.
SELECT 
  sender_id,
  COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = '8'
  AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2


--Q8
--Assume you're given a table containing job postings from various companies on the LinkedIn platform. Write a query to retrieve the count of companies that have posted duplicate job listings.
-- Definition:
-- Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.
WITH Cte AS (
  SELECT 
    company_id,
    title,
    description,
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id,title,description
)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM Cte
WHERE job_count > 1


--Q9
--Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.
-- Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. Output the city name and the corresponding number of completed trade orders.

SELECT 
  u.city,
  COUNT(DISTINCT t.order_id) AS total_orders
FROM trades t
JOIN users u
ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3


--Q10
-- Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. Sort the output first by month and then by product ID.
SELECT 
  EXTRACT(MONTH FROM submit_date) AS mth,
  product_id AS product,
  ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY product_id,mth
ORDER BY mth,product


--Q11
-- Companies often perform salary analyses to ensure fair compensation practices. One useful analysis is to check if there are any employees earning more than their direct managers.
-- As a HR Analyst, you're asked to identify all employees who earn more than their direct managers. The result should include the employee's ID and name.

SELECT e.employee_id,
  e.name
FROM employee m
INNER JOIN employee e
ON m.employee_id = e.manager_id
WHERE e.salary > m.salary


--Q12
-- Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

-- Definition and note:

-- Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
-- To avoid integer division, multiply the CTR by 100.0, not 100.

SELECT 
  app_id,
  ROUND(100.0 * 
  SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
  SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END),2)
FROM events
WHERE EXTRACT(YEAR FROM timestamp)='2022'
GROUP BY app_id


--In your post, don’t forget to tag Nick Singh, so that he can comment on and share your post with his audience of 150k+ followers on LinkedIn and 25k+ followers on Twitter (which will give your post and profile more visibility)!
SELECT 
  DISTINCT e.user_id
FROM emails e
JOIN texts t
ON e.email_id=t.email_id
WHERE t.signup_action = 'Confirmed'
AND (t.action_date::DATE-e.signup_date::DATE) = 1


--IBM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during the third quarter of 2023 (July to September). Additionally, it should count the number of employees who did not run any queries during this period.
-- Display the number of unique queries as histogram categories, along with the count of employees who executed that number of unique queries.

WITH employee_queries AS (
  SELECT 
    e.employee_id,
    COALESCE(COUNT(DISTINCT q.query_id), 0) AS unique_queries
  FROM employees AS e
  LEFT JOIN queries AS q
    ON e.employee_id = q.employee_id
      AND q.query_starttime >= '2023-07-01T00:00:00Z'
      AND q.query_starttime < '2023-10-01T00:00:00Z'
  GROUP BY e.employee_id
)

SELECT
  unique_queries,
  COUNT(employee_id) AS employee_count
FROM employee_queries
GROUP BY unique_queries
ORDER BY unique_queries;


-- Your team at JPMorgan Chase is preparing to launch a new credit card, and to gain some insights, you're analyzing how many credit cards were issued each month.
-- Write a query that outputs the name of each credit card and the difference in the number of issued cards between the month with the highest issuance cards and the lowest issuance. Arrange the results based on the largest disparity.

SELECT 
  DISTINCT(card_name),
  MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name


-- In your post, don’t forget to tag Nick Singh, so that he can comment on and share your post with his audience of 150k+ followers on LinkedIn and 25k+ followers on Twitter (which will give your post and profile more visibility)!
SELECT 
  ROUND(SUM(item_count::DECIMAL*order_occurrences)/Sum(order_occurrences),1) AS mean
FROM items_per_order


-- CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.
-- Write a query to find the top 3 most profitable drugs sold, and how much profit they made. Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.
-- cogs stands for Cost of Goods Sold which is the direct cost associated with producing the drug.
-- Total Profit = Total Sales - Cost of Goods Sold

SELECT 
  drug,
  total_sales-cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3


-- CVS Health is analyzing its pharmacy sales data, and how well different products are selling in the market. Each drug is exclusively manufactured by a single manufacturer.
-- Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health and calculate the total amount of losses incurred.
-- Output the manufacturer's name, the number of drugs associated with losses, and the total losses in absolute value. Display the results sorted in descending order with the highest losses displayed at the top.

SELECT 
  manufacturer,
  COUNT(drug) AS drug_count,
  ABS(SUM(total_sales-cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales-cogs <= 0
GROUP BY manufacturer
ORDER BY total_loss DESC


-- CVS Health wants to gain a clearer understanding of its pharmacy sales and the performance of various products.
-- Write a query to calculate the total drug sales for each manufacturer. Round the answer to the nearest million and report your results in descending order of total sales. In case of any duplicates, sort them alphabetically by the manufacturer name.
-- Since this data will be displayed on a dashboard viewed by business stakeholders, please format your results as follows: "$36 million".

SELECT 
  manufacturer,
  CONCAT('$',ROUND(SUM(total_sales)/1000000),' million') AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC,manufacturer


-- UnitedHealth Group (UHG) has a program called Advocate4Me, which allows policy holders (or, members) to call an advocate and receive support for their health care needs – whether that's claims and benefits support, drug coverage, pre- and post-authorisation, medical records, emergency assistance, or member portal services.
-- Write a query to find how many UHG policy holders made three, or more calls, assuming each call is identified by the case_id column.

WITH case_count AS (
SELECT 
  COUNT(case_id) AS case_id_count
FROM callers
GROUP BY policy_holder_id
)

SELECT COUNT(case_id_count) AS policy_holder_count
FROM case_count
WHERE case_id_count >=3