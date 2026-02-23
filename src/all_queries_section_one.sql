/*
EXECUTE ORDER

STEP 1: FROM
STEP 2: WHERE
STEP 3: GROUP BY
STEP 4: HAVING
STEP 5: SELECT DISTINCT
STEP 6: ORDER BY
STEP 7: TOP

*/

-- When using multiple queries in the same window ... Use ";" to separate queries
SELECT *
FROM customers;

SELECT *
FROM orders;

USE MyDatabase -- Select Correct Database

-- Retrieve all data from customer table

SELECT *
FROM customers

-- Choose Database

USE MyDatabase

-- OPERATORS (COMPARISON & LOGICAL)

SELECT * FROM customers WHERE score <= 750
SELECT * FROM customers WHERE (country = 'UK' OR country = 'Germany') AND score <= 750

/* Retrieve all data from customers where score > 500 and country is USA 
*/
SELECT * FROM customers WHERE score > 500 AND country = 'USA'
/* Retrieve all data from customers where score > 500 or country is USA 
*/
SELECT * FROM customers WHERE score > 500 OR country = 'USA'

-- NOT operator
SELECT * FROM customers WHERE NOT score > 500

-- RANGE OPERATOR: BETWEEN (LOWER BOUNDARY, UPPER BOUNDARY)
SELECT * FROM customers WHERE score >= 800 AND score <= 1000
SELECT * FROM customers WHERE score BETWEEN 800 AND 1000
-- BETWEEN is like the comparison operators statement

-- MEMBERSHIP OPERATOR: IN // NOT IN
/* Retrieve all customers from Germany or USA */
SELECT * FROM customers WHERE country = 'Germany' OR country = 'USA'
SELECT * FROM customers WHERE country IN('Germany','USA')
SELECT * FROM customers WHERE country NOT IN('Germany','USA')
-- TIP: If the condition is same in WHERE clause and only value is changed, USE ~IN ~NOT IN operators instead of OR

-- SEARCH OPERATOR: LIKE
-- Search for a pattern in the text
-- Anything % // Exact Match -
/* Retrieve all countries that have the letter S in the middle */
SELECT * FROM customers WHERE country LIKE '%s%'
/* Find all customers that have the letter r as the third letter in first_name */
SELECT * FROM customers where first_name LIKE '__r%'

-- STATIC VALUES

-- SELECT 123 AS static_numb
-- SELECT 'HELLO' AS static_string

SELECT 
	id,
	first_name,
	'New Customer' AS customer_type
FROM customers

-- HIGHLIGHT & EXECUTE
-- TO RUN A PART OF THE QUERY, Just Highlight it and RUN
SELECT *
FROM customers
WHERE country = 'GERMANY'

-- HIGHLIGHT THE QUERY BELOW AND ONLY THE BELOW QUERY WILL RUN ( NOT THE ABOVE ONES)
SELECT * FROM orders

-- DATA MANIPULATION LANGUAGE
-- DML (DATA MANIPULATION LANGUAGE)
-- MANUAL ENTRIES (VALUES)

-- Order of columns must match values order

INSERT INTO customers(id,first_name,country,score)
VALUES (6,'Abdul','Australia',1000),
	(7,'Abdul','UK',800),
	(8,'Baraa',NULL,NULL)

SELECT * FROM customers

INSERT INTO customers (id, first_name)
VALUES (9,'Aal')

-- INSERT DATA from customers TABLE to persons

INSERT INTO persons(id,first_name,birthdate,phone)
SELECT 
	id,
	first_name,
	NULL,
	'UNKNOWN'
FROM customers

SELECT * FROM persons

-- UPDATE A ROW

UPDATE customers
SET	score = 900
-- // CAUTION //
WHERE id = 8 -- ALWAYS USE WHERE CONDITION TO AVOID UPDATING "ALL ROWS" 

UPDATE customers
SET country = 'UK',
	score = 0
-- CAUTION
WHERE id = 9

INSERT INTO customers (id,first_name)
VALUES (10,'BOB'),
		(11,'ALISON')

SELECT * FROM customers

/* UPDATE ALL ROWS WITH SCORES AS NULL To 0 */

UPDATE customers
SET score = 0
-- CAUTION
WHERE score IS NULL

SELECT * FROM customers WHERE score IS NULL

/* DELETE ALL ROWS WITH ID greater than 8 */
DELETE FROM customers
-- // CAUTION //
WHERE id > 8 -- WITHOUT WHERE CONDITION, ALL ROWS WILL BE DELETED

SELECT * FROM customers WHERE id > 8

/* DELETE ALL DATA FROM persons TABLE */

SELECT * FROM persons -- ALWAYS TEST BEFORE DELETING
DELETE FROM persons -- WITHOUT WHERE, ALL ROWS ARE DELETED

-- DDL (DATA DEFINITION LANGUAGE)

/* Create a new Table persons
with columns: id, name, birthdate, phone
*/

CREATE TABLE persons(
	id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	birthdate DATE,
	phone VARCHAR(50) NOT NULL,
	CONSTRAINT pk_persons PRIMARY KEY(id)
)

SELECT * FROM persons -- HIGHLIGHT & EXECUTE

/* Add an email column to the persons table */

ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL

-- Remove column phone from the persons table

ALTER TABLE persons
DROP COLUMN phone

-- DELETE the table person from the DATABASE
DROP TABLE persons

-- Select the top 2 most recent orders
SELECT TOP (2) *
FROM orders
ORDER BY order_date DESC

-- Return a unique list of countries
USE MyDatabase

SELECT DISTINCT
	country
FROM customers

/* TOP
Restricts the number of rows returned */

SELECT TOP (2) *
FROM customers

SELECT TOP (3) *
FROM customers
ORDER BY score DESC

/* HAVING
Filter data afte AGGREGATION
Can only be used after GROUP BY */

/* Find the average score for each country
considering only customers with score not equal to 0
and return only countries with an average score greater than 450 */

USE MyDatabase -- Choose the correct database

Select		-- EXECUTION STEP 5
	country,
	AVG(score) as avg_score
FROM customers -- EXECUTION STEP 1
WHERE score != 0 -- EXECUTION STEP 2
GROUP BY country -- EXECUTION STEP 3
HAVING AVG(score) > 450 -- EXECUTION STEP 4
ORDER BY avg_score DESC

-- Retrieve all the customers
-- Sort by country
-- Then Sort by score (highest)

SELECT *
FROM customers
ORDER BY
	country ASC,
	score DESC

/* GROUP BY
Combines rows with the same value
Aggregates columns by another column
I.E. Total scores by country */
SELECT
	country,
	SUM(score) as total_score
FROM customers
GROUP BY country
ORDER BY total_score DESC

-- Find the total score and total number of customers from each country
SELECT
	country,
	Count(id) as total_customers,
	SUM(score) as total_score
FROM customers
GROUP BY country
ORDER BY total_customers DESC, total_score DESC

-- Retrieve all customers data and sort by score from the highest
SELECT *
FROM customers
ORDER by Score DESC

-- Retrieve all customers data and sort by score from the lowest
SELECT *
FROM customers
ORDER BY Score ASC

-- Retrieve Customer Name, Country, Score Where Score is not equal to 0 and Country is Germany
SELECT 
	[first_name],
	[country],
	[score]
FROM customers
WHERE score != 0 AND country = 'Germany'

-- Retrieve all ORDERS data
SELECT *
FROM orders