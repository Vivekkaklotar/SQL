-- SESSION 3: DML Operations
CREATE DATABASE IF NOT EXISTS dbsql_session_03;
USE dbsql_session_03;

CREATE TABLE IF NOT EXISTS Restaurants (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100), cuisine VARCHAR(50), rating DECIMAL(2,1), city VARCHAR(80)
);

INSERT IGNORE INTO Restaurants (id, name, cuisine, rating, city) VALUES
(1, 'Spice Villa', 'Indian', 4.3, 'Ahmedabad'),
(2, 'Dragon Bowl', 'Chinese', 4.5, 'Ahmedabad'),
(3, 'Pizza Point', 'Italian', 3.2, 'Surat'),
(4, 'Taco Town', 'Mexican', 4.1, 'Ahmedabad'),
(5, 'Sushi House', 'Japanese', 4.7, 'Mumbai');

UPDATE Restaurants SET rating = 4.7 WHERE name = 'Spice Villa';
DELETE FROM Restaurants WHERE rating < 3.5;

SELECT * FROM Restaurants
WHERE city = 'Ahmedabad' AND rating > 4.0
ORDER BY rating DESC LIMIT 2;
