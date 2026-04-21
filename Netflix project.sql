-- CREATE DATABASE netflix_project_analysis;
-- USE netflix_project_analysis;

SELECT * FROM netflix_project;

SELECT COUNT(title) FROM netflix_project;
SELECT COUNT(*) as total FROM netflix_project GROUP BY type;
SELECT * FROM netflix_project WHERE type = "Movie";
SELECT * FROM netflix_project WHERE release_year >2020;
SELECT COUNT(title) FROM netflix_project WHERE country="India";
SELECT YEAR(date_added) AS year_added, COUNT(*) AS total_titles FROM netflix_project GROUP BY YEAR(date_added) ORDER BY year_added;
SELECT country, COUNT(title) AS max_title FROM netflix_project GROUP BY country ORDER BY max_title DESC LIMIT 1;
SELECT rating, COUNT(*) AS total_rating FROM netflix_project GROUP BY rating ORDER BY total_rating DESC LIMIT 5;
SELECT AVG(duration) AS avg_duration FROM netflix_project WHERE type="Movie";
SELECT AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS avg_duration FROM netflix_project WHERE type = 'Movie';
SELECT listed_in, COUNT(*) AS common_genre FROM netflix_project GROUP BY listed_in ORDER BY common_genre DESC LIMIT 1;
SELECT MAX(release_year) FROM netflix_project WHERE release_year <(SELECT MAX(release_year) FROM netflix_project);
SELECT DISTINCT release_year FROM netflix_project ORDER BY release_year DESC LIMIT 1 OFFSET 1;
SELECT title, COUNT(*) AS duplicate_title FROM netflix_project GROUP BY title HAVING COUNT(*) > 1;
SELECT country, type, COUNT(*) as total FROM netflix_project GROUP BY country, type ORDER BY country;
SELECT MAX(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS hig_duration FROM netflix_project WHERE type = 'Movie';
SELECT title, CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) AS duration_min,
DENSE_RANK() OVER (ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC) AS rank_no 
FROM netflix_project WHERE type = 'Movie';
SELECT country, COUNT(type) AS maximum_movies FROM netflix_project WHERE type="Movie" GROUP BY country ORDER BY maximum_movies DESC LIMIT 3;
SELECT country, COUNT(type) AS maximum_TV_show FROM netflix_project WHERE type="TV Show" GROUP BY country ORDER BY maximum_TV_show DESC LIMIT 3;
SELECT * FROM netflix_project WHERE type="Movie" ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS unsigned) DESC LIMIT 1;
SELECT * FROM netflix_project WHERE type="Movie" ORDER BY CAST(substring_index(duration, ' ', 1) AS unsigned) DESC;
SELECT title, CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) AS duration_min, DENSE_RANK() 
OVER (ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC) AS rank_no FROM netflix_project WHERE type = 'Movie';
SELECT country, COUNT(*) AS total_movies FROM netflix_project WHERE type="Movie" GROUP BY country ORDER BY total_movies DESC LIMIT 3;
SELECT COUNT(*) FROM netflix_project WHERE type="TV Show" AND CAST(substring_index(duration, " ", 1) AS unsigned) >2;
SELECT * FROM netflix_project WHERE date_added >= date_sub(curdate(), interval 5 year);
SELECT type, COUNT(*) * 100/ (SELECT COUNT(*) FROM netflix_project) AS percentage FROM netflix_project GROUP BY type;
SELECT country, listed_in, COUNT(*) AS total FROM netflix_project GROUP BY country, listed_in ORDER BY total DESC;