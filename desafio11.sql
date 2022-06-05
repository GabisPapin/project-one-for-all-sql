SELECT nome AS nome_musica,
	CASE
		WHEN nome = 'Dance With Her Own' THEN REPLACE('Dance With Her Own', 'Her Own', 'Trybe')
        WHEN nome = 'Let\'s Be Silly' THEN REPLACE('Let\'s Be Silly', 'Silly', 'Nice')
        WHEN nome = 'Magic Circus' THEN REPLACE('Magic Circus', 'Circus', 'Pull Request')
        WHEN nome = 'Troubles Of My Inner Fire' THEN REPLACE('Troubles Of My Inner Fire', 'Inner Fire', 'Project')
        WHEN nome = 'Without My Streets' THEN REPLACE('Without My Streets', 'Streets', 'Code Review')
        ELSE ''
	END AS novo_nome
FROM SpotifyClone.cancoes
WHERE nome = 'Dance With Her Own'
OR nome = 'Let\'s Be Silly'
OR nome = 'Magic Circus'
OR nome = 'Troubles Of My Inner Fire'
OR nome = 'Without My Streets'
GROUP BY nome;