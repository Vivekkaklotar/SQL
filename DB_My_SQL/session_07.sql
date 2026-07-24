-- SESSION 7: Constraints and Views
CREATE DATABASE IF NOT EXISTS dbsql_session_07;
USE dbsql_session_07;

CREATE TABLE Restaurant (id INT PRIMARY KEY, name VARCHAR(100) NOT NULL, location VARCHAR(100) NOT NULL, cuisine VARCHAR(60));
CREATE TABLE SpotifyUser (user_id INT PRIMARY KEY, username VARCHAR(80) UNIQUE, email VARCHAR(120) NOT NULL, subscription_type VARCHAR(30));
CREATE TABLE FoodOrder (
  order_id INT PRIMARY KEY, restaurant_id INT NOT NULL, user_id INT NOT NULL, order_total DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES Restaurant(id), FOREIGN KEY (user_id) REFERENCES SpotifyUser(user_id)
);
INSERT INTO Restaurant VALUES (1, 'Spice Villa', 'Ahmedabad', 'Indian');
INSERT INTO SpotifyUser VALUES (1, 'riya_music', 'riya@example.com', 'Premium');
INSERT INTO FoodOrder VALUES (1, 1, 1, 2500.00), (2, 1, 1, 800.00);

CREATE OR REPLACE VIEW TopSpendersView AS
SELECT u.username, o.order_total FROM SpotifyUser u JOIN FoodOrder o ON u.user_id = o.user_id WHERE o.order_total > 1000;
SELECT username, order_total FROM TopSpendersView WHERE order_total > 2000 ORDER BY order_total DESC;
