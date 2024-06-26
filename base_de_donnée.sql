-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2024-05-22 18:57:17 EDT
--   site:      Oracle Database 21c
--   type:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE


-- Création de la table billet
CREATE TABLE BILLET (
    ID_BILLET NUMBER NOT NULL,
    PRIX FLOAT(40) NOT NULL,
);

ALTER TABLE BILLET ADD CONSTRAINT BILLET_PK PRIMARY KEY ( ID_BILLET );

-- Insertion de données dans la table billet

INSERT INTO BILLET (
    ID_BILLET,
    PRIX
) VALUES (
    1323,
    10.50
);

INSERT INTO BILLET (
    ID_BILLET,
    PRIX
) VALUES (
    2312,
    3.99
);

INSERT INTO BILLET (
    ID_BILLET,
    PRIX
) VALUES (
    3578,
    2.50
);

INSERT INTO BILLET (
    ID_BILLET,
    PRIX
) VALUES (
    434,
    22.99
);

INSERT INTO BILLET (
    ID_BILLET,
    PRIX
) VALUES (
    575,
    7.99
);

COMMIT;

SELECT
    *
FROM
    BILLET;

-- Création de la table evenement
CREATE TABLE EVENEMENT (
    ID_EVENEMENT NUMBER NOT NULL,
    NOM_EVENEMENT VARCHAR2(255) NOT NULL,
    DESCRIPTION VARCHAR2(1000) NOT NULL
);

ALTER TABLE EVENEMENT ADD CONSTRAINT EVENEMENT_PK PRIMARY KEY ( ID_EVENEMENT );

-- Insertion de données dans la table evenement

INSERT INTO EVENEMENT (
    ID_EVENEMENT,
    NOM_EVENEMENT,
    DESCRIPTION
) VALUES (
    243,
    "Festival Oriental",
    "Festival qui célèbre l'histoire de l'Asie"
);

INSERT INTO EVENEMENT (
    ID_EVENEMENT,
    NOM_EVENEMENT,
    DESCRIPTION
) VALUES (
    3213,
    "Festival international de Jazz",
    "Festival qui célèbre l'histoire du Jazz au Québec"
);

INSERT INTO EVENEMENT (
    ID_EVENEMENT,
    NOM_EVENEMENT,
    DESCRIPTION
) VALUES (
    123,
    "Expo de Jeux Vidéos",
    "Venez voir cette exposition des meilleurs jeux vidéos de l'année."
);

INSERT INTO EVENEMENT (
    ID_EVENEMENT,
    NOM_EVENEMENT,
    DESCRIPTION
) VALUES (
    452,
    "Fan Expo",
    "Venez participer à cette exposition si vous êtes fans de Marvel, DC et d'animées"
);

COMMIT;

SELECT
    *
FROM
    EVENEMENT;

-- Création de la table organisateur

CREATE TABLE ORGANISATEUR (
    ID_ORGANISATEUR NUMBER NOT NULL,
    NOM_ORGANISATEUR VARCHAR2(255) NOT NULL
);

ALTER TABLE ORGANISATEUR ADD CONSTRAINT ORGANISATEUR_PK PRIMARY KEY ( ID_ORGANISATEUR );

-- Insertion de données dans la table organisateur

INSERT INTO ORGANISATEUR (
    ID_ORGANISATEUR,
    NOM
) VALUES (
    23,
    "Micheal Jordan"
);

INSERT INTO ORGANISATEUR (
    ID_ORGANISATEUR,
    NOM
) VALUES (
    2312,
    "Asuna Yuuki"
);

INSERT INTO ORGANISATEUR (
    ID_ORGANISATEUR,
    NOM
) VALUES (
    438,
    "Ezio Auditore"
);

INSERT INTO ORGANISATEUR (
    ID_ORGANISATEUR,
    NOM
) VALUES (
    483,
    "Harry Potter"
);

INSERT INTO ORGANISATEUR (
    ID_ORGANISATEUR,
    NOM
) VALUES (
    1,
    "Micheal Scofield"
);

COMMIT;

SELECT
    *
FROM
    ORGANISATEUR;

-- Création de la table représentation

CREATE TABLE REPRESENTATION (
    ID_REPRESENTATION NUMBER NOT NULL,
    "Date" DATE NOT NULL,
    HEURE DATE NOT NULL,
    LIEU VARCHAR2(255)NOT NULL,
);

ALTER TABLE REPRESENTATION ADD CONSTRAINT REPRESENTATION_PK PRIMARY KEY ( ID_REPRESENTATION );

-- Insertion de données dans la table representation

INSERT INTO REPRESENTATION (
    ID_REPRESENTATION,
    "Date",
    HEURE,
    LIEU
) VALUES (
    231,
    2024-08-23,
    10:30:00,
    "Centre Bell"
);

INSERT INTO REPRESENTATION (
    ID_REPRESENTATION,
    "Date",
    HEURE,
    LIEU
) VALUES (
    34,
    2024-07-15,
    16:45:00,
    "Place Bell"
);

INSERT INTO REPRESENTATION (
    ID_REPRESENTATION,
    "Date",
    HEURE,
    LIEU
) VALUES (
    778,
    2024-07,
    3,
    12:30:00,
    "Place des Arts"
);

INSERT INTO REPRESENTATION (
    ID_REPRESENTATION,
    "Date",
    HEURE,
    LIEU
) VALUES (
    53,
    2024-08,
    5,
    12:00:00,
    "Place des Arts"
);

INSERT INTO REPRESENTATION (
    ID_REPRESENTATION,
    "Date",
    HEURE,
    LIEU
) VALUES (
    12,
    2024-07-16,
    14:30:00,
    "Centre Bell"
);

COMMIT;

SELECT
    *
FROM
    REPRESENTATION;

-- Création de la table utilisateur

CREATE TABLE UTILISATEUR (
    ID_UTILISATEUR INTEGER NOT NULL,
    NOM_UTILISATEUR VARCHAR2(255) NOT NULL,
    EMAIL VARCHAR2(255) NOT NULL,
);

ALTER TABLE UTILISATEUR ADD CONSTRAINT UTILISATEUR_PK PRIMARY KEY ( ID_UTILISATEUR );

-- Insertion de données dans la table utilisateur

INSERT INTO UTILISATEUR (
    ID_UTILISATEUR,
    NOM_UTILISATEUR,
    EMAIL
) VALUES (
    22,
    "lebronfan_123",
    "lebronfan_123@gmail.com"
);

INSERT INTO UTILISATEUR (
    ID_UTILISATEUR,
    NOM_UTILISATEUR,
    EMAIL
) VALUES (
    23,
    "Justin Dugazon",
    "justindugazon1322@gmail.com"
);

INSERT INTO UTILISATEUR (
    ID_UTILISATEUR,
    NOM_UTILISATEUR,
    EMAIL
) VALUES (
    45,
    "Mcfly et Carlito",
    "mcflycarlito@gmail.com"
);

INSERT INTO UTILISATEUR (
    ID_UTILISATEUR,
    NOM_UTILISATEUR,
    EMAIL
) VALUES (
    123,
    "fortnitePlayer_dr23123",
    "fortnitePlayer.dr23123@hotmail.com"
);

COMMIT;

SELECT
    *
FROM
    UTILISATEUR;

ALTER TABLE BILLET ADD CONSTRAINT BILLET_REPRESENTATION_FK FOREIGN KEY ( REPRESENTATION_ID_REPRESENTATION ) REFERENCES REPRESENTATION ( ID_REPRESENTATION );

ALTER TABLE ORGANISATEUR ADD CONSTRAINT ORGANISATEUR_EVENEMENT_FK FOREIGN KEY ( EVENEMENT_ID_EVENEMENT ) REFERENCES EVENEMENT ( ID_EVENEMENT );

ALTER TABLE UTILISATEUR ADD CONSTRAINT UTILISATEUR_EVENEMENT_FK FOREIGN KEY ( EVENEMENT_ID_EVENEMENT ) REFERENCES EVENEMENT ( ID_EVENEMENT );

ALTER TABLE REPRESENTATION ADD CONSTRAINT REPRESENTATION_EVENEMENT_FK FOREIGN KEY ( EVENEMENT_ID_EVENEMENT ) REFERENCES EVENEMENT ( ID_EVENEMENT );

-- Ceci va creer un URI sous le URL qui pourra etre utilise pour y activer les tables en mode REST
BEGIN
    ORDS.ENABLE_SCHEMA(
        P_ENABLED => TRUE,
        P_SCHEMA => 'RESTSCOTT',
        P_URL_MAPPING_TYPE => 'BASE_PATH',
        P_URL_MAPPING_PATTERN => 'hr2',
        P_AUTO_REST_AUTH => FALSE
    );
    COMMIT;
END;
/

-- Activation de la table billet pour acces REST
BEGIN
    ORDS.ENABLE_OBJECT (
        P_ENABLED => TRUE, -- Default  { TRUE | FALSE }
        P_SCHEMA => 'RESTSCOTT',
        P_OBJECT => 'BILLET',
        P_OBJECT_TYPE => 'TABLE', -- Default  { TABLE | VIEW }
        P_OBJECT_ALIAS => 'billet'
    );
    COMMIT;
END;
/

-- Activation de la table evenement hotel pour acces REST
BEGIN
    ORDS.ENABLE_OBJECT (
        P_ENABLED => TRUE, -- Default  { TRUE | FALSE }
        P_SCHEMA => 'RESTSCOTT',
        P_OBJECT => 'EVENEMENT',
        P_OBJECT_TYPE => 'TABLE', -- Default  { TABLE | VIEW }
        P_OBJECT_ALIAS => 'evenement'
    );
    COMMIT;
END;
/

-- Activation de la table organisateur pour acces REST
BEGIN
    ORDS.ENABLE_OBJECT (
        P_ENABLED => TRUE, -- Default  { TRUE | FALSE }
        P_SCHEMA => 'RESTSCOTT',
        P_OBJECT => 'ORGANISATEUR',
        P_OBJECT_TYPE => 'TABLE', -- Default  { TABLE | VIEW }
        P_OBJECT_ALIAS => 'organisateur'
    );
    COMMIT;
END;
/

-- Activation de la table representation pour acces REST
BEGIN
    ORDS.ENABLE_OBJECT (
        P_ENABLED => TRUE, -- Default  { TRUE | FALSE }
        P_SCHEMA => 'RESTSCOTT',
        P_OBJECT => 'REPRESENTATION',
        P_OBJECT_TYPE => 'TABLE', -- Default  { TABLE | VIEW }
        P_OBJECT_ALIAS => 'representation'
    );
    COMMIT;
END;
/

-- Activation de la table utilisateur pour acces REST
BEGIN
    ORDS.ENABLE_OBJECT (
        P_ENABLED => TRUE, -- Default  { TRUE | FALSE }
        P_SCHEMA => 'RESTSCOTT',
        P_OBJECT => 'UTILISATEUR',
        P_OBJECT_TYPE => 'TABLE', -- Default  { TABLE | VIEW }
        P_OBJECT_ALIAS => 'utilisateur'
    );
    COMMIT;
END;
/

-- Confirmation de l'activation du schema
SELECT
    *
FROM
    USER_ORDS_SCHEMAS;

-- Confirmation de l'activation des tables pour REST
SELECT
    *
FROM
    USER_ORDS_ENABLED_OBJECTS;

-- Oracle SQL Developer Data Modeler Summary Report:
--
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
--
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
--
-- REDACTION POLICY                         0
--
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
--
-- ERRORS                                   1
-- WARNINGS                                 0