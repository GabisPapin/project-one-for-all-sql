SELECT COUNT(DISTINCT ca.nome) AS cancoes, 
COUNT(DISTINCT art.nome) AS artistas, 
COUNT(DISTINCT al.nome) AS albuns
FROM SpotifyClone.cancoes AS ca
INNER JOIN SpotifyClone.albuns AS al
ON al.album_id = ca.album_id
INNER JOIN SpotifyClone.artistas AS art
ON art.artista_id = al.artista_id;