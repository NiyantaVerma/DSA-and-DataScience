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