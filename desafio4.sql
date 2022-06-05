SELECT users.nome AS usuario,
	IF (MAX(YEAR(historico.data_reproducao)) < '2021', 'Usuário inativo', 'Usuário ativo') 
    AS condicao_usuario
FROM SpotifyClone.users AS users

INNER JOIN SpotifyClone.historico_reproducoes AS historico
ON historico.usuario_id = users.usuario_id
GROUP BY users.nome;