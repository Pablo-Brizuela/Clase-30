 SELECT c.id_genero, COUNT(*)
		FROM musimundos.canciones c
			INNER JOIN musimundos.generos g on g.id = c.id_genero
            GROUP BY c.id_genero
            
            