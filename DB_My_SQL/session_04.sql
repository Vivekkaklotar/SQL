-- SESSION 4: Data Retrieval with SELECT
CREATE DATABASE IF NOT EXISTS dbsql_session_04;
USE dbsql_session_04;

CREATE TABLE IF NOT EXISTS Playlist (
  id INT PRIMARY KEY, song_name VARCHAR(100), artist VARCHAR(100), genre VARCHAR(50), play_count INT
);
INSERT IGNORE INTO Playlist VALUES
(1, 'Blinding Lights', 'The Weeknd', 'Pop', 250),
(2, 'Levitating', 'Dua Lipa', 'Pop', 180),
(3, 'Gods Plan', 'Drake', 'Hip-Hop', 320),
(4, 'Lose Yourself', 'Eminem', 'Hip-Hop', 400),
(5, 'Perfect', 'Ed Sheeran', 'Pop', 95);

SELECT song_name, artist AS Singer FROM Playlist;
SELECT * FROM Playlist WHERE genre = 'Pop' AND play_count > 100 ORDER BY play_count DESC;
SELECT COUNT(*) AS hip_hop_song_count FROM Playlist WHERE genre = 'Hip-Hop';
SELECT genre, SUM(play_count) AS total_plays FROM Playlist GROUP BY genre;
