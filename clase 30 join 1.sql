SELECT *
		FROM musimundos.canciones c
			INNER JOIN musimundos.generos g on g.id = c.id_genero
            WHERE g.nombre= "Rock"