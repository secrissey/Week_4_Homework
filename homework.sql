--- HomeWork 10/21
--1. List all customers who live in Texas (use JOINs)
SELECT first_name,last_name,district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT customer.customer_id,first_name,last_name,amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE(amount) > 6.99
ORDER BY(amount) ASC;

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name,last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

--4. List all customers that live in Nepal (use the city table) use multi join
SELECT first_name,last_name,country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id 
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--5. Which staff member had the most transactions?
SELECT staff_id, COUNT(staff_id)
FROM payment
GROUP BY staff_id;

--6. How many movies of each rating are there?
SELECT film_id,rating
FROM film
GROUP BY film_id
ORDER BY rating DESC;

--- OR --
SELECT film_id, rating
FROM film
WHERE film_id IN(
	SELECT film_id
	FROM film
	GROUP BY film_id
	ORDER BY rating DESC
)
GROUP BY film_id, rating;


--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	ORDER BY amount ASC
);

--8.How many free rentals did our store give away??
SELECT COUNT(customer.customer_id)
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount = 0;