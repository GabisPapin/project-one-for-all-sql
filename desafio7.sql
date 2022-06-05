SELECT albuns.artista AS artista,
	albuns.nome AS album,
    COUNT(seguindo.usuario_id) AS seguidores
FROM SpotifyClone.albuns AS albuns

INNER JOIN SpotifyClone.seguindo_artistas AS seguindo
ON seguindo.artista_id = albuns.artista_id

GROUP BY albuns.artista, albuns.nome
ORDER BY seguidores DESC, artista ASC, album ASC;