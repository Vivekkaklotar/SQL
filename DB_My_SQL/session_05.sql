-- SESSION 5: Joins and Relationships
CREATE DATABASE IF NOT EXISTS dbsql_session_05;
USE dbsql_session_05;

CREATE TABLE influencers (influencer_id INT PRIMARY KEY, name VARCHAR(100));
CREATE TABLE posts (
  post_id INT PRIMARY KEY, influencer_id INT, caption VARCHAR(255),
  FOREIGN KEY (influencer_id) REFERENCES influencers(influencer_id)
);
INSERT INTO influencers VALUES (1, 'Riya'), (2, 'Aarav'), (3, 'Maya');
INSERT INTO posts VALUES
(101, 1, 'Morning coffee'), (102, 1, 'Travel diary'),
(103, 2, 'New recipe'), (104, 2, 'Weekend vibes');

SELECT p.caption, i.name FROM posts p INNER JOIN influencers i ON p.influencer_id = i.influencer_id;
SELECT i.name, COALESCE(p.caption, 'No Posts') AS caption
FROM influencers i LEFT JOIN posts p ON i.influencer_id = p.influencer_id;
SELECT p.caption, i.name FROM influencers i RIGHT JOIN posts p ON i.influencer_id = p.influencer_id;
