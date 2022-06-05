DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
	plano VARCHAR(100) NOT NULL,
    valor_plano DECIMAL(3, 2) NOT NULL,
    CONSTRAINT PRIMARY KEY(plano)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos(plano, valor_plano)
VALUES('gratuito', 0.00),
	  ('familiar', 7.99),
      ('universitario', 5.99),
      ('pessoal', 6.99);

CREATE TABLE SpotifyClone.users(
	usuario_id INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    idade INTEGER NOT NULL,
    plano VARCHAR(20) NOT NULL,
    data_assinatura DATE NOT NULL,
    CONSTRAINT PRIMARY KEY(usuario_id),
    FOREIGN KEY(plano) REFERENCES planos(plano)
) engine = InnoDB;

INSERT INTO SpotifyClone.users(usuario_id, nome, idade, plano, data_assinatura)
VALUES(1, 'Thati', 23, 'gratuito', '2019-10-20'),
	  (2, 'Cintia', 35, 'familiar', '2017-12-30'),
      (3, 'Bill', 20, 'universitario', '2019-06-05'),
      (4, 'Roger', 45, 'pessoal', '2020-05-13'),
      (5, 'Norman', 58, 'pessoal', '2017-02-17'),
      (6, 'Patrick', 33, 'familiar', '2017-01-06'),
      (7, 'Vivian', 26, 'universitario', '2018-01-05'),
      (8, 'Carol', 19, 'universitario', '2018-02-14'),
      (9, 'Angelina', 42, 'familiar', '2018-04-29'),
      (10, 'Paul', 46, 'familiar','2017-01-17');
      
CREATE TABLE SpotifyClone.artistas(
	artista_id INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.artistas(artista_id, nome)
VALUES(1, 'Walter Phoenix'),
	  (2, 'Freedie Shannon'),
      (3, 'Lance Day'),
      (4, 'Peter Strong'),
      (5, 'Tyler Isle'),
      (6, 'Fog');

CREATE TABLE SpotifyClone.albuns(
	album_id INTEGER NOT NULL,
    nome VARCHAR(200) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    artista_id INTEGER NOT NULL,
    ano_lancamento YEAR,
    CONSTRAINT PRIMARY KEY(album_id),
    FOREIGN KEY(artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.albuns(album_id, nome, artista, artista_id, ano_lancamento)
VALUES(1, 'Envious', 'Walter Phoenix', 1, '1990'),
      (2, 'Exuberant', 'Walter Phoenix', 1, '1993'),
      (3, 'Hallowed Steam', 'Peter Strong', 4, '1995'),
      (4, 'Incandescent', 'Lance Day', 3, '1998'),
      (5, 'Temporary Culture', 'Freedie Shannon', 2, '2001'),
      (6, 'Library of liberty', 'Freedie Shannon', 2, '2003'),
      (7, 'Chained Down', 'Tyler Isle', 5, '2007'),
      (8, 'Cabinet of fools', 'Tyler Isle', 5, '2012'),
      (9, 'No guarantees', 'Tyler Isle', 5, '2015'),
      (10, 'Apparatus', 'Fog', 6, '2015');
      
CREATE TABLE SpotifyClone.seguindo_artistas(
	id INT NOT NULL AUTO_INCREMENT,
	artista_id INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    usuario_id INTEGER NOT NULL,
    CONSTRAINT PRIMARY KEY(id, nome),
	FOREIGN KEY(artista_id) REFERENCES artistas(artista_id),
    FOREIGN KEY(usuario_id) REFERENCES users(usuario_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.seguindo_artistas(artista_id, nome, usuario_id)
VALUES(1, 'Walter Phoenix', 1),
	  (2, 'Freedie Shannon', 1),
      (3, 'Lance Day', 1),
      (1, 'Walter Phoenix', 2),
      (3, 'Lance Day', 2),
      (4, 'Peter Strong', 3),
      (1, 'Walter Phoenix', 3),
      (2, 'Freedie Shannon', 4),
      (5, 'Tyler Isle', 5),
      (6, 'Fog', 5),
      (6, 'Fog', 6),
      (3, 'Lance Day',  6),
      (1, 'Walter Phoenix', 6),
      (4, 'Peter Strong', 7),
      (5, 'Tyler Isle', 7),
      (1, 'Walter Phoenix', 8),
      (5, 'Tyler Isle', 8),
      (6, 'Fog', 9),
      (2, 'Freedie Shannon', 9),
      (3, 'Lance Day', 9),
      (4, 'Peter Strong', 10),
      (6, 'Fog', 10);

CREATE TABLE SpotifyClone.cancoes(
	cancao_id INTEGER NOT NULL,
    nome VARCHAR(250) NOT NULL,
    duracao_segundos INTEGER,
    artista VARCHAR(100),
    artista_id INTEGER NOT NULL,
    album VARCHAR(200) NOT NULL,
    album_id INTEGER NOT NULL,
    CONSTRAINT PRIMARY KEY(cancao_id),
    FOREIGN KEY(artista_id) REFERENCES artistas(artista_id),
    FOREIGN KEY(album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.cancoes(cancao_id, nome, duracao_segundos, artista, artista_id, album, album_id)
VALUES(1, 'Soul For Us', '200', 'Walter Phoenix', 1, 'Envious', 1),
	  (2, 'Reflections Of Magic', '163', 'Walter Phoenix', 1, 'Envious', 1),
      (3, 'Dance With Her Own', '116',  'Walter Phoenix', 1, 'Envious', 1), 
      (4, 'Troubles Of My Inner Fire', '203', 'Walter Phoenix', 1, 'Exuberant', 2),
      (5, 'Time Fireworks', '152', 'Walter Phoenix', 1, 'Exuberant', 2),
      (6, 'Magic Circus', '105', 'Peter Strong', 4, 'Hallowed Steam', 3),
      (7, 'Honey, So Do I', '207', 'Peter Strong', 4, 'Hallowed Steam', 3),
      (8, 'Sweetie, Let\'s Go Wild', '139', 'Peter Strong', 4, 'Hallowed Steam', 3),
      (9, 'She Knows', '244', 'Peter Strong', 4, 'Hallowed Steam', 3),
      (10, 'Fantasy For Me', '100', 'Lance Day', 3, 'Incandescent', 4),
      (11, 'Celebration Of More', '146', 'Lance Day', 3, 'Incandescent', 4),
      (12, 'Rock His Everything', '223', 'Lance Day', 3, 'Incandescent', 4),
      (13, 'Home Forever', '231', 'Lance Day', 3, 'Incandescent', 4),
      (14, 'Diamond Power', '241', 'Lance Day', 3, 'Incandescent', 4),
      (15, 'Let\'s Be Silly', '132', 'Lance Day', 3, 'Incandescent', 4),
      (16, 'Thang Of Thunder', '240', 'Freedie Shannon', 2, 'Temporary Culture', 5), 
      (17, 'Words Of Her Life', '185', 'Freedie Shannon', 2, 'Temporary Culture', 5), 
      (18, 'Without My Streets', '176',  'Freedie Shannon', 2, 'Temporary Culture', 5), 
      (19, 'Need Of The Evening', '190', 'Freedie Shannon', 2, 'Library of liberty', 6), 
      (20, 'History Of My Roses', '222', 'Freedie Shannon', 2, 'Library of liberty', 6),
	  (21, 'Without My Love', '111', 'Freedie Shannon', 2, 'Library of liberty', 6),
      (22, 'Walking And Game', '123', 'Freedie Shannon', 2, 'Library of liberty', 6),
      (23, 'Young And Father', '197', 'Freedie Shannon', 2, 'Library of liberty', 6),
      (24, 'Finding My Traditions', '179', 'Tyler Isle', 5, 'Chained Down', 7),
      (25, 'Walking And Man', '229', 'Tyler Isle', 5, 'Chained Down', 7),
      (26, 'Hard And Time', '135', 'Tyler Isle', 5, 'Chained Down', 7),
      (27, 'Honey, I\'m A Lone Wolf', '150', 'Tyler Isle', 5, 'Chained Down', 7),
      (28, 'She Thinks I Won\'t Stay Tonight', '166', 'Tyler Isle', 5, 'Cabinet of fools', 8),
      (29, 'He Heard You\'re Bad For Me', '154', 'Tyler Isle', 5, 'Cabinet of fools', 8),
      (30, 'He Hopes We Can\'t Stay', '210', 'Tyler Isle', 5, 'Cabinet of fools', 8),
      (31, 'I Know I Know', '117', 'Tyler Isle', 5, 'Cabinet of fools', 8),
      (32, 'He\'s Walking Away', '159', 'Tyler Isle', 5, 'No guarantees', 9),
      (33, 'He\'s Trouble', '138', 'Tyler Isle', 5, 'No guarantees', 9),
      (34, 'I Heard I Want To Bo Alone', '120', 'Tyler Isle', 5, 'No guarantees', 9),
      (35, 'I Ride Alone', '151', 'Tyler Isle', 5, 'No guarantees', 9),
      (36, 'Honey', '79', 'Fog', 6, 'Apparatus', 10),
      (37, 'You Cheated On Me', '95', 'Fog', 6, 'Apparatus', 10),
      (38, 'Wouldn\'t It Be Nice', '213', 'Fog', 6, 'Apparatus', 10),
	  (39, 'Baby', '136', 'Fog', 6, 'Apparatus', 10),
      (40, 'You Make Me Feel So..', '83', 'Fog',6, 'Apparatus', 10); 
    
CREATE TABLE SpotifyClone.historico_reproducoes(
	usuario_id INTEGER NOT NULL,
    cancao_nome VARCHAR(200) NOT NULL,
    cancao_id INTEGER NOT NULL,
    data_reproducao DATETIME,
    CONSTRAINT PRIMARY KEY(cancao_nome, data_reproducao),
    FOREIGN KEY(usuario_id) REFERENCES users(usuario_id),
    FOREIGN KEY(cancao_id) REFERENCES cancoes(cancao_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.historico_reproducoes(usuario_id, cancao_nome, cancao_id, data_reproducao)
VALUES(1, 'Honey', 36,'2020-02-28 10:45:55'), 
	  (1, 'Walking And Man', 25, '2020-05-02 05:30:35'),
      (1, 'Young And Father', 23, '2020-03-06 11:22:33'), 
      (1, 'Diamond Power', 14, '2020-08-05 08:05:17'),
      (1, 'Let\'s Be Silly', 15, '2020-09-14 16:32:22'),
      (2, 'I Heard I Want To Bo Alone', 34, '2020-01-02 07:40:33'),
      (2, 'Finding My Traditions', 24, '2020-05-16 06:16:22'), 
      (2, 'Without My Love', 21, '2020-10-09 12:27:48'), 
      (2, 'Baby', 39, '2020-09-21 13:14:46'), 
      (3, 'Magic Circus', 6, '2020-11-13 16:55:13'),
      (3, 'Dance With Her Own', 3, '2020-12-05 18:38:30'),
      (3, 'Hard And Time', 26, '2020-07-30 10:00:00'),
      (4, 'Reflections Of Magic', 2, '2021-08-15 17:10:10'),
      (4, 'I Ride Alone', 35, '2021-07-10 15:20:30'),
      (4, 'Honey, I\'m A Lone Wolf', 27, '2021-01-09 01:44:33'), 
      (5, 'Honey, So Do I', 7, '2020-07-03 19:33:28'), 
      (5, 'Rock His Everything', 12, '2017-02-24 21:14:22'), 
      (5, 'Diamond Power', 14, '2020-08-06 15:23:43'),
      (5, 'Soul For Us', 1, '2020-11-10 13:52:27'), 
      (6, 'Wouldn\'t It Be Nice', 38, '2019-02-07 20:33:48'), 
      (6, 'He Heard You\'re Bad For Me', 29, '2017-01-24 00:31:17'), 
      (6, 'He Hopes We Can\'t Stay', 30, '2017-10-12 12:35:20'),
      (6, 'Walking And Game', 22, '2018-05-29 14:56:41'),
      (7, 'Time Fireworks', 5, '2018-05-09 22:30:49'),
      (7, 'Troubles Of My Inner Fire', 4, '2020-07-27 12:52:58'),
      (7, 'Celebration Of More', 11, '2018-01-16 18:40:43'),
      (8, 'Baby', 39, '2018-03-21 16:56:40'),
      (8, 'You Make Me Feel So..', 40, '2020-10-18 13:38:05'),
      (8, 'He\'s Walking Away', 32, '2019-05-25 08:14:03'),
      (8, 'He\'s Trouble', 33, '2021-08-15 21:37:09'),
      (9, 'Thang Of Thunder', 16, '2021-05-24 17:23:45'),
      (9, 'Words Of Her Life', 17, '2018-12-07 22:48:52'),
      (9, 'Sweetie, Let\'s Go Wild', 8, '2021-03-14 06:14:26'),
      (9, 'She Knows', 9, '2020-04-01 03:36:00'),
      (10, 'History Of My Roses', 20, '2017-02-06 08:21:34'),
      (10, 'Without My Love', 21, '2017-12-04 05:33:43'),
      (10, 'Rock His Everything', 12, '2017-07-27 05:24:49'),
      (10, 'Home Forever', 13, '2017-12-25 01:03:57');     