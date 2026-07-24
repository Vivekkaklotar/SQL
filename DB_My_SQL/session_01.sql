-- SESSION 1: Introduction to Databases
CREATE DATABASE IF NOT EXISTS dbsql_session_01;
USE dbsql_session_01;

CREATE TABLE IF NOT EXISTS Users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  followers_count INT NOT NULL DEFAULT 0
);

INSERT IGNORE INTO Users (user_id, username, email, followers_count) VALUES
(1, 'travelwithriya', 'riya@example.com', 1250),
(2, 'foodie_aarav', 'aarav@example.com', 3480),
(3, 'dailyart_maya', 'maya@example.com', 890);

CREATE TABLE IF NOT EXISTS Posts (
  post_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  caption VARCHAR(500),
  post_date DATE NOT NULL,
  CONSTRAINT fk_posts_user FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT IGNORE INTO Posts (post_id, user_id, caption, post_date) VALUES
(101, 1, 'Sunset at the beach', '2026-07-01'),
(102, 2, 'Trying a new pizza place', '2026-07-02');

SELECT * FROM Users;
SELECT * FROM Posts;
