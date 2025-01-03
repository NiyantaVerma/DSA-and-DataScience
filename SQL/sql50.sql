-- Q1
-- Write a solution to find the ids of products that are both low fat and recyclable.
-- Return the result table in any order.

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y'

-- Q2
-- Find the names of the customer that are not referred by the customer with id = 2.
-- Return the result table in any order.

SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL

--Q3
-- Write a solution to find the name, population, and area of the big countries.
-- Return the result table in any order.

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000

--Q4
-- Write a solution to find all the authors that viewed at least one of their own articles.
-- Return the result table sorted by id in ascending order.

SELECT DISTINCT(author_id) AS id
FROM Views
WHERE author_id=viewer_id
ORDER BY id