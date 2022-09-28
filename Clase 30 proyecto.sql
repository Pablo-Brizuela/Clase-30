## PASO 1-A: Mostrar el título y el género de todas las series
	 SELECT series.title, genres.name FROM series, genres
	 WHERE  genre_id = genres.id;
    -- solucion elegante
	SELECT series.title, genres.name FROM series
	INNER JOIN genres ON  genre_id = genres.id;

## PASO 1-B: Mostrar el titulo de los episodios, el nombre y apellido de los actores que trabajan en cada uno de ellos
	SELECT title, first_name, last_name FROM episodes, actor_episode, actors
	WHERE  episode_id = episodes.id
	AND actor_id = actors.id;
    -- otra elegante
    SELECT title, first_name, last_name FROM episodes
	INNER JOIN actor_episode ON episode_id = episodes.id
	INNER JOIN actors ON  actor_id = actors.id;

#########################################################################################################################

## PASO 2: Mostrar solo nombre y apellido de los actores que trabajen el todas las peliculas de 
## la guerra de las galaxias y que estos no se repitan
	SELECT DISTINCT first_name, last_name FROM movies
	INNER JOIN actor_movie ON movie_id = movies.id
	INNER JOIN actors ON  actor_id = actors.id
	WHERE title LIKE "%guerra%";
    
    select * from movies WHERE title = "La guerra de las galaxias: Episodio VI";

#####################################################################################################################

## PASO 3: Mostrar el titulo de cada pelicula con su género correspondiente, 
## en el caso de que no tenga género que imprima "no tiene género"
	SELECT title, COALESCE( name, "No tiene género") FROM movies
	LEFT JOIN genres ON genre_id = genres.id;

################################################################################################################################

## PASO 4: mostrar el titulo de cada serie y en la segunda columna (a la cual llamaremos: duracion) 
## la cantidad de dias desde su estreno hasta su fin
	SELECT title, DATEDIFF(end_date, release_date) AS duracion FROM series;

-- FORMATO DE FECHAS
-- 2022-09-26    
-- 2022-09-27
-- 2022-09-28

#################################################################################################################################

## PASO 5-A: Mostrar todos los actores cuyos nombre sean mayor a 6 caracteres, ordenados de la A a la Z
	SELECT * FROM actors WHERE LENGTH(first_name) > 6 ORDER BY first_name;
    SELECT a.first_name FROM actors a HAVING length(first_name) > 6;


## PASO 5-B: Mostrar la cantidad total de episodios
	SELECT COUNT(*) FROM episodes;
    SELECT COUNT(id) FROM episodes;
    SELECT * FROM episodes;

## PASO 5-C: Mostar el titulo de todas las series y el total de temporadas que tiene cada una de ellas.
	SELECT series.title, COUNT(seasons.title)  AS temporadas FROM series
	INNER JOIN seasons ON serie_id = series.id
	GROUP BY series.title;
    
    SELECT series.title, MAX(seasons.number) as "Temporadas" FROM series INNER JOIN seasons ON series.id = seasons.serie_id group by series.title;

    

## PASO 5-D:  Mostrar el nombre de todos los géneros y la cantidad total de peliculas 
## por cada uno siempre que sea mayor o igual a 3
	SELECT name, COUNT(*) FROM movies
	INNER JOIN genres ON genre_id = genres.id
	GROUP BY name
	HAVING COUNT(*) >= 3;
    
    SELECT g.name,COUNT(m.id) FROM genres as G
	INNER JOIN movies AS m
	ON m.genre_id=g.id
	GROUP BY g.name
	HAVING COUNT(m.id)>=3;