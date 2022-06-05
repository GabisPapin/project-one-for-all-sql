SELECT ROUND(MIN(valor_plano), 2) AS 'faturamento_minimo',
	ROUND(MAX(valor_plano), 2) AS 'faturamento_maximo',
    ROUND(AVG(valor_plano), 2) AS 'faturamento_medio',
    ROUND(SUM(valor_plano), 2) AS 'faturamento_total'
FROM SpotifyClone.planos AS planos

INNER JOIN SpotifyClone.users AS users
ON users.plano = planos.plano;