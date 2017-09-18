DROP TABLE IF EXISTS ANIMAL;

CREATE TABLE IF NOT EXISTS ANIMAL (
    ID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
    ANI_Espece VARCHAR(40) NOT NULL,
    ANI_Sexe VARCHAR(40),
    ANI_DateNaissance DATETIME NOT NULL,
    ANI_Nom VARCHAR(30),
    ANI_Commentaires TEXT,
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

EXPLAIN ANIMAL;
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

create table if not exists LIBRARY (
id smallint unsigned not null auto_increment, 
LIB_Name varchar(40),
primary key(id)
) 
engine=innodb;

EXPLAIN LIBRARY;


DROP TABLE IF EXISTS EMPLOYE;
CREATE TABLE IF NOT EXISTS EMPLOYE (
    ID smallint unsigned not null auto_increment, 
    EMP_LastName varchar (40), 
    EMP_FirstName varchar (40),
    PRIMARY KEY(ID)
    ) 
engine = innodb;

EXPLAIN EMPLOYE;

INSERT INTO 
EMPLOYE (EMP_LastName, EMP_FirstName) 
VALUES('Baudin-Laurencin','Charlotte'), ('Baudin-Laurencin', 'André'), ('David','Niven');

SELECT * FROM EMPLOYE;

SELECT * FROM EMPLOYE WHERE (EMP_FirstName = 'André') OR (EMP_LastName = 'Baudin-Laurencin');


DROP TABLE IF EXISTS CHAMBRE;
CREATE TABLE IF NOT EXISTS CHAMBRE (
    ID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    CHA_TYPE VARCHAR (7),
    CHA_NOMBRE TINYINT UNSIGNED,
    PRIMARY KEY(ID)
)
ENGINE = INNODB;

EXPLAIN CHAMBRE;


INSERT INTO 
CHAMBRE (CHA_TYPE, CHA_NOMBRE)
VALUES 
    ('Chambre',1),
    ('Chambre',2),
    ('Chambre',3),
    ('Chambre',4),
    ('Chambre',5),
    ('Chambre',6),
    ('Chambre',7),
    ('Chambre',8);
SELECT * FROM CHAMBRE;


SELECT * FROM CHAMBRE WHERE (CHA_NOMBRE = 7) OR (CHA_NOMBRE = 6) ORDER BY CHA_NOMBRE DESC; 