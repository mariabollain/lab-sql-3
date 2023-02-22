# Lab | SQL Queries 3

use sakila;

# How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name)
FROM actor;

# In how many different languages where the films originally produced? (Use the column language_id from the film table)

SELECT COUNT(DISTINCT language_id)
FROM film;


# How many movies were released with "PG-13" rating?
SELECT COUNT(rating)
FROM film
WHERE rating = "PG-13";

# Get 10 the longest movies from 2006.
SELECT * FROM film
WHERE release_year = "2006"
ORDER BY length DESC
LIMIT 10;

# How many days has been the company operating (check DATEDIFF() function)?

select  DATEDIFF(MAX(rental_date), MIN(rental_date))
FROM rental;

# Show rental info with additional columns month and weekday. Get 20.
SELECT *, DATE_FORMAT(substring(rental_date, 1,10), "%M") as rental_date_month, DATE_FORMAT(substring(rental_date, 1, 10), "%W") as rental_date_weekday
FROM rental LIMIT 20;

# Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT  *, 
CASE
	WHEN (DAYNAME(rental_date) = "Saturday" OR DAYNAME(rental_date) = "Sunday" ) THEN "weekend"
	ELSE "workday"
    END as day_type
from rental
LIMIT 20;

# How many rentals were in the last month of activity?

SELECT MAX(rental_date) FROM rental;
#the last month of activity is february of 2006

SELECT COUNT(rental_id) 
from rental
WHERE rental_date LIKE "2006-02%" ;

