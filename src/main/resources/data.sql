DELETE FROM country;
DELETE FROM organization;
DELETE FROM Office;
DELETE FROM doc_type;
DELETE FROM document;
DELETE FROM users;
ALTER SEQUENCE global_seq RESTART WITH 100000;

INSERT INTO doc_type (name, code) VALUES ('Водительские права', '01');
INSERT INTO doc_type (name, code) VALUES ('Паспорт', '21');
INSERT INTO doc_type (name, code) VALUES ('Загранпаспорт', '13');

INSERT INTO country (code, name) VALUES ('643', 'Российская Федерация');
INSERT INTO country (code, name) VALUES ('666', 'Тьмутаракань');

INSERT INTO Organization (name, full_name, inn, kpp, address, phone, is_active)
VALUES ('Рога', 'ООО "Рога и копыта"', '6666666666', '7777777777', 'Безымянная, 6', '666-66-66', true);
INSERT INTO Organization (name, full_name, inn, kpp, address, phone, is_active)
VALUES ('БриллХоум', 'ООО "Бриллианс Хоум Системс"', '1111111111', '22222222222', 'Румянцево, 2', '222-22-22', true);
INSERT INTO Organization (name, full_name, inn, kpp, address, phone, is_active)
VALUES ('БриллТелеком', 'ООО "Бриллианс Телекоммуникейшн Системс"', '3333333333', '444444444', 'Ореховская, 3', '333-33-33', true);

INSERT INTO Office (name, address, phone, is_active, org_id)
VALUES ('Безыменский', 'Безымянная, 6', '666-66-66', 'true', 100006);
INSERT INTO Office (name, address, phone, is_active, org_id)
VALUES ('Румянцево', 'Румянцево, 2', '222-22-22', 'true', 100007);
INSERT INTO Office (name, address, phone, is_active, org_id)
VALUES ('Орехово', 'Ореховская, 3', '333-33-33', 'true', 100008);
INSERT INTO Office (name, address, phone, is_active, org_id)
VALUES ('Ясенево', 'Новоясеневская, 4', '444-44-44', 'true', 100008);

INSERT INTO document (doc_type_id, doc_number, doc_date)
VALUES (100001, '1701 123451', '2001-01-13');
INSERT INTO document (doc_type_id, doc_number, doc_date)
VALUES (100001, '1702 123452', '2001-01-14');
INSERT INTO document (doc_type_id, doc_number, doc_date)
VALUES (100001, '1703 123453', '2001-01-15');
INSERT INTO document (doc_type_id, doc_number, doc_date)
VALUES (100002, '1704 123454', '2001-01-16');
INSERT INTO document (doc_type_id, doc_number, doc_date)
VALUES (100003, '1705 123455', '2001-01-17');
INSERT INTO document (doc_type_id, doc_number, doc_date)
VALUES (100003, '1706 123456', '2002-02-18');

INSERT INTO User (first_name, second_name, middle_name, position, phone, doc_id, country_id, is_identified, office_id)
VALUES ('Иван', 'Иванов', 'Иванович', 'Инженер', '111-11-01', 100001, 100004, true, 100009);
INSERT INTO User (first_name, second_name, middle_name, position, phone, doc_id, country_id, is_identified, office_id)
VALUES ('Петр', 'Петров', 'Петрович', 'Техник', '111-11-02', 100002, 100004, true, 100009);
INSERT INTO User (first_name, second_name, middle_name, position, phone, doc_id, country_id, is_identified, office_id)
VALUES ('Роман', 'Романов', 'Романович', 'Механик', '111-11-03', 100001, 100004, true, 100010);
INSERT INTO User (first_name, second_name, middle_name, position, phone, doc_id, country_id, is_identified, office_id)
VALUES ('Сергей', 'Сергеев', 'Сергеевич', 'Инженер', '111-11-04', 100003, 100004, true, 100010);
INSERT INTO User (first_name, second_name, middle_name, position, phone, doc_id, country_id, is_identified, office_id)
VALUES ('Максим', 'Клюшкин', 'Миронович', 'Финконтролер', '111-11-05', 100001, 100005, true, 100011);
INSERT INTO User (first_name, second_name, middle_name, position, phone, doc_id, country_id, is_identified, office_id)
VALUES ('Олег', 'Бабушкин', 'Алексеевич', 'НачДеп', '111-11-06', 100001, 100005, true, 100011);
INSERT INTO User (first_name, second_name, middle_name, position, phone, doc_id, country_id, is_identified, office_id)
VALUES ('Алексей', 'Крылов', 'Анатольевич', 'гл инженер', '111-11-07', 100001, 100005, true, 100012);