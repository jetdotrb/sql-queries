# Retrieve customer information (all fields) where customer_id is 20.
SELECT * FROM customer WHERE customer_id = 20;

# Retrieve customer information (all fields) where customer_id is BETWEEN 20 and 60.
SELECT * FROM customer WHERE customer_id BETWEEN 20 and 60;

# Retrieve customer information (all fields) WHERE first_name starts with L.
SELECT * FROM customer WHERE first_name LIKE 'L%';

# Retrieve customer information (all fields) WHERE first_name includes L.
SELECT * FROM customer WHERE first_name LIKE '%L%';

# Retrieve customer information (all fields) WHERE first_name ends with L.
SELECT * FROM customer WHERE first_name LIKE '%L';

# Retrieve customer information (all fields) WHERE last_name starts with C and have the results be shown,
# starting with the record where it was created most recently.
SELECT * FROM customer WHERE last_name LIKE 'C%' ORDER BY create_date DESC;

# Retrieve customer information (all fields) WHERE last_name includes NN. Only have it retrieve the top 5
# records, where the first record shown is the oldest customer (in terms of the create_date).
SELECT * FROM customer WHERE last_name LIKE '%NN%' ORDER BY create_date ASC LIMIT 5;

# Retrieve customer information (customer_id, first_name, last_name, and email address only) for customers with
# the following customer_id 515, 181, 582, 503, 29, 85.
SELECT customer_id, first_name, last_name, email FROM customer WHERE customer_id IN (515, 181, 582, 503, 29, 85);

# Retrieve customer information where store_id is 2. Now when displaying the columns, instead of the column
# name be 'email', have it appear as 'email_address'.
SELECT first_name, last_name, email AS email_address, store_id FROM customer WHERE store_id = 2;

# Retrieve customer information (only the first_name, last_name, and email) but order the result with the email
# address in the DESC order.
SELECT first_name, last_name, email AS email_address FROM customer ORDER BY email_address DESC;

# Retrieve only 'active' customer information (only the customer_id, first_name, last_name, and email) and where
# their record was created in the month of February.
SELECT customer_id, first_name, last_name, email FROM customer WHERE active != 0;

