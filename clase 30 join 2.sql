SELECT *
		FROM musimundos.albumes a
			INNER JOIN musimundos.artistas r on r.id = a.id_artista
            WHERE nombre = "Deep Purple"
            
            