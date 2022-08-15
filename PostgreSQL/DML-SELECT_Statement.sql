-- DML: SELECT Statement

SELECT * 
FROM film;
--

SELECT title, release_year
FROM film;
ORDER BY title;
--

SELECT title, release_year
FROM film;
ORDER BY release_year DESC;
--

SELECT title, release_year
FROM film;
ORDER BY release_year, title;
--

SELECT title, release_year  
FROM film 
ORDER BY 2, 1;
--

SELECT title AS movie_title, release_year AS movie_release_year  
FROM film 
ORDER BY 1;
--

SELECT title AS movie_title, release_year AS movie_release_year  
FROM film 
ORDER BY movie_release_year DESC;
--

SELECT DISTINCT rating  
FROM film 
ORDER BY 1;
--

SELECT actor_id, first_name, last_name  
FROM actor  
ORDER BY 2, 3;
--

SELECT actor_id, first_name || ' ' || last_name AS actor_full_name
FROM actor  
ORDER BY 2;
--

SELECT actor_id, first_name || ' ' || last_name AS actor_full_name
FROM actor  
WHERE last_name = 'Cruise' 
ORDER BY 2;
--

SELECT actor_id, first_name || ' ' || last_name AS actor_full_name
FROM actor  
WHERE UPPER (last_name) = 'CRUISE' 
ORDER BY 2;
--

SELECT actor_id, first_name || ' ' || last_name AS actor_full_name
FROM actor  
WHERE UPPER (last_name) LIKE ('BRA%') 
ORDER BY 2;
--

SELECT actor_id, first_name || ' ' || last_name AS actor_full_name
FROM actor  
WHERE UPPER (last_name) IN ('CRUISE', 'BRANDO', 'STREEP') 
ORDER BY 2;
--

SELECT SUBSTRING ('Leonardo', 1, 3); -- Leo
--

SELECT POSITION ('L' IN 'Leonardo'); -- 1
--

SELECT POSITION ('l' IN 'Leonardo'); -- 0
--

SELECT POSITION ('o' IN 'Leonardo'); -- 3
--

SELECT 2 + 2 * 2; -- 6
--

SELECT 2 + 2 * 2 = 6; -- true
--

SELECT 2 + 2 * 2 = 7; -- false
--

SELECT GREATEST (5, 26, -75, 0, 36.6, NULL, 7); -- 36.6
--

SELECT LEAST (5, 26, -75, 0, 36.6, NULL, 7); -- 75
--

SELECT PG_TYPEOF(LEAST(5, 26, -75, 0, 36.6, NULL, 7)); -- numeric
--

SELECT COALESCE (NULL, 10, '50'); -- 10
--

SELECT COALESCE (NULL, NULL, '50', 10); -- 50
--

SELECT PG_TYPEOF(COALESCE (NULL, NULL, '50', 10)); -- integer
--

SELECT PG_TYPEOF(COALESCE (NULL, NULL, '50', 10::TEXT)); -- text
--

SELECT title, language_id -- language_id is a foreign key to the language table
FROM film 
ORDER BY 1;
SELECT * 
FROM language;
--

SELECT f.title AS movie_title,
       lang.name AS language_name
FROM film f 
INNER JOIN 
language lang
ON lang.language_id = f.language_id 
ORDER BY 1;
--

SELECT a.first_name, a.last_name, COUNT(*) AS count_of_film
FROM actor a
INNER JOIN film_actor fa
ON fa.actor_id = a.actor_id 
GROUP BY a.first_name, a.last_name
ORDER BY count_of_film;
--

SELECT a.first_name, a.last_name, COUNT(*) AS count_of_film
FROM actor a
INNER JOIN film_actor fa
ON fa.actor_id = a.actor_id 
GROUP BY a.first_name, a.last_name
HAVING COUNT (*) > 40
ORDER BY count_of_film DESC;
--

-- three longest films and actors, who played there
SELECT  max_length_film.title AS movie_title,
		a.first_name || ' ' || a.last_name AS actor_full_name,
		length as minutes_length
FROM 
	(SELECT * 
	FROM film f 
	ORDER BY f.length DESC 
	LIMIT (3)) AS max_length_film
INNER JOIN film_actor fa
ON fa.film_id = max_length_film.film_id
INNER JOIN actor a
ON a.actor_id = fa.actor_id;
--

-- amount of movies, where Tom Hanks played
SELECT fa.film_id
FROM film_actor fa
WHERE fa.actor_id = 
					(SELECT a.actor_id
					 FROM actor a 
					 WHERE UPPER (a.first_name) = 'TOM' AND UPPER (a.last_name) = 'HANKS'
					 );
--

-- amount of movies, where Tom Hanks played with the name of the movies				 
SELECT  f.title,
		f.release_year
FROM film f
WHERE f.film_id IN (
					SELECT fa.film_id
					FROM film_actor fa
					WHERE fa.actor_id = 
										(SELECT a.actor_id
										 FROM actor a 
										 WHERE UPPER (a.first_name) = 'TOM' AND UPPER (a.last_name) = 'HANKS'));
--

-- same, but with EXISTS operator
SELECT  f.title,
		f.release_year
FROM film f
WHERE EXISTS (
					SELECT fa.film_id
					FROM film_actor fa
					WHERE fa.actor_id = 
										(SELECT a.actor_id
										 FROM actor a 
										 WHERE UPPER (a.first_name) = 'TOM' AND UPPER (a.last_name) = 'HANKS')
					AND f.film_id = fa.film_id);  -- filtering
--