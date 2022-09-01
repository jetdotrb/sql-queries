# USE sakila;

# 1. Get all the list of customers.
SELECT * FROM customer;

# 2. Get all the list of customers as well as their address.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, a.address
FROM customer AS c
LEFT JOIN address AS a ON
a.address_id = c.address_id;

# 3. Get all the list of customers as well as their address and the city name.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, a.address, ci.city
FROM customer AS c
LEFT JOIN address AS a
ON a.address_id = c.address_id
LEFT JOIN city AS ci
ON ci.city_id = a.city_id;

# 4. Get all the list of customers as well as their address, city name, and the country.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, a.address, ci.city, co.country
FROM customer AS c
LEFT JOIN address AS a
ON a.address_id = c.address_id
LEFT JOIN city AS ci
ON ci.city_id = a.city_id
LEFT JOIN country AS co
ON co.country_id = ci.country_id
ORDER BY co.country;

# 5. Get all the list of customers who live in Bolivia.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, a.address, ci.city, co.country
FROM customer AS c
LEFT JOIN address AS a
ON a.address_id = c.address_id
LEFT JOIN city AS ci
ON ci.city_id = a.city_id
LEFT JOIN country AS co
ON co.country_id = ci.country_id
WHERE co.country = 'Bolivia'
ORDER BY co.country;

# 6. Get all the list of customers who live in Bolivia, Germany and Greece.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, a.address, ci.city, co.country
FROM customer AS c
LEFT JOIN address AS a
ON a.address_id = c.address_id
LEFT JOIN city AS ci
ON ci.city_id = a.city_id
LEFT JOIN country AS co
ON co.country_id = ci.country_id
WHERE co.country IN ('Bolivia', 'Germany', 'Greece')
ORDER BY co.country;

# 7. Get all the list of customers who live in the city of Baku.  
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, a.address, ci.city, co.country
FROM customer AS c
LEFT JOIN address AS a
ON a.address_id = c.address_id
LEFT JOIN city AS ci
ON ci.city_id = a.city_id
LEFT JOIN country AS co
ON co.country_id = ci.country_id
WHERE ci.city = 'Baku'
ORDER BY ci.city;

# 8. Get all the list of customers who live in the city of Baku, Beira, and Bergamo.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, a.address, ci.city, co.country
FROM customer AS c
LEFT JOIN address AS a
ON a.address_id = c.address_id
LEFT JOIN city AS ci
ON ci.city_id = a.city_id
LEFT JOIN country AS co
ON co.country_id = ci.country_id
WHERE ci.city IN ('Baku', 'Beira', 'Bergamo')
ORDER BY ci.city;

# 9. Get all the list of customers who live in a country where the country name's length is
# less than 5. Show the customer with the longest full name first. 
# (Hint: Look into how you can concatenate a string in SQL).
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, co.country, LENGTH(co.country) AS country_name_length
FROM customer AS c
LEFT JOIN address AS a
ON a.address_id = c.address_id
LEFT JOIN city AS ci
ON ci.city_id = a.city_id
LEFT JOIN country AS co
ON co.country_id = ci.country_id
WHERE LENGTH(co.country) < 5
ORDER BY LENGTH(customer_name) DESC;

# 10. Get all the list of customers who live in a city name whose length is more than 10. 
# Order the result so that the customers who live in the same country are shown together.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, co.country, ci.city, LENGTH(ci.city) AS city_name_length
FROM customer AS c
LEFT JOIN address AS a
ON a.address_id = c.address_id
LEFT JOIN city AS ci
ON ci.city_id = a.city_id
LEFT JOIN country AS co
ON co.country_id = ci.country_id
WHERE LENGTH(ci.city) > 10
ORDER BY co.country;

# 11. Get all the list of customers who live in a city where the city name includes the word 'ba'. 
# For example Arratuba or Baiyin should show up in your result.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, ci.city
FROM customer AS c
LEFT JOIN address AS a
ON a.address_id = c.address_id
LEFT JOIN city AS ci
ON ci.city_id = a.city_id
WHERE ci.city LIKE '%ba%'
ORDER BY ci.city;

# 12. Get all the list of customers where the city name includes a space. 
# Order the result so that customers who live in the longest city are shown first.
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, ci.city, LENGTH(ci.city) AS city_name_length
FROM customer AS c
LEFT JOIN address AS a
ON a.address_id = c.address_id
LEFT JOIN city AS ci
ON ci.city_id = a.city_id
WHERE ci.city LIKE '% %'
ORDER BY city_name_length DESC;

# 13. Get all the customers where the country name is longer than the city name.  
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, ci.city, co.country, LENGTH(ci.city) AS city_name_length, LENGTH(co.country) AS country_name_length
FROM customer AS c
LEFT JOIN address AS a
ON a.address_id = c.address_id
LEFT JOIN city AS ci
ON ci.city_id = a.city_id
LEFT JOIN country AS co
ON co.country_id = ci.country_id
WHERE LENGTH(co.country) > LENGTH(ci.city);
