-- SOAL!!
-- membuat database nama nya komen, isi nya
-- table user = id sama username
-- table comet = id, comentar, userid
-- bikin view dimana vw comen milih comentar sama username, auto increment

CREATE DATABASE komen;

USE komen;

CREATE TABLE IF NOT EXISTS USER (
id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Username VARCHAR(15) NOT NULL);

INSERT INTO USER (Username) VALUES
('dhearhd'),
('abcde'),
('user123');

SELECT * FROM USER;

CREATE TABLE IF NOT EXISTS comet(
id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
comentar VARCHAR(50) NOT NULL,
userid INT(10) NOT NULL,
FOREIGN KEY (userid) REFERENCES USER(id));

INSERT INTO comet(comentar, userid) VALUES
('Saya bisa', 1),
('Harus Bisa', 2),
('Ayoo semangat', 3);

SELECT * FROM comet;

CREATE VIEW vw_coment AS SELECT a.comentar, b.Username 
FROM comet a JOIN USER b ON a.userid = b.id 
GROUP BY a.comentar, b.Username;

SELECT * FROM vw_coment;
