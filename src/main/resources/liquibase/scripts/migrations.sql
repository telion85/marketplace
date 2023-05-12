-- liquibase formatted sql

-- changeset starasov:1
create table if not exists "mp_users"
(
    id           bigint generated by default as identity primary key,
    username     varchar(30),
    password     text,
    first_name   varchar(30),
    last_name    varchar(40),
    phone        varchar(12),
    email        varchar(40),
    role         int,
    image        text,
    content_type varchar(30)
    );

insert into "mp_users" (id, username, password, first_name, last_name, phone, email, role, image, content_type)
values (1, 'Telion', '$2a$10$BzcMZENXkhcYEQrt5CDIyeZGIh0FPOyEb.xHNhwq8YD18o.TnpX6O', 'Sergei', 'Tarasov', '+78889992211', 'email@mail.ru', 1, 'image', 'contentType'); --psd
insert into "mp_users" (id, username, password, first_name, last_name, phone, email, role, image, content_type)
values (2, 'Venik', '$2a$10$FIruINDpbVd0WvOz51xCsOLunxMjp..KwrZ8R02xM2NNaor5R3zri', 'Вениамин', 'Петров', '+73339992211', 'venik@google.com', 0, 'image', 'contentType'); --pswd
insert into "mp_users" (id, username, password, first_name, last_name, phone, email, role, image, content_type)
values (3, 'Kuznec', '$2a$10$8AIWSRUhWxr/YwYPIwj2a.TghRfMJ2M/Sm05wO5s6VF7FC.otqOuG', 'Антон', 'Кузнецов', '+71119992211', 'kuznec@yandex.ru', 0, 'image', 'contentType'); --pas

-- changeset alrepin:1
create table if not exists "mp_ads"
(
    id    BIGINT auto_increment primary key,
    image CHARACTER VARYING(255),
    price INTEGER not null,
    title CHARACTER VARYING(255)
);

INSERT INTO "mp_ads" (image, price, title)
VALUES ('image', 5000, 'Good');

-- changeset alrepin:2
create table "mp_comments"
(
    id         BIGINT auto_increment
        primary key,
    created_at TIMESTAMP,
    text       CHARACTER VARYING(255),
    ads_id     BIGINT,
    user_id    BIGINT,
    constraint "FK3bcj3l17xruibbviv9g2n57s6"
        foreign key (ads_id) references "mp_ads",
    constraint "FKm1uun165bcw52vv4krmem666a"
        foreign key (user_id) references "mp_users"
);
INSERT INTO "mp_comments" (id, created_at, text, ads_id, user_id)
VALUES (1, '2023-04-28 06:46:29.000000', 'first comment', 1, 1);
INSERT INTO "mp_comments" (id, created_at, text, ads_id, user_id)
VALUES (2, '2023-04-28 07:46:29.000000', 'second comment', 1, 1);
INSERT INTO "mp_comments" (id, created_at, text, ads_id, user_id)
VALUES (3, '2023-04-28 08:46:29.000000', 'third comment', 1, 1);

-- changeset alexTuraev:1
ALTER TABLE "mp_ads"
    ADD COLUMN content_type CHARACTER VARYING(30);
ALTER TABLE "mp_ads"
    ADD COLUMN user_id BIGINT;
ALTER TABLE "mp_ads"
    ADD CONSTRAINT user_id_constraint FOREIGN KEY (user_id) REFERENCES "mp_users" (id) ON DELETE CASCADE;

-- changeset alexTuraev:2
INSERT INTO "mp_ads" (image, price, title, content_type, user_id)
    VALUES ('path1', 15000, 'product2', 'content_type', 1);
INSERT INTO "mp_ads" (image, price, title, content_type, user_id)
    VALUES ('path2', 10000, 'product3', 'content_type', 1);
INSERT INTO "mp_ads" (image, price, title, content_type, user_id)
    VALUES ('path3', 10000, 'product4', 'content_type', 2);
INSERT INTO "mp_ads" (image, price, title, content_type, user_id)
    VALUES ('path4', 11000, 'product5', 'content_type', 2);
INSERT INTO "mp_ads" (image, price, title, content_type, user_id)
    VALUES ('path5', 12000, 'product6', 'content_type', 2);

-- changeset alexTuraev:3
UPDATE "mp_ads"
    SET user_id = 1
    WHERE user_id is null;

-- changeset alexTuraev:4
ALTER TABLE "mp_ads"
    ADD COLUMN description text;

-- changeset starasov:2
UPDATE "mp_users" SET username = email;
ALTER TABLE "mp_users" DROP COLUMN email;
UPDATE "mp_users" SET password = '$2a$10$WI24YwtuGtKalv/bvXLQF.HIpGL4ncnnusPV8YU2.3dlpLlbPRgpO' WHERE password = '$2a$10$BzcMZENXkhcYEQrt5CDIyeZGIh0FPOyEb.xHNhwq8YD18o.TnpX6O'; --password
UPDATE "mp_users" SET password = '$2a$10$f8lPzkPX0vgvuwDlsUb0JOgVP4ckHDq5u8et9nZNiQRjsEGgBU1nm' WHERE password = '$2a$10$FIruINDpbVd0WvOz51xCsOLunxMjp..KwrZ8R02xM2NNaor5R3zri'; --password2
UPDATE "mp_users" SET password = '$2a$10$ewYVMeesx3hSpoOyDpxWSuC0YsVY.O1ybq9BiTCAH9vKLCABU.G02' WHERE password = '$2a$10$8AIWSRUhWxr/YwYPIwj2a.TghRfMJ2M/Sm05wO5s6VF7FC.otqOuG'; --password3
