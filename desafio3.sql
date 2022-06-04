SELECT
	users.nome AS usuario,
    COUNT(historico.usuario_id) AS qtde_musicas_ouvidas,
   ROUND(SUM(cancoes.duracao_segundos)/ 60, 2) AS total_minutos
FROM SpotifyClone.users AS users

INNER JOIN SpotifyClone.historico_reproducoes AS historico
ON historico.usuario_id = users.usuario_id

INNER JOIN SpotifyClone.cancoes AS cancoes
ON cancoes.cancao_id = historico.cancao_id

GROUP BY users.nome
ORDER BY users.nome ASC;