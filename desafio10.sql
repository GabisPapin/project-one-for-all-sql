SELECT historico.cancao_nome AS nome,
	COUNT(historico.usuario_id) AS reproducoes
FROM SpotifyClone.historico_reproducoes AS historico

INNER JOIN SpotifyClone.users AS users
ON users.usuario_id = historico.usuario_id
WHERE users.plano = 'gratuito' OR plano = 'pessoal'

GROUP BY historico.cancao_nome;