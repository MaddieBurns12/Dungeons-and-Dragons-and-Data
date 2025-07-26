-- Create the database
CREATE OR REPLACE DATABASE dungeons_dragons_data;

-- Create Schema
CREATE OR REPLACE SCHEMA d_d_d_dummy_data;

-- Create tables
CREATE OR REPLACE TABLE characters (
    character_id INT AUTOINCREMENT START 1 INCREMENT 1,
    player_name VARCHAR(50),
    character_name VARCHAR(50),
    race VARCHAR(20),
    class VARCHAR(20),
    level INT,
    speed INT,
    ac INT,
    hp INT,
    str INT,
    dex INT,
    con INT,
    intl INT, 
    wis INT,
    char INT,
    spellcaster BOOLEAN
);

CREATE OR REPLACE TABLE players (
    player_id INT AUTOINCREMENT START 1 INCREMENT 1,
    name VARCHAR(50),
    can_dm BOOLEAN
);

CREATE OR REPLACE TABLE spellcasters(
    character_id INT AUTOINCREMENT START 1 INCREMENT 1,
    character_name VARCHAR(50),
    class VARCHAR(20),
    class_level INT,
    highest_spell_slot INT,
    slots_1 INT,
    slots_2 INT,
    slots_3 INT,
    slots_4 INT,
    slots_5 INT,
    slots_6 INT,
    slots_7 INT,
    slots_8 INT,
    slots_9 INT
);
-- Helper table in order to populate the logic into the spellcasters table 
CREATE OR REPLACE TABLE spell_slot_progression (
    class VARCHAR,
    level INT,
    highest_spell_level INT,
    slots_1 INT,
    slots_2 INT,
    slots_3 INT,
    slots_4 INT,
    slots_5 INT,
    slots_6 INT,
    slots_7 INT,
    slots_8 INT,
    slots_9 INT
);

CREATE OR REPLACE TABLE races(
    race_id INT AUTOINCREMENT START 1 INCREMENT 1,
    race_name VARCHAR(50),
    size VARCHAR(10),
    speed INT
);

CREATE OR REPLACE TABLE monsters (
    monster_id INT AUTOINCREMENT START 1 INCREMENT 1,
    name VARCHAR(50),
    type VARCHAR(20),
    ch_rating NUMBER,
    hp INT,
    ac INT,
    size VARCHAR(20), -- because size in DND is only small, medium, large, ect
    speed INT
);


---- Populate tables with data

INSERT INTO characters (player_name, character_name, race, class, level, speed, ac, hp, str, dex, con, intl, wis, char, spellcaster) VALUES
    ('Noah Bennett', 'Thorin Bright', 'Elf', 'Barbarian', 4, 35, 19, 118, 13, 10, 15, 16, 18, 15, FALSE),
    ('Aria Coleman', 'Thorin Bright', 'Elf', 'Druid', 5, 30, 13, 11, 14, 18, 11, 18, 14, 12, TRUE),
    ('Jack Russell', 'Mira Bright', 'Gnome', 'Paladin', 11, 35, 12, 115, 8, 13, 13, 10, 10, 14, TRUE),
    ('Mason Wright', 'Lyra Bright', 'Elf', 'Druid', 19, 25, 12, 68, 14, 9, 13, 8, 16, 15, TRUE),
    ('Scarlett Webb', 'Zara Night', 'Elf', 'Cleric', 12, 30, 19, 47, 13, 15, 12, 17, 16, 9, TRUE),
    ('Grace Turner', 'Kael Wind', 'Dwarf', 'Druid', 5, 35, 13, 113, 16, 17, 11, 9, 17, 12, TRUE),
    ('Daniel Holland', 'Zara Iron', 'Halfling', 'Ranger', 15, 35, 14, 116, 18, 17, 17, 8, 10, 14, TRUE),
    ('Henry Simmons', 'Nira Ash', 'Halfling', 'Paladin', 18, 35, 10, 109, 18, 8, 9, 17, 9, 11, TRUE),
    ('Mason Wright', 'Dain Iron', 'Tiefling', 'Druid', 4, 35, 15, 12, 16, 18, 9, 15, 17, 9, TRUE),
    ('Zoe Barrett', 'Zara Wind', 'Elf', 'Cleric', 4, 25, 18, 116, 13, 13, 9, 8, 9, 18, TRUE),
    ('Lily Perry', 'Seren Moon', 'Tiefling', 'Barbarian', 20, 30, 11, 24, 14, 12, 12, 8, 17, 13, FALSE),
    ('Henry Simmons', 'Finn Moon', 'Gnome', 'Paladin', 9, 25, 20, 102, 17, 13, 14, 9, 11, 18, TRUE),
    ('Ava Johnson', 'Nira Iron', 'Human', 'Druid', 1, 35, 14, 75, 14, 17, 14, 12, 17, 15, TRUE),
    ('Daniel Holland', 'Seren Bright', 'Half-Orc', 'Monk', 3, 30, 19, 22, 8, 12, 18, 16, 12, 12, FALSE),
    ('Evelyn Brooks', 'Kael Iron', 'Dwarf', 'Wizard', 3, 25, 14, 118, 9, 9, 16, 18, 16, 10, TRUE),
    ('Elijah Foster', 'Thorin Ash', 'Tiefling', 'Rogue', 8, 25, 19, 113, 11, 13, 14, 12, 14, 8, FALSE),
    ('Evelyn Brooks', 'Rurik Iron', 'Halfling', 'Ranger', 17, 25, 16, 103, 15, 16, 9, 9, 12, 9, TRUE),
    ('Jack Russell', 'Finn Flame', 'Half-Orc', 'Barbarian', 6, 25, 20, 25, 12, 14, 17, 17, 16, 17, FALSE),
    ('Zoe Barrett', 'Zara Ash', 'Half-Orc', 'Monk', 20, 35, 10, 15, 14, 9, 17, 10, 12, 18, FALSE),
    ('Daniel Holland', 'Lyra Ash', 'Dragonborn', 'Wizard', 14, 35, 10, 10, 10, 10, 16, 14, 13, 9, TRUE),
    ('Lucas Reed', 'Dain Storm', 'Gnome', 'Barbarian', 16, 25, 18, 29, 14, 13, 10, 9, 17, 12, FALSE),
    ('Benjamin Ward', 'Thorin Ash', 'Elf', 'Barbarian', 13, 30, 13, 50, 8, 9, 18, 13, 15, 14, FALSE),
    ('Scarlett Webb', 'Zara Bright', 'Dwarf', 'Cleric', 14, 30, 17, 77, 10, 8, 15, 12, 13, 15, TRUE),
    ('Elijah Foster', 'Lyra Dawn', 'Human', 'Warlock', 17, 25, 15, 109, 18, 10, 10, 11, 17, 11, TRUE),
    ('Sophia Murphy', 'Mira Wind', 'Halfling', 'Bard', 11, 30, 19, 77, 12, 8, 17, 9, 18, 11, TRUE),
    ('Scarlett Webb', 'Thorin Dawn', 'Human', 'Wizard', 15, 25, 17, 24, 11, 17, 14, 11, 8, 14, TRUE),
    ('Sophia Murphy', 'Lyra Night', 'Dragonborn', 'Bard', 18, 30, 17, 21, 13, 11, 11, 10, 13, 10, TRUE),
    ('Caleb Greene', 'Seren Night', 'Dragonborn', 'Druid', 1, 25, 13, 71, 17, 18, 9, 9, 13, 16, TRUE),
    ('Mason Wright', 'Thorin Night', 'Half-Elf', 'Paladin', 4, 35, 20, 119, 14, 16, 8, 9, 13, 18, TRUE),
    ('Chloe Hayes', 'Zara Dawn', 'Halfling', 'Warlock', 7, 30, 20, 91, 12, 18, 10, 16, 8, 8, TRUE);

INSERT INTO players (name, can_dm) VALUES
    ('Ava Johnson', FALSE),
    ('Liam Carter', FALSE),
    ('Evelyn Brooks', TRUE),
    ('Noah Bennett', FALSE),
    ('Isla Mitchell', FALSE),
    ('Mason Wright', FALSE),
    ('Aria Coleman', TRUE),
    ('Lucas Reed', FALSE),
    ('Chloe Hayes', FALSE),
    ('Elijah Foster', FALSE),
    ('Grace Turner', FALSE),
    ('Benjamin Ward', TRUE),
    ('Sophia Murphy', FALSE),
    ('Henry Simmons', FALSE),
    ('Lily Perry', FALSE),
    ('Jack Russell', FALSE),
    ('Scarlett Webb', FALSE),
    ('Daniel Holland', FALSE),
    ('Zoe Barrett', FALSE),
    ('Caleb Greene', TRUE);

    -- spell casters here

INSERT INTO races (race_name, size, speed) VALUES
    ('Human', 'Medium', 30),
    ('Elf', 'Medium', 30),
    ('Dwarf', 'Medium', 25),
    ('Halfling', 'Small', 25),
    ('Dragonborn', 'Medium', 30),
    ('Gnome', 'Small', 25),
    ('Half-Elf', 'Medium', 30),
    ('Half-Orc', 'Medium', 30),
    ('Tiefling', 'Medium', 30);

INSERT INTO monsters (name, type, ch_rating, hp, ac, size, speed) VALUES
    ('Goblin', 'humanoid', 0.25, 7, 15, 'Small', 30),
    ('Orc', 'humanoid', 0.5, 15, 13, 'Medium', 30),
    ('Owlbear', 'monstrosity', 3, 59, 13, 'Large', 40),
    ('Young Red Dragon', 'dragon', 10, 178, 18, 'Large', 40),
    ('Zombie', 'undead', 0.25, 22, 8, 'Medium', 20),
    ('Kobold', 'humanoid', 0.125, 5, 12, 'Small', 30),
    ('Troll', 'giant', 5, 84, 15, 'Large', 30),
    ('Gelatinous Cube', 'ooze', 2, 84, 6, 'Large', 15),
    ('Banshee', 'undead', 4, 58, 12, 'Medium', 0),
    ('Beholder', 'aberration', 13, 180, 18, 'Large', 0),
    ('Deva', 'celestial', 10, 136, 17, 'Medium', 30),
    ('Succubus', 'fiend', 4, 66, 15, 'Medium', 30),
    ('Treant', 'plant', 9, 138, 16, 'Huge', 30),
    ('Unicorn', 'celestial', 5, 67, 12, 'Large', 50),
    ('Dryad', 'fey', 1, 22, 11, 'Medium', 30);


INSERT INTO spell_slot_progression (class, level, highest_spell_level, slots_1, slots_2, slots_3, slots_4, slots_5, slots_6, slots_7, slots_8, slots_9) VALUES
-- Wizards
    ('Wizard', 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Wizard', 2, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Wizard', 3, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0),
    ('Wizard', 4, 2, 4, 3, 0, 0, 0, 0, 0, 0, 0),
    ('Wizard', 5, 3, 4, 3, 2, 0, 0, 0, 0, 0, 0),
    ('Wizard', 6, 3, 4, 3, 3, 0, 0, 0, 0, 0, 0),
    ('Wizard', 7, 4, 4, 3, 3, 1, 0, 0, 0, 0, 0),
    ('Wizard', 8, 4, 4, 3, 3, 2, 0, 0, 0, 0, 0),
    ('Wizard', 9, 5, 4, 3, 3, 3, 1, 0, 0, 0, 0),
    ('Wizard', 10, 5, 4, 3, 3, 3, 2, 0, 0, 0, 0),
    ('Wizard', 11, 6, 4, 3, 3, 3, 2, 1, 0, 0, 0),
    ('Wizard', 12, 6, 4, 3, 3, 3, 2, 1, 0, 0, 0),
    ('Wizard', 13, 7, 4, 3, 3, 3, 2, 1, 1, 0, 0),
    ('Wizard', 14, 7, 4, 3, 3, 3, 2, 1, 1, 0, 0),
    ('Wizard', 15, 8, 4, 3, 3, 3, 2, 1, 1, 1, 0),
    ('Wizard', 16, 8, 4, 3, 3, 3, 2, 1, 1, 1, 0),
    ('Wizard', 17, 9, 4, 3, 3, 3, 2, 1, 1, 1, 1),
    ('Wizard', 18, 9, 4, 3, 3, 3, 3, 1, 1, 1, 1),
    ('Wizard', 19, 9, 4, 3, 3, 3, 3, 2, 1, 1, 1),
    ('Wizard', 20, 9, 4, 3, 3, 3, 3, 2, 2, 1, 1),
-- Clerics
    ('Cleric', 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Cleric', 2, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Cleric', 3, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0),
    ('Cleric', 4, 2, 4, 3, 0, 0, 0, 0, 0, 0, 0),
    ('Cleric', 5, 3, 4, 3, 2, 0, 0, 0, 0, 0, 0),
    ('Cleric', 6, 3, 4, 3, 3, 0, 0, 0, 0, 0, 0),
    ('Cleric', 7, 4, 4, 3, 3, 1, 0, 0, 0, 0, 0),
    ('Cleric', 8, 4, 4, 3, 3, 2, 0, 0, 0, 0, 0),
    ('Cleric', 9, 5, 4, 3, 3, 3, 1, 0, 0, 0, 0),
    ('Cleric', 10, 5, 4, 3, 3, 3, 2, 0, 0, 0, 0),
    ('Cleric', 11, 6, 4, 3, 3, 3, 2, 1, 0, 0, 0),
    ('Cleric', 12, 6, 4, 3, 3, 3, 2, 1, 0, 0, 0),
    ('Cleric', 13, 7, 4, 3, 3, 3, 2, 1, 1, 0, 0),
    ('Cleric', 14, 7, 4, 3, 3, 3, 2, 1, 1, 0, 0),
    ('Cleric', 15, 8, 4, 3, 3, 3, 2, 1, 1, 1, 0),
    ('Cleric', 16, 8, 4, 3, 3, 3, 2, 1, 1, 1, 0),
    ('Cleric', 17, 9, 4, 3, 3, 3, 2, 1, 1, 1, 1),
    ('Cleric', 18, 9, 4, 3, 3, 3, 3, 1, 1, 1, 1),
    ('Cleric', 19, 9, 4, 3, 3, 3, 3, 2, 1, 1, 1),
    ('Cleric', 20, 9, 4, 3, 3, 3, 3, 2, 2, 1, 1),
-- Druids
    ('Druid', 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Druid', 2, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Druid', 3, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0),
    ('Druid', 4, 2, 4, 3, 0, 0, 0, 0, 0, 0, 0),
    ('Druid', 5, 3, 4, 3, 2, 0, 0, 0, 0, 0, 0),
    ('Druid', 6, 3, 4, 3, 3, 0, 0, 0, 0, 0, 0),
    ('Druid', 7, 4, 4, 3, 3, 1, 0, 0, 0, 0, 0),
    ('Druid', 8, 4, 4, 3, 3, 2, 0, 0, 0, 0, 0),
    ('Druid', 9, 5, 4, 3, 3, 3, 1, 0, 0, 0, 0),
    ('Druid', 10, 5, 4, 3, 3, 3, 2, 0, 0, 0, 0),
    ('Druid', 11, 6, 4, 3, 3, 3, 2, 1, 0, 0, 0),
    ('Druid', 12, 6, 4, 3, 3, 3, 2, 1, 0, 0, 0),
    ('Druid', 13, 7, 4, 3, 3, 3, 2, 1, 1, 0, 0),
    ('Druid', 14, 7, 4, 3, 3, 3, 2, 1, 1, 0, 0),
    ('Druid', 15, 8, 4, 3, 3, 3, 2, 1, 1, 1, 0),
    ('Druid', 16, 8, 4, 3, 3, 3, 2, 1, 1, 1, 0),
    ('Druid', 17, 9, 4, 3, 3, 3, 2, 1, 1, 1, 1),
    ('Druid', 18, 9, 4, 3, 3, 3, 3, 1, 1, 1, 1),
    ('Druid', 19, 9, 4, 3, 3, 3, 3, 2, 1, 1, 1),
    ('Druid', 20, 9, 4, 3, 3, 3, 3, 2, 2, 1, 1),
-- Paladins
    ('Paladin', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Paladin', 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Paladin', 3, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Paladin', 4, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Paladin', 5, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0),
    ('Paladin', 6, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0),
    ('Paladin', 7, 2, 4, 3, 0, 0, 0, 0, 0, 0, 0),
    ('Paladin', 8, 2, 4, 3, 0, 0, 0, 0, 0, 0, 0),
    ('Paladin', 9, 3, 4, 3, 2, 0, 0, 0, 0, 0, 0),
    ('Paladin', 10, 3, 4, 3, 2, 0, 0, 0, 0, 0, 0),
    ('Paladin', 11, 3, 4, 3, 3, 0, 0, 0, 0, 0, 0),
    ('Paladin', 12, 3, 4, 3, 3, 0, 0, 0, 0, 0, 0),
    ('Paladin', 13, 4, 4, 3, 3, 1, 0, 0, 0, 0, 0),
    ('Paladin', 14, 4, 4, 3, 3, 1, 0, 0, 0, 0, 0),
    ('Paladin', 15, 4, 4, 3, 3, 2, 0, 0, 0, 0, 0),
    ('Paladin', 16, 4, 4, 3, 3, 2, 0, 0, 0, 0, 0),
    ('Paladin', 17, 5, 4, 3, 3, 3, 1, 0, 0, 0, 0),
    ('Paladin', 18, 5, 4, 3, 3, 3, 1, 0, 0, 0, 0),
    ('Paladin', 19, 5, 4, 3, 3, 3, 2, 0, 0, 0, 0),
    ('Paladin', 20, 5, 4, 3, 3, 3, 2, 0, 0, 0, 0),
-- Rangers
    ('Ranger', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Ranger', 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Ranger', 3, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Ranger', 4, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Ranger', 5, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0),
    ('Ranger', 6, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0),
    ('Ranger', 7, 2, 4, 3, 0, 0, 0, 0, 0, 0, 0),
    ('Ranger', 8, 2, 4, 3, 0, 0, 0, 0, 0, 0, 0),
    ('Ranger', 9, 3, 4, 3, 2, 0, 0, 0, 0, 0, 0),
    ('Ranger', 10, 3, 4, 3, 2, 0, 0, 0, 0, 0, 0),
    ('Ranger', 11, 3, 4, 3, 3, 0, 0, 0, 0, 0, 0),
    ('Ranger', 12, 3, 4, 3, 3, 0, 0, 0, 0, 0, 0),
    ('Ranger', 13, 4, 4, 3, 3, 1, 0, 0, 0, 0, 0),
    ('Ranger', 14, 4, 4, 3, 3, 1, 0, 0, 0, 0, 0),
    ('Ranger', 15, 4, 4, 3, 3, 2, 0, 0, 0, 0, 0),
    ('Ranger', 16, 4, 4, 3, 3, 2, 0, 0, 0, 0, 0),
    ('Ranger', 17, 5, 4, 3, 3, 3, 1, 0, 0, 0, 0),
    ('Ranger', 18, 5, 4, 3, 3, 3, 1, 0, 0, 0, 0),
    ('Ranger', 19, 5, 4, 3, 3, 3, 2, 0, 0, 0, 0),
    ('Ranger', 20, 5, 4, 3, 3, 3, 2, 0, 0, 0, 0),
-- Warlocks
    ('Warlock', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 3, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 4, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 5, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 6, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 7, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 8, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 9, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 10, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 11, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 12, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 13, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 14, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 15, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 16, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 17, 5, 4, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 18, 5, 4, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 19, 5, 4, 0, 0, 0, 0, 0, 0, 0, 0),
    ('Warlock', 20, 5, 4, 0, 0, 0, 0, 0, 0, 0, 0);
    
INSERT INTO spellcasters (character_name, class, class_level,highest_spell_slot,slots_1, slots_2, slots_3, slots_4, slots_5,slots_6, slots_7, slots_8, slots_9)
    SELECT
        c.character_name, c.class, c.level,
        ssp.highest_spell_level,
        ssp.slots_1, ssp.slots_2, ssp.slots_3, ssp.slots_4, ssp.slots_5,
        ssp.slots_6, ssp.slots_7, ssp.slots_8, ssp.slots_9
    FROM characters AS c
    INNER JOIN spell_slot_progression AS ssp
    ON ssp.class = c.class AND ssp.level = c.level
    WHERE c.spellcaster = TRUE;