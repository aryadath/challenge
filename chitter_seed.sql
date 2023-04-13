TRUNCATE TABLE users,peeps RESTART IDENTITY CASCADE;

DROP TABLE IF EXISTS "users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "users" (
    "id" SERIAL,
    "name" text,
    "email" text,
    "password" varchar, 
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "peeps";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;

-- Table Definition
CREATE TABLE "peeps" (
    "id" SERIAL,
    "user_id" int,
    "message" text,
    "peep_time" timestamp,
    PRIMARY KEY ("id")
);

INSERT INTO users (name, email, password ) 
VALUES 
  ('David', 'david@blip.com', 'ab123'),
  ('Mary', 'mary@blip.com', 'absde'),
  ('Mia', 'mia@blip.com', 'dsfes');

INSERT INTO peeps (user_id,message, peep_time) VALUES 
(1, 'Sunny day','2022-04-05 11:00:00' ),
(2, 'Hi guys','2022-05-09 10:00:00' ),
(3, 'France','2022-06-09 09:00:00' ),
(4, 'hurray','2022-03-09 10:00:00' ),
(5, 'Monkeys','2022-02-09 10:00:00' );

