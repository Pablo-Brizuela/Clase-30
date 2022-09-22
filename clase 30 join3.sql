SELECT *
		FROM musimundos.canciones c
			INNER JOIN musimundos.tipos_de_medio t on t.id = c.id_tipo_de_medio
            WHERE t.nombre  = "MPEG audio file"