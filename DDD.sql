-- Create the database
CREATE OR REPLACE DATABASE dungeons_dragons_data;

-- Create Schema
CREATE OR REPLACE SCHEMA d_d_d_dummy_data;

-- Create tables
CREATE OR REPLACE TABLE Characters (
    character_id INT AUTOINCREMENT START 1 INCREMENT 1,
    player_name VARCHAR(50),
    character_name VARCHAR(50),
    race VARCHAR(20),
    class VARCHAR(20),
    level INT,
    speed INT,
    ac INT,
    hp INT,
    strength INT,
    dexterity INT,
    constitution INT,
    intelligence INT, 
    wisdom INT,
    charisma INT
);
-- Future project table 
-- CREATE TABLE Races (
    --race_id 
--)

CREATE OR REPLACE TABLE Monsters (
    monster_id INT AUTOINCREMENT START 1 INCREMENT 1,
    name VARCHAR(50),
    type VARCHAR(20),
    ch_rating NUMBER(10,10),
    hp INT,
    ac INT,
    size VARCHAR(20), -- because size in DND is only small, medium, large, ect
    speed INT
);

CREATE OR REPLACE TABLE Players (
    player_id INT AUTOINCREMENT START 1 INCREMENT 1,
    name VARCHAR(50),
    can_dm BOOLEAN,
);