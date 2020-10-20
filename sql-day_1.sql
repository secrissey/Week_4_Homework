-- Hello World SQL Query, SELECT all records from actor table
SELECT *
FROM actor;

-- Query for first_name and last_name in the actor table
SELECT first_name, last_name
FROM actor;

-- Query for a first_name that equals Nick using the WHERE clause
SELECT first_name, last_name 
FROM actor
WHERE first_name = 'Nick';

-- Query for a first_name that is equal to Nick using the LIKE and WHERE clauses
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_name data that starts with J using the LIKE an WHERE clauses
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that starts with K and has 2 letters after the K using LIKE and WHERE clauses -- using underscore
SELECT first_name,actor_id
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_name data that starts with a K and ends with TH
-- using the LIKE and WHERE clauses -- using both wildcard and underscore
SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name LIKE 'K__%th';

-- Comparing operators are:
-- Greater Than (>) -- Less than (<)
-- Greater or Equal (>=) -- Less or Equal (<=)
-- Not Equal (<>)

-- Explore Data with SELECT ALL Query (Specific to changing into new table)
SELECT *
FROM payment;

-- Query for data that show customers who paid
-- an amount GREATER than $2
SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

-- Query for data that shows customers who paid
-- an amount LESS than $7.99
SELECT customer_id,amount
FROM payment
WHERE amount < 7.99;

--Query for data that shows customers who paid
-- an amount LESS than or EQUAl to $7.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

--Query for data that shows customers who paid 
-- an amount Greater than or EQUAL to $2.00
-- in Ascending order
SELECT customer_id,amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

-- Query for data that shows customers who paid 
-- an amount BETWEEN $2.00 and $7.99
-- Using the BETWEEN with the AND Clause
SELECT customer_id,amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query for data that shows customers who paid
-- an amount NOT EQUAL to $0.00
-- Ordered in DESCENDING Order
SELECT customer_id, amount
FROM payment
WHERE amount  <> 0.00
ORDER BY amount DESC;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- Query to display sum of amounts payed that are greater than $5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display average of amounts payed that are greater than $5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of amounts payed that are greater than $5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the count of DISTINCT amounts payed that are greater than $5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the min amount greater than 7.99
SELECT MIN(amount) AS Min_Num_Payments
FROM payment
WHERE amount > 7.99;

-- Query to display the max amount greater than 7.99
SELECT MAX(amount) AS Max_Num_Payments
FROM payment
WHERE amount > 7.99;

-- Query to display all amounts (quick demo of groupby)
SELECT amount
FROM payment
WHERE amount = 7.99;

-- Query to display differnt amounts grouped together 
-- and count the amounts 
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- Query to display customer_ids with the summed amounts for each customer_id
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

-- Query to display customer_ids with the summed amounts for each customer_id
SELECT customer_id, amount
FROM payment
GROUP BY amount,customer_id
ORDER BY customer_id DESC;

-- Query to explore the data inside of the customer table
SELECT *
FROM customer;

-- Query to display customer_ids that show up more than 5 times
-- Grouping by the customer's email
SELECT COUNT(customer_id),email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;


-- HOMEWORK Monday 10/19 --
-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT Count(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg'
GROUP BY last_name;

-- 2. How many payments were made between $3.99 and $5.99?
SELECT Count(payment)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id 
ORDER BY film_id DESC;

--4. How many customers have the last name ‘William’?
SELECT Count(last_name)
FROM customer
WHERE last_name LIKE 'William';

--5. # What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id;


--6. How many different district names are there?
SELECT COUNT(district)
FROM address
GROUP BY district
ORDER BY COUNT(district) DESC;

--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(film_actor)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT DESC;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name),customer
From customer
WHERE last_name LIKE '%es'
GROUP BY customer;

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT *
FROM payment;

SELECT(amount), COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT DESC;


