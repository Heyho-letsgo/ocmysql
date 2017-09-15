USE C9



DROP TABLE IF EXISTS Animal;

CREATE TABLE IF NOT EXISTS Animal (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
    espece VARCHAR(40) NOT NULL,
    sexe VARCHAR(40),
    dateNaissance DATETIME NOT NULL,
    nom VARCHAR(30),
    commentaires TEXT,
    PRIMARY KEY(id)
    )
    ENGINE = INNODB;

DROP TABLE IF EXISTS Person;

CREATE TABLE IF NOT EXISTS Person(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
    nom VARCHAR(40),
    numTel VARCHAR(10) NOT NULL,
    mail VARCHAR(120) ,
    creeLe TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modifieLe TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY(id)
    )
    ENGINE=INNODB;
    
DROP TABLE IF EXISTS CommTel;

CREATE TABLE CommTel(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
    fkPersonId VARCHAR(10) NOT NULL,
    PRIMARY KEY(id)
    )
    ENGINE=INNODB;
    
SHOW TABLES;

EXPLAIN Animal;
EXPLAIN Person;
EXPLAIN CommTel;

INSERT INTO Person(nom,numTel,mail) VALUES ('a','aa','a@a.com'),('b','bb','b@b.com'), ('c','cc','c@c.com'),('d','dd','');

SELECT * FROM Person;

SELECT * FROM Person WHERE id = 1 ;

UPDATE Person SET nom ="André", modifieLe = now() where id = 1;
SELECT * FROM Person WHERE nom LIKE 'André';


LOAD DATA LOCAL INFILE '/0201.csv'
INTO TABLE Person
FIELDS TERMINATED BY ';' ENCLOSED BY ''
LINES TERMINATED BY ''(nom,numTel,mail);



