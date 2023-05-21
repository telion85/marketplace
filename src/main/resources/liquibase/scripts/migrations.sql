-- liquibase formatted sql

-- changeset starasov:1
create table "mp_users"
(
    "id"           BIGINT auto_increment
        primary key,
    "username"     CHARACTER VARYING(30),
    "password"     CHARACTER VARYING(1000000000),
    "first_name"   CHARACTER VARYING(30),
    "last_name"    CHARACTER VARYING(40),
    "phone"        CHARACTER VARYING(12),
    "role"         INTEGER,
    "img_id"       BIGINT
);

insert into "mp_users" ("username", "password", "first_name", "role")
values ('admin@heaven.ga', '$2a$10$A6uOqBaRchS4bGOrCVH24.NBczBtpsPuFYvlBXGOHwNUBqZsw4Hx2', 'admin', 1); --admin

CREATE SEQUENCE seq_users START WITH 1000;

-- changeset alrepin:1
create table "mp_img"
(
    "id"         BIGINT auto_increment
        primary key,
    "image"      bytea,
    "media_type" CHARACTER VARYING(255),
    "size"       BIGINT
);

/*
insert into "mp_img" ("image")
values (null);
*/

-- changeset alexTuraev:1
create table "mp_ads"
(
    "id" BIGINT auto_increment
        primary key,
    "description" CHARACTER VARYING(255),
    "price" INTEGER not null,
    "title" CHARACTER VARYING(255),
    "img_id" BIGINT,
    "user_id" BIGINT,
    constraint "img_id_constraint"
        foreign key ("img_id") references "mp_img" (id) ON DELETE CASCADE,
    constraint "user_id_constraint"
        foreign key ("user_id") references "mp_users" (id) ON DELETE CASCADE
);

create table "mp_comments"
(
    id         BIGINT auto_increment primary key,
    created_at TIMESTAMP,
    text       CHARACTER VARYING(255),
    ads_id     BIGINT,
    user_id    BIGINT,
    constraint "FK3bcj3l17xruibbviv9g2n57s6"
        foreign key (ads_id) references "mp_ads",
    constraint "FKm1uun165bcw52vv4krmem666a"
        foreign key (user_id) references "mp_users"
);


