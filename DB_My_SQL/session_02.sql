-- SESSION 2: SQL Basics and DDL Commands
CREATE DATABASE IF NOT EXISTS dbsql_session_02;
USE dbsql_session_02;

CREATE TABLE restaurants (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  location VARCHAR(100) NOT NULL,
  rating DECIMAL(2,1)
);

ALTER TABLE restaurants ADD COLUMN average_cost INT;
DESCRIBE restaurants;

-- Practice DROP safely. Uncomment only after checking the table name.
-- DROP TABLE restaurants;

CREATE TABLE playlists (
  playlist_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  created_by VARCHAR(50) NOT NULL,
  created_at DATE NOT NULL
);

DESCRIBE playlists;
