INSERT INTO customers(
	customer_id,
	first_name,
	last_name,
	payment_info
)VALUES(
	1,
	'James',
	'Bond',
	'4242-4242-4242-4242 623 05/20'
);

INSERT INTO movies(
	movie_id,
	title,
	showtimes,
	rating
)VALUES(
	1,
	'License to Kill',
	'20:15:00',
	'R'
);

INSERT INTO concessions(
	item_id,
	item_name, 
	total_cost, 
	customer_id 
)VALUES(
	1,
	'Popcorn',
	4.99,
	1
);

INSERT INTO ticekts(
	ticket_id,
	movie_id,
	customer_id,
	total_cost
)VALUES(
	1,
	1,
	1,
	12.00
);