# CREATE DATABASE hackerhero_practice;
# USE hackerhero_practice;

# What's the query for creating this new database table with fields above?
CREATE TABLE users (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
email VARCHAR(255),
encrypted_password VARCHAR(255),
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME
);

# What's the query for inserting new records into this table? Write queries
# for inserting fake user into the table (one query for each insert).
INSERT INTO users (first_name, last_name, email, encrypted_password)
VALUES ('Winston', 'Smith', 'winston@hh.com', md5('pass123'));

INSERT INTO users (first_name, last_name, email, encrypted_password)
VALUES ('Sigmund', 'Freud', 'sigmund@hh.com', md5('pass231'));

INSERT INTO users (first_name, last_name, email, encrypted_password)
VALUES ('Charles', 'Bukowski', 'charles@hh.com', md5('pass312'));

# What's the query for updating one of the user records? For example, if you wanted to 
# update the user record for id = 1, with some fake data, what would the query be?
UPDATE users SET first_name = 'Michael', last_name = 'Choi', email = 'michael@hh.com', updated_at = CURRENT_TIMESTAMP WHERE id = 1;

# What query would you run for updating all of the user records with the last_name of 'Choi'
UPDATE users SET last_name = 'Choi', updated_at = CURRENT_TIMESTAMP;
# Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

# What query would you run for updating all the user records where ID is 3, 5, 7, 12, or 19?
UPDATE users SET last_name = 'Chai', updated_at = CURRENT_TIMESTAMP WHERE id IN (3, 5, 7, 12, 19);

# What's the query for deleting the entire users records in the users table?
DELETE FROM users;

# What's the query for dropping the entire users records in the users table? What's the difference
# between dropping the table and deleting all records?
DROP TABLE users;
# Deleting a table will only delete all the records from the table
# while dropping a table will remove the table from the database and all records will also be gone.

# What's the query for altering the email field to have it be 'email_address' instead?
# ALTER TABLE users RENAME COLUMN email TO email_address;
ALTER TABLE users CHANGE COLUMN `email` email_address VARCHAR(255);

# What's the query for altering the id so that it's a BIGINT instead?
ALTER TABLE users CHANGE COLUMN `id` `id` BIGINT NOT NULL AUTO_INCREMENT;

# What's the query for adding a new field to the users table called is_active where it's a Boolean
# (meaning it's either a 0 or a 1). Imagine you wanted the default value of this to be 0 qhen a new record
# is created and you won't allow this field to ever be NULL. With this in mind, now come up with a query.
ALTER TABLE users ADD COLUMN is_active TINYINT(1) NOT NULL DEFAULT 0;


