-- SESSION 10: Mini Project - Playlist Tracker DB
CREATE DATABASE IF NOT EXISTS dbsql_session_10;
USE dbsql_session_10;

CREATE TABLE Users (user_id INT PRIMARY KEY, username VARCHAR(80) NOT NULL);
CREATE TABLE playlists (
  playlist_id INT PRIMARY KEY AUTO_INCREMENT, user_id INT NOT NULL, name VARCHAR(100) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
INSERT INTO Users VALUES (1, 'Riya'), (2, 'Aarav');
INSERT INTO playlists (user_id, name, created_at) VALUES
(1, 'Workout Mix', '2026-07-01 08:00:00'),
(1, 'Chill Vibes', '2026-07-05 19:30:00'),
(2, 'Top Hits', '2026-07-10 12:15:00');

UPDATE playlists SET name = 'Evening Chill' WHERE user_id = 1 AND name = 'Chill Vibes';
DELETE FROM playlists WHERE user_id = 1 AND name = 'Workout Mix';

DELIMITER //
CREATE PROCEDURE GetMonthlyPlaylistCount(IN p_user_id INT, IN p_month INT)
BEGIN
  SELECT COUNT(*) AS playlist_count FROM playlists
  WHERE user_id = p_user_id AND MONTH(created_at) = p_month;
END//
DELIMITER ;
CALL GetMonthlyPlaylistCount(1, 7);
