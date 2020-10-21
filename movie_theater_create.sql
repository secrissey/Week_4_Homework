CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	payment_info VARCHAR(150)
);

CREATE TABLE movies(
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR(100),
	showtimes TIME,
	rating VARCHAR(15)
);

CREATE TABLE concessions(
	item_id SERIAL PRIMARY KEY,
	item_name VARCHAR(100),
	total_cost NUMERIC(5,2),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE ticekts(
	ticket_id SERIAL PRIMARY KEY,
	movie_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	total_cost NUMERIC(5,2),
	FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
