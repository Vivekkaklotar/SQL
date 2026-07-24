-- SESSION 6: Grouping and Subqueries
CREATE DATABASE IF NOT EXISTS dbsql_session_06;
USE dbsql_session_06;

CREATE TABLE orders (order_id INT PRIMARY KEY, user_id INT, amount DECIMAL(10,2));
CREATE TABLE restaurants (id INT PRIMARY KEY, name VARCHAR(100), rating DECIMAL(2,1));
CREATE TABLE payments (payment_id INT PRIMARY KEY, user_id INT, amount DECIMAL(10,2));
CREATE TABLE movies (movie_id INT PRIMARY KEY, name VARCHAR(100), rating DECIMAL(2,1));

INSERT INTO orders VALUES (1, 1, 400), (2, 1, 600), (3, 2, 900);
INSERT INTO restaurants VALUES (1, 'Spice Villa', 4.5), (2, 'Pizza Point', 3.8), (3, 'Dragon Bowl', 4.4);
INSERT INTO payments VALUES (1, 1, 2500), (2, 2, 1500), (3, 3, 3000);
INSERT INTO movies VALUES (1, 'Film A', 4.6), (2, 'Film B', 3.8), (3, 'Film C', 4.2);

SELECT user_id, COUNT(*) AS order_count FROM orders GROUP BY user_id;
SELECT name, AVG(rating) AS average_rating FROM restaurants GROUP BY name HAVING AVG(rating) > 4.0;
SELECT user_id FROM payments WHERE user_id IN (SELECT user_id FROM payments WHERE amount > 2000);
SELECT name, AVG(rating) AS movie_average FROM movies GROUP BY name HAVING AVG(rating) > (SELECT AVG(rating) FROM movies);
