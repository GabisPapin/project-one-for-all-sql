SELECT cancoes.nome AS cancao,
	COUNT(historico.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS cancoes

INNER JOIN SpotifyClone.historico_reproducoes AS historico
ON historico.cancao_id = cancoes.cancao_id

GROUP BY cancoes.nome
ORDER BY reproducoes DESC, cancoes.nome ASC
LIMIT 2;