-- Généré par Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   à :        2023-08-28 23:36:15 CEST
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE medic_receita (
    tb_receita_codigo_receita NUMBER NOT NULL,
    tb_receita_codigo_usuario NUMBER NOT NULL,
    tb_receita_codigo         NUMBER NOT NULL,
    codigo_medicamento        NUMBER NOT NULL
);

ALTER TABLE medic_receita
    ADD CONSTRAINT contem_pk PRIMARY KEY ( tb_receita_codigo_receita,
                                           tb_receita_codigo_usuario,
                                           tb_receita_codigo,
                                           codigo_medicamento );

CREATE TABLE tb_bairro (
    codigo NUMBER NOT NULL,
    nome   VARCHAR2(20) NOT NULL
);

ALTER TABLE tb_bairro ADD CONSTRAINT tb_bairro_pk PRIMARY KEY ( codigo );

CREATE TABLE tb_medic_posto (
    codigo_posto              NUMBER NOT NULL,
    tb_posto_tb_bairro_codigo NUMBER NOT NULL,
    codigo_medicamento        NUMBER NOT NULL
);

ALTER TABLE tb_medic_posto
    ADD CONSTRAINT possuiv4_pk PRIMARY KEY ( codigo_posto,
                                             tb_posto_tb_bairro_codigo,
                                             codigo_medicamento );

CREATE TABLE tb_medicamento (
    codigo_medicamento    NUMBER NOT NULL,
    nm_marca              VARCHAR2(20) NOT NULL,
    nm_nome               VARCHAR2(20) NOT NULL,
    dt_validade           DATE NOT NULL,
    ds_via_admin          VARCHAR2(20) NOT NULL,
    ds_forma_apresentacao VARCHAR2(20) NOT NULL,
    nm_quantidade         NUMBER NOT NULL
);

ALTER TABLE tb_medicamento ADD CONSTRAINT tb_medicamento_pk PRIMARY KEY ( codigo_medicamento );

CREATE TABLE tb_posto (
    codigo_posto     NUMBER NOT NULL,
    hr_abertura      DATE NOT NULL,
    hr_fechamento    DATE NOT NULL,
    ds_funcionamento VARCHAR2(10),
    tb_bairro_codigo NUMBER NOT NULL
);

ALTER TABLE tb_posto ADD CONSTRAINT tb_posto_pk PRIMARY KEY ( codigo_posto,
                                                              tb_bairro_codigo );

CREATE TABLE tb_receita (
    codigo_receita              NUMBER NOT NULL,
    dt_validade                 DATE NOT NULL,
    tb_usuario_codigo_usuario   NUMBER NOT NULL,
    tb_usuario_tb_bairro_codigo NUMBER NOT NULL
);

ALTER TABLE tb_receita
    ADD CONSTRAINT tb_receita_pk PRIMARY KEY ( codigo_receita,
                                               tb_usuario_codigo_usuario,
                                               tb_usuario_tb_bairro_codigo );

CREATE TABLE tb_usuario (
    codigo_usuario   NUMBER NOT NULL,
    nm_username      VARCHAR2(20) NOT NULL,
    ds_email         VARCHAR2(320) NOT NULL,
    ds_senha         VARCHAR2(100),
    tb_bairro_codigo NUMBER NOT NULL
);

ALTER TABLE tb_usuario ADD CONSTRAINT tb_usuario_pk PRIMARY KEY ( codigo_usuario,
                                                                  tb_bairro_codigo );

ALTER TABLE tb_usuario ADD CONSTRAINT tb_usuario__un UNIQUE ( ds_email );

ALTER TABLE medic_receita
    ADD CONSTRAINT contem_tb_medicamento_fk FOREIGN KEY ( codigo_medicamento )
        REFERENCES tb_medicamento ( codigo_medicamento );

ALTER TABLE medic_receita
    ADD CONSTRAINT contem_tb_receita_fk FOREIGN KEY ( tb_receita_codigo_receita,
                                                      tb_receita_codigo_usuario,
                                                      tb_receita_codigo )
        REFERENCES tb_receita ( codigo_receita,
                                tb_usuario_codigo_usuario,
                                tb_usuario_tb_bairro_codigo );

ALTER TABLE tb_medic_posto
    ADD CONSTRAINT possuiv4_tb_medicamento_fk FOREIGN KEY ( codigo_medicamento )
        REFERENCES tb_medicamento ( codigo_medicamento );

ALTER TABLE tb_medic_posto
    ADD CONSTRAINT possuiv4_tb_posto_fk FOREIGN KEY ( codigo_posto,
                                                      tb_posto_tb_bairro_codigo )
        REFERENCES tb_posto ( codigo_posto,
                              tb_bairro_codigo );

ALTER TABLE tb_posto
    ADD CONSTRAINT tb_posto_tb_bairro_fk FOREIGN KEY ( tb_bairro_codigo )
        REFERENCES tb_bairro ( codigo );

ALTER TABLE tb_receita
    ADD CONSTRAINT tb_receita_tb_usuario_fk FOREIGN KEY ( tb_usuario_codigo_usuario,
                                                          tb_usuario_tb_bairro_codigo )
        REFERENCES tb_usuario ( codigo_usuario,
                                tb_bairro_codigo );

ALTER TABLE tb_usuario
    ADD CONSTRAINT tb_usuario_tb_bairro_fk FOREIGN KEY ( tb_bairro_codigo )
        REFERENCES tb_bairro ( codigo );



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             15
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
-- ERRORS                                   0
-- WARNINGS                                 0
