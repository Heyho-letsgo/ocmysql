USE c9;

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

DROP TABLE IF EXISTS PERSON;

CREATE TABLE IF NOT EXISTS PERSON(
    ID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
    PER_NOM VARCHAR(40),
    PER_NUM_TEL VARCHAR(10) NOT NULL,
    PER_MAIL VARCHAR(120) ,
    PER_CREE_LE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PER_MODIFIE_LE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
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
EXPLAIN PERSON;
EXPLAIN CommTel;

INSERT INTO PERSON(PER_NOM,PER_NUM_TEL,PER_MAIL) VALUES ('a','aa','a@a.com'),('b','bb','b@b.com'), ('c','cc','c@c.com'),('d','dd','');

SELECT * FROM PERSON;

SELECT * FROM PERSON WHERE id = 1 ;

UPDATE PERSON SET PER_NOM ="André", PER_MODIFIE_LE = now() where id = 1;
SELECT * FROM PERSON WHERE PER_NOM LIKE 'André';


LOAD DATA LOCAL INFILE '/0201.csv'
INTO TABLE PERSON
FIELDS TERMINATED BY ';' ENCLOSED BY ''
LINES TERMINATED BY ''(PER_NOM,PER_NUM_TEL,PER_MAIL);

DROP IF EXISTS LIBRARY;

CREATE TABLE IF NOT EXISTS LIBRARY (
ID smallint unsigned not null auto_increment, 
LIB_Book_Name varchar(40),
--LIB_Book_Person_Name varchar(40),
primary key(ID)
) 
engine=innodb;
EXPLAIN LIBRARY;

INSERT INTO
LIBRARY (LIB_Name) 
VALUES('La belle de Mai'),('Un loup en Hiver'), ('Lavigna');
EXPLAIN LIBRARY;
SELECT*FROM LIBRARY;



DROP TABLE IF EXISTS EMPLOYE;
CREATE TABLE IF NOT EXISTS EMPLOYE (
    ID smallint unsigned not null auto_increment, 
    EMP_LastName varchar (40), 
    EMP_FirstName varchar (40),
    EMP_CREE_LE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    EMP_MODIFIE_LE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY(ID)
    ) 
engine = innodb;

EXPLAIN EMPLOYE;

INSERT INTO 
EMPLOYE (EMP_LastName, EMP_FirstName) 
VALUES('Baudin-Laurencin','Charlotte'), ('Baudin-Laurencin', 'André'), ('Niven','David');

SELECT * FROM EMPLOYE;

SELECT * FROM EMPLOYE WHERE (EMP_FirstName = 'André') OR (EMP_LastName = 'Baudin-Laurencin');


DROP TABLE IF EXISTS CHAMBRE;
CREATE TABLE IF NOT EXISTS CHAMBRE (
    ID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    CHA_TYPE VARCHAR (7),
    CHA_NOMBRE TINYINT UNSIGNED,
    CHA_CREE_LE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHA_MODIFIE_LE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
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


SOURCE piece.sql


DROP TABLE IF EXISTS COMMANDE;

CREATE TABLE IF NOT EXISTS COMMANDE (
    ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    COM_PERSON_ID SMALLINT UNSIGNED NOT NULL,
    COM_LIB_ID SMALLINT,
    CONSTRAINT fk_PERSON_ID          -- On donne un nom à notre clé
        FOREIGN KEY (COM_PERSON_ID)             -- Colonne sur laquelle on crée la clé
        REFERENCES LIBRARY(ID)    -- Colonne de référence
    )
ENGINE=INNODB;                          -- MyISAM interdit, je le rappelle encore une fois !




SHOW TABLES;
EXPLAIN COMMANDE;


INSERT INTO COMMANDE (COM_PERSON_ID,COM_LIB_ID)VALUES(1,1);

SELECT * FROM COMMANDE WHERE (COM_PERSON_ID = 1);



DROP TABLE IF EXISTS BORROW;
CREATE TABLE IF NOT EXISTS BORROW (
    ID smallint unsigned not null auto_increment, 
    BOR_LastName varchar (40), 
    BOR_FirstName varchar (40),
    BOR_LIVRE varchar (40),
    BOR_CREE_LE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    BOR_MODIFIE_LE TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY(ID)
    ) 
engine = innodb;

EXPLAIN BORROW;

INSERT INTO 
BORROW (BOR_LastName, BOR_FirstName, BOR_LIVRE) 
VALUES('Baudin-Laurencin','Charlotte','Un loup en Hiver'), ('Niven', 'David','Lavigna');

SELECT * FROM BORROW;

SELECT EMPLOYE.EMP_FirstName,BOR_LIVRE 
FROM EMPLOYE, BORROW
WHERE EMP_LastName = BOR_LastName;