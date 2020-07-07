DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS organization;
DROP TABLE IF EXISTS Office;
DROP TABLE IF EXISTS doc_type;
DROP TABLE IF EXISTS document;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START WITH 100000;

CREATE TABLE IF NOT EXISTS country
(
    id   INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    code VARCHAR(3)  NOT NULL COMMENT 'Цифровой код',
    name VARCHAR(50) NOT NULL COMMENT 'Наименование'
);
COMMENT ON TABLE country IS 'Справочника Государств';


CREATE TABLE IF NOT EXISTS organization
(
    id        INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    name      VARCHAR(50)  NOT NULL COMMENT 'Короткое наименование',
    full_name VARCHAR(50)  NOT NULL COMMENT 'Поное наименование',
    inn       VARCHAR(10)  NOT NULL COMMENT 'ИНН',
    kpp       VARCHAR(9)   NOT NULL COMMENT 'КПП',
    address   VARCHAR(100) NOT NULL COMMENT 'Адрес',
    phone     VARCHAR(20) COMMENT 'Телефон',
    is_active BOOLEAN COMMENT 'Активность'
);
COMMENT ON TABLE organization IS 'Таблица организаций';


CREATE TABLE IF NOT EXISTS office
(
    id        INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    name      VARCHAR(50)  NOT NULL COMMENT 'Наименование',
    address   VARCHAR(100) NOT NULL COMMENT 'Адрес',
    phone     VARCHAR(20) COMMENT 'Телефон',
    is_active BOOLEAN COMMENT 'Активность',
    org_id    BIGINT COMMENT 'Внешний ключ. Связь с таблицей Organization',
    FOREIGN KEY (org_id) REFERENCES Organization (id)
);
COMMENT ON TABLE office IS 'Таблица офисов';


CREATE TABLE IF NOT EXISTS doc_type
(
    id   INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    code VARCHAR(2)  NOT NULL COMMENT 'Цифровой код',
    name VARCHAR(50) NOT NULL COMMENT 'Наименование'
);
COMMENT ON TABLE doc_type IS 'Таблица справочника Тип документа';


CREATE TABLE IF NOT EXISTS document
(
    id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    doc_type_id INTEGER      NOT NULL COMMENT 'Внешний ключ. Связь с таблицей doc_type',
    FOREIGN KEY (doc_type_id) REFERENCES doc_type (id),
    doc_number  VARCHAR(20) NOT NULL COMMENT 'Номер',
    doc_date    TIMESTAMP        NOT NULL COMMENT 'Дата'
);
COMMENT ON TABLE document IS 'Таблица документов работника (User)';


CREATE TABLE IF NOT EXISTS users
(
    id             INTEGER PRIMARY KEY DEFAULT nextval('global_seq') ,
    first_name     VARCHAR(50) NOT NULL COMMENT 'Имя',
    second_name    VARCHAR(50) COMMENT 'Фамилия',
    middle_name    VARCHAR(50) COMMENT 'Отчество',
    position       VARCHAR(50) NOT NULL COMMENT 'Должность',
    phone          VARCHAR(20) COMMENT 'Телефон',
    doc_id         INTEGER COMMENT 'Внешний ключ. Связь с таблицей document',
    FOREIGN KEY (doc_id) REFERENCES document (id),
    country_id INTEGER COMMENT 'Внешний ключ. Связь с таблицей country',
    FOREIGN KEY (country_id) REFERENCES country (id),
    is_identified  BOOLEAN COMMENT 'Идентификация',
    office_id      INTEGER COMMENT 'Внешний ключ. Связь с таблицей Office',
    FOREIGN KEY (office_id) REFERENCES Office (id)
);
COMMENT ON TABLE users IS 'Таблица работников';


CREATE INDEX UX_Organization_id ON organization (id);
CREATE INDEX UX_Office_id ON office (id);
CREATE INDEX UX_User_id ON users (id);
CREATE INDEX UX_doc_type_id ON doc_type (id);
CREATE INDEX UX_country_id ON country (id);
CREATE INDEX UX_document_id ON document (id);


CREATE INDEX IX_Office_ogr_id ON Office (org_id);
CREATE INDEX IX_User_office_id ON users (office_id);
CREATE INDEX IX_User_citizenship_id ON users (country_id);
CREATE INDEX IX_User_doc_id ON users (doc_id);
CREATE INDEX IX_document_doc_type_id ON document (doc_type_id);