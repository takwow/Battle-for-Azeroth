-- Template Updates
-- Glubtok
UPDATE `creature_template` SET `scriptname`= 'boss_glubtok' WHERE `entry`= 47162;
UPDATE `creature_template` SET `minlevel`=87, `maxlevel`=87 WHERE `entry`=48936;
-- General Purpose Bunny JMF Look 2
UPDATE `creature_template` SET `InhabitType`= 4 WHERE `entry`= 47242;
-- General Purpose Bunny JMF
UPDATE `creature_template` SET `InhabitType`= 4 WHERE `entry`= 45979;
-- Glubtok Firewall Platter
UPDATE `creature_template` SET `InhabitType`= 4 WHERE `entry`= 48974;

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID`= 47162;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `Comment`) VALUES
(47162, 0, 0, 'Glubtok show you da power of de arcane!', 14, 0, 100, 0, 0, 21151, 47256, 'Glubtok to Player'),
(47162, 1, 0, 'Fists of flame!', 14, 0, 100, 0, 0, 21153, 47239, 'Glubtok'),
(47162, 2, 0, 'Fists of frost!', 14, 0, 100, 0, 0, 21156, 47238, 'Glubtok'),
(47162, 3, 0, 'Glubtok ready?', 14, 0, 100, 1, 0, 21154, 47361, 'Glubtok'),
(47162, 4, 0, 'Let''s do it!', 14, 0, 100, 15, 0, 21157, 47362, 'Glubtok'),
(47162, 5, 0, 'ARCANE POWER!!!', 14, 0, 100, 15, 0, 21146, 47363, 'Glubtok'),
(47162, 6, 0, '|TInterface\\Icons\\spell_holy_innerfire.blp:20|t Glubtok creates a moving |cFFFF0000|Hspell:91398|h[Fire Wall]|h|r!', 41, 0, 100, 0, 0, 0, 49155, 'Glubtok'),
(47162, 7, 0, 'TOO...MUCH...POWER!!!', 14, 0, 100, 15, 0, 21145, 47422, 'Glubtok');

-- Conditions
DELETE FROM `conditions` WHERE `SourceEntry` IN (88072, 88093) AND `SourceTypeOrReferenceId`= 13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 88072, 0, 0, 31, 0, 3, 47162, 0, 0, 0, '', 'Arcane Fire Beam - Target Glubtok'),
(13, 1, 88093, 0, 0, 31, 0, 3, 47162, 0, 0, 0, '', 'Arcane Frost Beam - Target Glubtok');

-- Spells
DELETE FROM `spell_proc` WHERE `SpellId` IN (87900, 87897);
INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `Cooldown`) VALUES
(87900, 0x00000004, 1, 0, 4000),
(87897, 0x00000004, 1, 0, 4000);

-- Spellclick spells
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (48974, 48975, 49039, 49040);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(48974, 46598, 1, 1),
(48975, 47020, 1, 1),
(49039, 47020, 1, 1),
(49040, 47020, 1, 1);

-- Vehicle Accessory
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (48974, 48975, 49039, 49040);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(48974, 48975, 0, 1, 'Glubtok Firewall Platter', 5, 0),
(48974, 49039, 1, 1, 'Glubtok Firewall Platter', 5, 0),
(48974, 49040, 2, 1, 'Glubtok Firewall Platter', 5, 0),
(48974, 49040, 3, 1, 'Glubtok Firewall Platter', 5, 0),
(48974, 48975, 4, 1, 'Glubtok Firewall Platter', 5, 0),
(48974, 49039, 5, 1, 'Glubtok Firewall Platter', 5, 0),
(48974, 49040, 6, 1, 'Glubtok Firewall Platter', 5, 0),
(48974, 49040, 7, 1, 'Glubtok Firewall Platter', 5, 0),
(49040, 49042, 5, 1, 'Glubtok Firewall Platter Creature Level 1c - Glubtok Firewall Platter Creature Level 2c', 5, 0), -- Glubtok Firewall Platter Creature Level 1c - Glubtok Firewall Platter Creature Level 2c
(49040, 49042, 4, 1, 'Glubtok Firewall Platter Creature Level 1c - Glubtok Firewall Platter Creature Level 2c', 5, 0), -- Glubtok Firewall Platter Creature Level 1c - Glubtok Firewall Platter Creature Level 2c
(49040, 49042, 1, 1, 'Glubtok Firewall Platter Creature Level 1c - Glubtok Firewall Platter Creature Level 2c', 5, 0), -- Glubtok Firewall Platter Creature Level 1c - Glubtok Firewall Platter Creature Level 2c
(49040, 49042, 0, 1, 'Glubtok Firewall Platter Creature Level 1c - Glubtok Firewall Platter Creature Level 2c', 5, 0), -- Glubtok Firewall Platter Creature Level 1c - Glubtok Firewall Platter Creature Level 2c
(49039, 49041, 5, 1, 'Glubtok Firewall Platter Creature Level 1b - Glubtok Firewall Platter Creature Level 2b', 5, 0), -- Glubtok Firewall Platter Creature Level 1b - Glubtok Firewall Platter Creature Level 2b
(49039, 49041, 4, 1, 'Glubtok Firewall Platter Creature Level 1b - Glubtok Firewall Platter Creature Level 2b', 5, 0), -- Glubtok Firewall Platter Creature Level 1b - Glubtok Firewall Platter Creature Level 2b
(49039, 49041, 1, 1, 'Glubtok Firewall Platter Creature Level 1b - Glubtok Firewall Platter Creature Level 2b', 5, 0), -- Glubtok Firewall Platter Creature Level 1b - Glubtok Firewall Platter Creature Level 2b
(49039, 49041, 0, 1, 'Glubtok Firewall Platter Creature Level 1b - Glubtok Firewall Platter Creature Level 2b', 5, 0), -- Glubtok Firewall Platter Creature Level 1b - Glubtok Firewall Platter Creature Level 2b
(48975, 48976, 5, 1, 'Glubtok Firewall Platter Creature Level 1a - Glubtok Firewall Platter Creature Level 2a', 5, 0), -- Glubtok Firewall Platter Creature Level 1a - Glubtok Firewall Platter Creature Level 2a
(48975, 48976, 4, 1, 'Glubtok Firewall Platter Creature Level 1a - Glubtok Firewall Platter Creature Level 2a', 5, 0), -- Glubtok Firewall Platter Creature Level 1a - Glubtok Firewall Platter Creature Level 2a
(48975, 48976, 1, 1, 'Glubtok Firewall Platter Creature Level 1a - Glubtok Firewall Platter Creature Level 2a', 5, 0), -- Glubtok Firewall Platter Creature Level 1a - Glubtok Firewall Platter Creature Level 2a
(48975, 48976, 0, 1, 'Glubtok Firewall Platter Creature Level 1a - Glubtok Firewall Platter Creature Level 2a', 5, 0); -- Glubtok Firewall Platter Creature Level 1a - Glubtok Firewall Platter Creature Level 2a

DELETE FROM `spell_script_names` WHERE `ScriptName`= 'spell_glubtok_blossom_targeting';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(88140, 'spell_glubtok_blossom_targeting');

-- Creature Fire Blossom 48957 SAI
SET @ENTRY := 48957;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 18, 30, 0, 0, 0, 0, 0, 0, "On just summoned - Self: Attack Players in 30 yards // ");

-- Creature Frost Blossom 48957 SAI
SET @ENTRY := 48958;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 18, 30, 0, 0, 0, 0, 0, 0, "On just summoned - Self: Attack Players in 30 yards // ");

-- Currency Loot
DELETE FROM `creature_onkill_reward` WHERE `creature_id`= 48936;
INSERT INTO `creature_onkill_reward` (`creature_id`, `CurrencyId1`, `CurrencyCount1`) VALUES
(48936, 395, 7000);

-- Loot
UPDATE creature_template SET `lootid`= 47162 WHERE `entry`= 47162;
DELETE FROM creature_loot_template WHERE `entry` IN (47162, 48936);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(47162, 5195, 0, 1, 1, 1, 1),
(47162, 2169, 0, 1, 1, 1, 1),
(47162, 5194, 0, 1, 1, 1, 1);

UPDATE creature_template SET `lootid`= 48936 WHERE `entry`= 48936;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(48936, 63467, 0, 1, 1, 1, 1),
(48936, 63468, 0, 1, 1, 1, 1),
(48936, 63471, 0, 1, 1, 1, 1),
(48936, 63470, 0, 1, 1, 1, 1),
(48936, 65163, 0, 1, 1, 1, 1);

-- Template Updates
-- Helix Gearbreaker
UPDATE `creature_template` SET `scriptname`= 'boss_helix_gearbreaker', `flags_extra`= 0 WHERE `entry`= 47296;
UPDATE `creature_template` SET `flags_extra`= `flags_extra`|1, `DamageModifier`= 15 WHERE `entry`= 48940;
-- Lumbering Oaf
UPDATE `creature_template` SET `scriptname`= 'npc_helix_lumbering_oaf' WHERE `entry`= 47297;
UPDATE `creature_template` SET `minlevel`= 87, `maxlevel`= 87 WHERE `entry`= 48939;
-- Sticky Bomb
UPDATE `creature_template` SET `difficulty_entry_1`= 49134, `scriptname`= 'npc_helix_sticky_bomb' WHERE `entry`= 47314;
UPDATE `creature_template` SET `minlevel`= 85, `maxlevel`= 85, `faction`= 14, `unit_flags`= 33554432 WHERE `entry`= 49134;
-- Helix' Crew
UPDATE `creature_template` SET `scriptname`= 'npc_helix_crew' WHERE `entry`= 49139;

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID` IN (47296, 47297, 49139);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `Comment`) VALUES
-- Helix Gearbreaker
(47296, 0, 0, 'The mistress will pay me handsomely for your heads!', 14, 0, 100, 0, 0, 20849, 47474, 'Helix Gearbreaker - Aggro'),
(47296, 1, 0, 'Bombs away!', 14, 0, 100, 0, 0, 20847, 47475, 'Helix Gearbreaker - Bomb'),
(47296, 2, 0, 'Ready Oafie? Throw!', 14, 0, 100, 0, 0, 20848, 47476, 'Helix Gearbreaker - Throw Helix'),
(47296, 3, 0, 'Helix attaches a bomb to $n''s chest!', 41, 0, 100, 0, 0, 0, 47544, 'Helix Gearbreaker - Announce Bomb'),
(47296, 4, 0, 'I didn''t need him! Not when I''ve got YOU oafs!', 14, 0, 100, 0, 0, 20846, 47573, 'Helix Gearbreaker - Oaf Death'),
(47296, 5, 0, 'Only ten copper? You''re not even worth killing!', 14, 0, 100, 0, 0, 20845, 47574, 'Helix Gearbreaker - Slay'),
(47296, 6, 0, 'The scales...have...tipped...', 14, 0, 100, 0, 0, 20844, 47575, 'Helix Gearbreaker - Death'),
(47297, 0, 1, 'No...NO!', 14, 0, 100, 0, 0, 20854, 47480, 'Lumbering Oaf to Helix Gearbreaker'),
(47297, 1, 2, 'OAF SMASH!!', 14, 0, 100, 0, 0, 0, 48117, 'Lumbering Oaf to Helix Gearbreaker'),
(49139, 0, 0, 'Blowin'' em'' to bits, boss!', 12, 0, 100, 0, 0, 0, 49191, 'Helix Crew - Throw Bomb');

-- Spells
DELETE FROM `spell_script_names` WHERE `ScriptName` IN
('spell_helix_throw_bomb_targeting',
'spell_helix_sticky_bomb_periodic_trigger',
'spell_helix_explode',
'spell_helix_oaf_grab_targeting',
'spell_helix_force_player_to_ride_oaf',
'spell_helix_oaf_smash',
'spell_helix_ride_face_targeting',
'spell_helix_ride_vehicle',
'spell_helix_ride_face_timer_aura',
'spell_helix_chest_bomb_emote',
'spell_helix_chest_bomb');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(88268, 'spell_helix_throw_bomb_targeting'),
(88329, 'spell_helix_sticky_bomb_periodic_trigger'),
(88321, 'spell_helix_explode'),
(91567, 'spell_helix_explode'),
(88974, 'spell_helix_explode'),
(91566, 'spell_helix_explode'),
(88289, 'spell_helix_oaf_grab_targeting'),
(88278, 'spell_helix_force_player_to_ride_oaf'),
(88300, 'spell_helix_oaf_smash'),
(91568, 'spell_helix_oaf_smash'),
(88349, 'spell_helix_ride_face_targeting'),
(88360, 'spell_helix_ride_vehicle'),
(88351, 'spell_helix_ride_face_timer_aura'),
(91572, 'spell_helix_chest_bomb_emote'),
(88352, 'spell_helix_chest_bomb');

-- Conditions
DELETE FROM `conditions` WHERE `SourceEntry`= 88295 AND `SourceTypeOrReferenceId`= 13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 88295, 0, 0, 31, 0, 3, 45979, 0, 0, 0, '', 'Charge - Target General Purpose Bunny'),
(13, 1, 88295, 0, 0, 35, 0, 1, 20, 3, 0, 0, '', 'Charge - Target Distance Must be Higher than 15 yards');

-- Loot
UPDATE `creature_template` SET  `lootid`= 47296 WHERE `entry`= 47296;
UPDATE `creature_template` SET `lootid`= 48940 WHERE `entry`= 48940;
DELETE FROM `creature_loot_template` WHERE `Entry` IN (47296, 48940);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(47296, 5199, 0, 1, 1, 1, 1),
(47296, 5191, 0, 1, 1, 1, 1),
(47296, 5200, 0, 1, 1, 1, 1),
(47296, 5443, 0, 1, 1, 1, 1);

INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(48940, 63473, 0, 1, 1, 1, 1),
(48940, 63475, 0, 1, 1, 1, 1),
(48940, 63476, 0, 1, 1, 1, 1),
(48940, 63474, 0, 1, 1, 1, 1),
(48940, 65164, 0, 1, 1, 1, 1);

-- Template Updates
-- Foe Reaper 5000
UPDATE `creature_template` SET `unit_flags2`= 0, `ScriptName`= 'boss_foe_reaper_5000' WHERE `entry`= 43778;
UPDATE `creature_template` SET `minlevel`= 87, `maxlevel`= 87, `unit_flags2`= 0, `flags_extra`= 1 WHERE `entry`= 48941;
-- Prototype Reaper
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1.142857, `spell1`= 91734, `spell2`= 91735, `spell3`= 91736, `unit_flags2`= 0 WHERE `entry`= 49208;
UPDATE `npc_spellclick_spells` SET `spell_id`= 43671 WHERE `npc_entry`= 49208;
-- Defias Watcher
UPDATE `creature_template` SET `unit_flags2`= 0, `RegenHealth`= 0, `ScriptName`= 'npc_deadmines_defias_watcher' WHERE `entry`= 47404;
UPDATE `creature_template` SET `unit_flags2`= 0, `RegenHealth`= 0 WHERE `entry`= 48803;
-- Defias Reaper
UPDATE `creature_template` SET `unit_flags2`= 0, `ScriptName`= 'npc_deadmines_defias_watcher' WHERE `entry`= 47403;
UPDATE `creature_template` SET `unit_flags2`= 0 WHERE `entry`= 48804;
-- Deadmines Foe Reaper Targeting Bunny
UPDATE `creature_template` SET `faction`= 35, `unit_flags`= 33554432, `flags_extra`= 128 WHERE `entry`= 47468;
-- Molten Slag
UPDATE `creature_template` SET `DamageModifier`= 30, `ScriptName`= 'npc_foe_reaper_5000_molten_slag' WHERE `entry`= 49229;


DELETE FROM `creature_text` WHERE `CreatureID` IN (43778, 45979);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `Comment`) VALUES
-- Foe Reaper 5000
(43778, 0, 0, 'Foe Reaper 5000 on-line.  All systems nominal.', 14, 0, 100, 0, 0, 22137, 47596, 'Foe Reaper 5000'),
(43778, 1, 0, '|TInterface\\Icons\\ability_whirlwind.blp:20|t Foe Reaper 5000 begins to activate |cFFFF0000|Hspell:88481|h[Overdrive]|h|r!', 41, 0, 100, 0, 0, 0, 48812, 'Foe Reaper 5000'),
(43778, 2, 0, 'Overdrive engine activated.', 14, 0, 100, 0, 0, 22142, 47609, 'Foe Reaper 5000'),
(43778, 3, 0, 'Acquiring target...', 14, 0, 100, 0, 0, 22140, 47628, 'Foe Reaper 5000 to Player'),
(43778, 4, 0, 'Target acquired.  Harvesting servos engaged.', 14, 0, 100, 0, 0, 22141, 47629, 'Foe Reaper 5000'),
(43778, 5, 0, 'Safety restrictions off-line.  Catastrophic system failure imminent.', 14, 0, 100, 0, 0, 22143, 47642, 'Foe Reaper 5000'),
(43778, 6, 0, '|TInterface\Icons\spell_fire_totemofwrath.blp:20|t Foe Reaper 5000 |cFFFF0000|Hspell:88522|h[Safety Restrictions are Off-line]|h|r!', 41, 0, 100, 0, 0, 0, 50713, 'Foe Reaper 5000'),
(43778, 7, 0, 'Target destroyed.', 14, 0, 100, 0, 0, 22139, 47630, 'Feindschnitter 5000 to Player'),
(43778, 8, 0, 'Overheat threshold exceeded.  System failure.  Wheat clog in port two.  Shutting down.', 14, 0, 100, 0, 0, 22138, 47643, 'Foe Reaper 5000'),
-- General Purpose Bunny
(45979, 0, 0, 'A stray jolt from the Foe Reaper has disrupted the foundry controls!', 41, 0, 100, 0, 0, 0, 49315, 'General Purpose Bunny JMF'),
(45979, 1, 0, 'The molten slag begins to bubble furiously!', 41, 0, 100, 0, 0, 0, 49316, 'General Purpose Bunny JMF');

-- Template Addon
DELETE FROM `creature_template_addon` WHERE `entry`= 47468;
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(47468, 88508);

-- Conditions
DELETE FROM `conditions` WHERE `SourceEntry` IN (89132, 91839, 91841, 91842, 91843) AND `SourceTypeOrReferenceId`= 13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 89132, 0, 0, 31, 0, 3, 43778, 0, 0, 0, '', 'Energize - Target Foe Reaper 5000'),
(13, 1, 91839, 0, 0, 31, 0, 5, 123207, 0, 0, 0, '', 'Summon Molten Slag - Target Goblin Smelthing Pot'),
(13, 1, 91841, 0, 0, 31, 0, 5, 123208, 0, 0, 0, '', 'Summon Molten Slag - Target Goblin Smelthing Pot'),
(13, 1, 91842, 0, 0, 31, 0, 5, 123209, 0, 0, 0, '', 'Summon Molten Slag - Target Goblin Smelthing Pot'),
(13, 1, 91843, 0, 0, 31, 0, 5, 123210, 0, 0, 0, '', 'Summon Molten Slag - Target Goblin Smelthing Pot');

-- Spells
DELETE FROM `spell_script_names` WHERE `ScriptName` IN
('spell_deadmines_on_fire',
'spell_foe_reaper_5000_acquire_target',
'spell_foe_reaper_5000_fixate_targeting',
'spell_foe_reaper_5000_fixate');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(91737, 'spell_deadmines_on_fire'),
(88492, 'spell_foe_reaper_5000_acquire_target'),
(91831, 'spell_foe_reaper_5000_fixate_targeting'),
(91830, 'spell_foe_reaper_5000_fixate');

-- Loot
UPDATE `creature_template` SET `lootid`= 43778 WHERE `entry` = 43778;
DELETE FROM creature_loot_template WHERE `Entry` IN (43778, 48941);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(43778, 1937, 0, 1, 1, 1, 1),
(43778, 5187, 0, 1, 1, 1, 1),
(43778, 5201, 0, 1, 1, 1, 1);

UPDATE `creature_template` SET `lootid` = 48941 WHERE `entry` = 48941;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(48941, 65166, 0, 1, 1, 1, 1),
(48941, 65165, 0, 1, 1, 1, 1),
(48941, 65167, 0, 1, 1, 1, 1);

-- SAI
-- Creature General Purpose Bunny JMF (Look 2) 47242 SAI
SET @ENTRY := 47242;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
SET @ENTRY := -375839;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 72, 0, 100, 0, 1, 0, 0, 0, 67, 0, 150, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "On DoAction 1 - Trigger timed event #0"),
(@ENTRY, 0, 1, 0, 59, 0, 100, 1, 0, 0, 0, 0, 11, 89202, 2, 0, 0, 0, 0, 10, 375842, 0, 0, 0, 0, 0, 0, "On timed event 0 triggered - Self: Cast spell 89202 on Creature General Purpose Bunny JMF (Look 2)");

SET @ENTRY := -375846;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 72, 0, 100, 0, 1, 0, 0, 0, 67, 0, 2500, 2500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "On DoAction 1 - Trigger timed event #0"),
(@ENTRY, 0, 1, 0, 59, 0, 100, 1, 0, 0, 0, 0, 11, 89202, 2, 0, 0, 0, 0, 10, 375841, 0, 0, 0, 0, 0, 0, "On timed event 0 triggered - Self: Cast spell 89202 on Creature General Purpose Bunny JMF (Look 2)");

SET @ENTRY := -375922;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 72, 0, 100, 0, 1, 0, 0, 0, 67, 0, 2500, 2500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "On DoAction 1 - Trigger timed event #0"),
(@ENTRY, 0, 1, 0, 59, 0, 100, 1, 0, 0, 0, 0, 11, 89202, 2, 0, 0, 0, 0, 10, 375840, 0, 0, 0, 0, 0, 0, "On timed event 0 triggered - Self: Cast spell 89202 on Creature General Purpose Bunny JMF (Look 2)");

SET @ENTRY := -375844;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 72, 0, 100, 0, 1, 0, 0, 0, 67, 0, 5000, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "On DoAction 1 - Trigger timed event #0"),
(@ENTRY, 0, 1, 0, 59, 0, 100, 1, 0, 0, 0, 0, 11, 89202, 2, 0, 0, 0, 0, 10, 375923, 0, 0, 0, 0, 0, 0, "On timed event 0 triggered - Self: Cast spell 89202 on Creature General Purpose Bunny JMF (Look 2)");

SET @ENTRY := -375843;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 72, 0, 100, 0, 1, 0, 0, 0, 67, 0, 5000, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "On DoAction 1 - Trigger timed event #0"),
(@ENTRY, 0, 1, 0, 59, 0, 100, 1, 0, 0, 0, 0, 11, 89202, 2, 0, 0, 0, 0, 10, 375848, 0, 0, 0, 0, 0, 0, "On timed event 0 triggered - Self: Cast spell 89202 on Creature General Purpose Bunny JMF (Look 2)");

SET @ENTRY := -375847;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 72, 0, 100, 0, 1, 0, 0, 0, 67, 0, 5000, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "On DoAction 1 - Trigger timed event #0"),
(@ENTRY, 0, 1, 0, 59, 0, 100, 1, 0, 0, 0, 0, 11, 89202, 2, 0, 0, 0, 0, 10, 375921, 0, 0, 0, 0, 0, 0, "On timed event 0 triggered - Self: Cast spell 89202 on Creature General Purpose Bunny JMF (Look 2)");

UPDATE `gameobject_template` SET `ScriptName`= 'go_deadmines_defias_cannon' WHERE `entry`= 16398;

DELETE FROM `creature_text` WHERE `CreatureID`= 45979 AND `GroupID`= 2;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `Comment`) VALUES
(45979, 2, 0, 'The cannon was rigged with an explosive trap!', 41, 0, 100, 0, 0, 0, 48790, 'General Purpose Bunny JMF to Player');

-- Template Updates
-- Admiral Ripsnarl
UPDATE `creature_template` SET `ScriptName`= 'boss_admiral_ripsnarl' WHERE `entry`= 47626;
UPDATE `creature_template` SET `minlevel`= 87, `maxlevel`= 87, `DamageModifier`= 30, `flags_extra`= 1 WHERE `entry`= 48943;
-- Vapor
UPDATE `creature_template` SET `minlevel`= 15, `maxlevel`= 15, `difficulty_entry_1`= 49241, `ScriptName`= 'npc_ripsnarl_vapor' WHERE `entry`= 47714;
UPDATE `creature_template` SET `minlevel`= 87, `maxlevel`= 87, `faction`= 14, `DamageModifier`= 10 WHERE `entry`= 49241;


-- Texts
DELETE FROM `creature_text` WHERE `CreatureID`= 47626;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `Comment`) VALUES
(47626, 0, 0, 'Ah, fresh meat!', 14, 0, 100, 0, 0, 19882, 48179, 'Admiral Ripsnarl - Aggro'),
(47626, 1, 0, 'Do you feel that chill running up your spine?', 14, 0, 100, 0, 0, 19877, 47914, 'Admiral Ripsnarl - Fog 1'),
(47626, 2, 0, 'The fog is rolling in...', 14, 0, 100, 0, 0, 0, 47915, 'Admiral Ripsnarl - Fog 2'),
(47626, 3, 0, 'Your blood only increases my hunger!', 14, 0, 100, 0, 0, 19876, 48009, 'Admiral Ripsnarl - Slay'),
(47626, 4, 0, 'I can smell your fear...', 14, 0, 100, 0, 0, 19879, 48006, 'Admiral Ripsnarl - Go for the Throat 1'),
(47626, 4, 1, 'I will rip your heart from your chest!', 14, 0, 100, 0, 0, 19880, 48007, 'Admiral Ripsnarl - Go for the Throat 2'),
(47626, 5, 0, 'Multiple vapors appear from the fog!  Kill Admiral Ripsnarl before you are overwhelmed!', 41, 0, 100, 0, 0, 19878, 50851, 'Admiral Ripsnarl - Announce Vapor'),
(47626, 6, 0, 'You will...NOT find her...until it is too late...', 14, 0, 100, 0, 0, 19875, 48010, 'Admiral Ripsnarl - Death');

-- Conditions
DELETE FROM `conditions` WHERE `SourceEntry` IN (95408) AND `SourceTypeOrReferenceId`= 13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 95408, 0, 0, 31, 0, 3, 48266, 0, 0, 0, '', 'Ripnsarl Cannon Kill - Target Defias Cannon');

-- Spells
DELETE FROM `spell_script_names` WHERE `ScriptName` IN
('spell_ripsnarl_go_for_the_throat_targeting',
'spell_ripsnarl_summon_vapor_targeting');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(88838, 'spell_ripsnarl_go_for_the_throat_targeting'),
(88833, 'spell_ripsnarl_summon_vapor_targeting');

-- Loot
UPDATE `creature_template` SET `lootid`= 47626 WHERE `entry` = 47626;
DELETE FROM creature_loot_template WHERE `Entry` IN (47626, 48943);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(47626, 1156, 0, 1, 1, 1, 1),
(47626, 5196, 0, 1, 1, 1, 1),
(47626, 872, 0, 1, 1, 1, 1);

UPDATE `creature_template` SET `lootid`= 48943 WHERE `entry` = 48943;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(48943, 65166, 0, 1, 1, 1, 1),
(48943, 65165, 0, 1, 1, 1, 1),
(48943, 65167, 0, 1, 1, 1, 1);

-- Template Updates
-- "Captain" Cookie
UPDATE `creature_template` SET `unit_flags`= 33587264, `ScriptName`= 'boss_captain_cookie', `flags_extra`= 0 WHERE `entry`= 47739;
UPDATE `creature_template` SET `unit_flags`= 33587264, `minlevel`= 87, `maxlevel`= 87, `flags_extra`= 1 WHERE `entry`= 48944;
-- Cookie's Cauldron
UPDATE `creature_template` SET `unit_flags`= 2304, `VehicleId`= 1283 WHERE `entry`= 47754;
-- Food
UPDATE `creature_template` SET `unit_flags`= 768, `unit_flags2`= 67110912, `npcflag`= 16777216, `flags_extra`= 2  WHERE `entry` IN (48006, 48276, 48294, 48293, 48295, 48296, 48297, 48298, 48300, 48299, 48301, 48302);

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID`= 45979 AND `GroupID`= 3;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `Comment`) VALUES
(45979, 3, 0, 'A shadowy figure appears in the ship''s cabin!', 41, 0, 100, 0, 0, 0, 48276, 'General Purpose Bunny JMF to Player');

-- Conditions
DELETE FROM `conditions` WHERE `SourceEntry`= 89250 AND `SourceTypeOrReferenceId`= 13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 89250, 0, 0, 31, 0, 3, 45979, 375838, 0, 0, '', 'Charge - Target General Purpose Bunny');

-- Creature Cookie's Cauldron 47754 SAI
SET @ENTRY := 47754;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 60, 0, 100, 1, 0, 0, 0, 0, 11, 89251, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Every 0 and 0 ms (for the first time, timer between 0 and 0 ms) - Self: Cast spell 89251 on Self // ");

-- Spells
DELETE FROM `spell_script_names` WHERE `ScriptName` IN
('spell_cookie_throw_food_targeting',
'spell_cookie_satiated');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(89268, 'spell_cookie_throw_food_targeting'),
(89740, 'spell_cookie_throw_food_targeting'),
(90561, 'spell_cookie_throw_food_targeting'),
(90582, 'spell_cookie_throw_food_targeting'),
(90562, 'spell_cookie_throw_food_targeting'),
(90583, 'spell_cookie_throw_food_targeting'),
(90563, 'spell_cookie_throw_food_targeting'),
(90584, 'spell_cookie_throw_food_targeting'),
(90564, 'spell_cookie_throw_food_targeting'),
(90585, 'spell_cookie_throw_food_targeting'),
(90565, 'spell_cookie_throw_food_targeting'),
(90586, 'spell_cookie_throw_food_targeting'),
(89267, 'spell_cookie_satiated'),
(92834, 'spell_cookie_satiated');

-- Template Addons
DELETE FROM `creature_template_addon` WHERE `entry` IN (48006, 48276, 48294, 48293, 48295, 48296, 48297, 48298, 48300, 48299, 48301, 48302);
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
-- Delicious Food
(48006 ,'89730'),
(48294 ,'89730'),
(48296 ,'89730'),
(48297 ,'89730'),
(48300 ,'89730'),
(48301 ,'89730'),
-- Rooten Food
(48276, '95513'),
(48293, '95513'),
(48295, '95513'),
(48298, '95513'),
(48299, '95513'),
(48302, '95513');

-- Spellclick spells
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (48006, 48276, 48294, 48293, 48295, 48296, 48297, 48298, 48300, 48299, 48301, 48302);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
-- Delicious Food
(48006, 89267, 3, 0),
(48294, 89267, 3, 0),
(48296, 89267, 3, 0),
(48297, 89267, 3, 0),
(48300, 89267, 3, 0),
(48301, 89267, 3, 0),
-- Rotten Food
(48276, 89732, 3, 0),
(48293, 89732, 3, 0),
(48295, 89732, 3, 0),
(48298, 89732, 3, 0),
(48299, 89732, 3, 0),
(48302, 89732, 3, 0);

-- SAI
SET @ENTRY := 48302;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");

SET @ENTRY := 48299;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");

SET @ENTRY := 48298;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");

SET @ENTRY := 48295;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");

SET @ENTRY := 48293;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");

SET @ENTRY := 48276;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");

SET @ENTRY := 48301;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");

SET @ENTRY := 48300;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");

SET @ENTRY := 48297;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");

SET @ENTRY := 48296;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");

SET @ENTRY := 48294;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");

SET @ENTRY := 48006;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On AI initialize - Self: Set react state to REACT_PASSIVE // "),
(@ENTRY, 0, 1, 0, 73, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On spellclick - Self: Despawn instantly // ");


-- Template Updates
-- Vanessa VanCleef
UPDATE `creature_template` SET `ScriptName`= 'boss_vanessa_van_cleef', `DamageModifier`= 60, `mechanic_immune_mask`= 617299839, `mingold`= 19000, `maxgold`= 20000, `flags_extra`= `flags_extra` | 2048 WHERE `entry`= 49541;
-- Vanessa VanCleef (Intro)
UPDATE `creature_template` SET `ScriptName`= 'npc_vanessa_vanessa_van_cleef' WHERE `entry`= 49429;
-- A Note from Vanessa
UPDATE `creature_template` SET `gossip_menu_id`= 12504, `ScriptName`= 'npc_vanessa_note_from_vanessa' WHERE `entry`= 49564;
-- Magma Trap creatures
UPDATE `creature_template` SET `InhabitType`= 4 WHERE `entry` IN (49454, 51624);
-- Vanessa's Trap Bunny
UPDATE `creature_template` SET `ScriptName`= 'npc_deadmines_vanessas_trap_bunny' WHERE `entry`= 49454;
-- Steam Valve
UPDATE `creature_template` SET `npcflag`= 16777216, `ScriptName`= 'npc_deadmines_steam_valve' WHERE `entry`= 49457;
-- Vanessa VanCleef Nightmare
UPDATE `creature_template` SET `ScriptName`= 'npc_deadmines_vanessa_van_cleef_nightmare' WHERE `entry`= 49671;
-- Glubtok Nightmare Fire Bunny
UPDATE `creature_template` SET `flags_extra`= 131 WHERE `entry`= 51594;
-- Collapsing Icicle
UPDATE `creature_template` SET `unit_flags`= 33587200, `flags_extra`= 131 WHERE `entry` IN (49481, 57866);
-- Glubtok Nightmare Illusion
UPDATE `creature_template` SET `DamageModifier`= 42.2, `mechanic_immune_mask`= 617299839 WHERE `entry`= 49670;
-- Helix Gearbreaker Illusion
UPDATE `creature_template` SET `unit_flags`= 33600, `DamageModifier`= 10, `mechanic_immune_mask`= 617299839, `ScriptName`= 'npc_deadmines_helix_nightmare' WHERE `entry`= 49674;
-- Lightning Platters
UPDATE `creature_template` SET `InhabitType`= 4, `flags_extra`= 128 WHERE `entry` IN (49520, 49521);
-- Foe Reaper 5000 Illusion
UPDATE `creature_template` SET `DamageModifier`= 42.2, `mechanic_immune_mask`= 617299839 WHERE `entry` = 49681;
-- James Harrington
UPDATE `creature_template` SET `VehicleId`= 1403 WHERE `entry`= 49539;
-- Enraged Worgen
UPDATE `creature_template` SET `DamageModifier`= 35 WHERE `entry`= 49532;
-- Defias Enforcer
UPDATE `creature_template` SET `difficulty_entry_1`= 49851 WHERE `entry`= 49850;
UPDATE `creature_template` SET `minlevel`= 87, `maxlevel`= 87, `DamageModifier`= 10 WHERE `entry`= 49851;
-- Defias Shadowguard
UPDATE `creature_template` SET `difficulty_entry_1`= 49853, `unit_class`= 4 WHERE `entry`= 49852;
UPDATE `creature_template` SET `minlevel`= 87, `maxlevel`= 87, `unit_class`= 4, `DamageModifier`= 10 WHERE `entry`= 49853;
-- Defias Blood Wizard
UPDATE `creature_template` SET `difficulty_entry_1`= 49855 WHERE `entry`= 49854;
UPDATE `creature_template` SET `minlevel`= 87, `maxlevel`= 87, `DamageModifier`= 10 WHERE `entry`= 49855;
-- Vanessa's Rope Anchor
UPDATE `creature_template` SET `InhabitType`= 4, `flags_extra`= 128 WHERE `entry`= 49552;
-- Rope
UPDATE `creature_template` SET `ScriptName`= 'npc_vanessa_rope' WHERE `entry`= 49550;
-- Glubtok Nightmare Fire Bunny
UPDATE `creature_template` SET `flags_extra`= 131 WHERE `entry`= 51594;
-- Vanessa Lightning Wall Platter
UPDATE `creature_template` SET `npcflag`= 16777216 WHERE `entry`= 49520;
-- James Harrington
UPDATE `creature_template` SET `lootid`= 0 WHERE `entry`= 49539;

DELETE FROM `creature_loot_template` WHERE `entry`= 49539;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`= 49550;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(49550, 89731, 1, 0);

-- Template Addons
DELETE FROM `creature_template_addon` WHERE `entry` IN (49564, 51594, 49671, 49670, 92201);
INSERT INTO `creature_template_addon` (`entry`, `bytes1`, `auras`) VALUES
(49564, 0, '92376'),
(51594, 0, '92169'),
(49671, 0, '48143'),
(49670, 0, '48143 69676');

UPDATE `creature_template_addon` SET `auras`= '94557' WHERE `entry`= 49457;

-- Remove encounter related spawns
DELETE FROM `creature` WHERE `guid` IN (376214, 376211, 376215, 376213);

-- Gossip
DELETE FROM `gossip_menu_option` WHERE (`MenuId`=12504 AND `OptionIndex`=0);
INSERT INTO `gossip_menu_option` (`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`) VALUES
(12504, 0, 0, 'Continue reading... <Note: This will alert Vanessa to your presence!>', 49641, 1, 1);

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID` IN (49429, 49564, 49454, 49671, 49674, 49539, 49536, 49541);
DELETE FROM `creature_text` WHERE `CreatureID`= 45979 AND `GroupID` NOT IN (0, 1, 2, 3);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `Comment`) VALUES
-- Vanessa VanCleef Intro
(49429, 0, 0, 'You hear a noise from above the cabin door!', 41, 0, 100, 0, 0, 0, 49476, 'Vanessa van Cleef to Player'),
(49429, 1, 0, 'I''ve been waiting a long time for this, you know.', 12, 0, 100, 1, 0, 24613, 49477, 'Vanessa van Cleef to Player'),
(49429, 2, 0, 'Biding my time, building my forces, studying the minds of my enemies.', 12, 0, 100, 1, 0, 24614, 49478, 'Vanessa van Cleef to Player'),
(49429, 3, 0, 'I was never very good at hand-to-hand combat, you know.  Not like my father.', 12, 0, 100, 1, 0, 24615, 49479, 'Vanessa van Cleef to Player'),
(49429, 4, 0, 'But I always excelled at poisons.', 12, 0, 100, 1, 0, 24616, 49480, 'Vanessa van Cleef to Player'),
(49429, 5, 0, 'Especially venoms that affect the mind.', 12, 0, 100, 1, 0, 24617, 49481, 'Vanessa van Cleef to Player'),
(49429, 6, 0, 'Vanessa injects you with the Nightmare Elixir!', 41, 0, 100, 0, 0, 0, 49483, 'Vanessa van Cleef to Player'),
-- A Note from Vanessa VanCleef
(49564, 0, 0, 'A note falls to the floor!', 41, 0, 100, 0, 0, 0, 49658, 'A Note from Vanessa to Player'),
-- Vanessa's Trap Bunny
(49454, 0, 0, 'Activate the steam valves to free yourself!', 41, 0, 100, 0, 0, 0, 49680, 'Vanessa''s Trap Bunny to Player'),
-- General Purpose Bunny JMF
(45979, 4, 0, 'The Nightmare Elixir takes hold!', 41, 0, 100, 0, 0, 0, 49705, 'General Purpose Bunny JMF to Steam Valve'),
(45979, 5, 0, 'The nightmare shifts!', 41, 0, 100, 0, 0, 0, 49707, 'General Purpose Bunny JMF to Player'),
(45979, 6, 0, 'Save Emme Harrington!', 41, 0, 100, 0, 0, 0, 49711, 'General Purpose Bunny JMF to Player'),
(45979, 7, 0, 'Save Erik Harrington!', 41, 0, 100, 0, 0, 0, 49712, 'General Purpose Bunny JMF'),
(45979, 8, 0, 'Save Calissa Harrington!', 41, 0, 100, 0, 0, 0, 49713, 'General Purpose Bunny JMF'),
(45979, 9, 0, 'The Nightmare Elixir wears off!', 41, 0, 100, 0, 0, 0, 49714, 'General Purpose Bunny JMF'),
-- Helix Gearbreaker
(49674, 0, 0, 'You have entered Helix''s nightmare!', 41, 0, 100, 0, 0, 0, 49708, 'Helix Gearbreaker to Player'),
(49674, 1, 0, 'Nightmare spiders appear in the darkness!  Kill Helix before his nightmare overwhelms you!', 41, 0, 100, 0, 0, 0, 50871, 'Helix Geabreaker to Player'),
-- James Harrington
(49539, 0, 0, 'Calissa...I am so sorry...', 12, 0, 100, 0, 0, 0, 49761, 'James Harrington'),
-- Calissa Harrington
(49536, 0, 0, 'James...please...I love you...', 12, 0, 100, 0, 0, 0, 49762, 'Calissa Harrington'),
(49536, 1, 0, 'Calissa is dying!', 41, 0, 100, 0, 0, 0, 49763, 'Calissa Harrington'),
-- Vanessa VanCleef Nightmare
(49671, 0, 0, 'Poor Glubtok.  When his powers manifested, his own ogre mound was the first to burn.', 12, 0, 100, 1, 0, 24602, 49715, 'Vanessa van Cleef to Steam Valve'),
(49671, 1, 0, 'Deep within his soul, the one thing he feared most of all was...himself.', 12, 0, 100, 1, 0, 24603, 49716, 'Vanessa van Cleef to Steam Valve'),
(49671, 2, 0, 'You have entered Glubtok''s Nightmare!', 41, 0, 100, 0, 0, 0, 49706, 'Vanessa van Cleef to Steam Valve'),
(49671, 3, 0, 'Get back to the ship!', 41, 0, 100, 0, 0, 0, 50703, 'Vanessa van Cleef to Steam Valve'),
(49671, 4, 0, 'Most rogues prefer to cloak themselves in the shadows, but not Helix.', 12, 0, 100, 1, 0, 24604, 49723, 'Vanessa van Cleef to Player'),
(49671, 5, 0, 'You never know what skitters in the darkness.', 12, 0, 100, 1, 0, 24605, 49724, 'Vanessa van Cleef to Player'),
(49671, 6, 0, 'Can you imagine the life of a machine?', 12, 0, 100, 1, 0, 24606, 49725, 'Vanessa van Cleef to Player'),
(49671, 7, 0, 'A simple spark can mean the difference between life...and death.', 12, 0, 100, 1, 0, 24607, 49726, 'Vanessa van Cleef to Player'),
(49671, 8, 0, 'You have entered the mechanical nightmare!', 41, 0, 100, 0, 0, 0, 49709, 'Vanessa van Cleef to Player'),
(49671, 9, 0, 'Ripsnarl wasn''t always a bloodthirsty savage.  Once, he even had a family.', 12, 0, 100, 1, 0, 24608, 49742, 'Vanessa van Cleef to Player'),
(49671, 10, 0, 'He was called James Harrington.  A tragedy in three parts.', 12, 0, 100, 1, 0, 24609, 49745, 'Vanessa van Cleef to Player'),
(49671, 11, 0, 'You have entered Ripsnarl''s nightmare!', 41, 0, 100, 0, 0, 0, 49710, 'Vanessa van Cleef to Player'),
-- Vanessa VanCleef
(49541, 0, 0, 'I will not share my father''s fate!  Your tale ends here!', 14, 0, 100, 0, 0, 24599, 49748, 'Vanessa van Cleef to Player'),
(49541, 1, 0, 'The first of many.', 14, 0, 100, 0, 0, 24620, 49749, 'Vanessa van Cleef'),
(49541, 2, 0, 'Did you really think I would come to this fight alone?', 14, 0, 100, 0, 0, 24620, 49750, 'Vanessa van Cleef'),
(49541, 3, 0, 'Fools!  This entire ship is rigged with explosives!  Enjoy your fiery deaths!', 14, 0, 100, 0, 0, 24621, 49751, 'Vanessa van Cleef'),
(49541, 4, 0, 'Vanessa has detonated charges on the ship!  Get to the ropes at the side of the boat!', 41, 0, 100, 0, 0, 0, 49755, 'Vanessa van Cleef'),
(49541, 5, 0, 'You didn''t honestly think I would only plant ONE set of explosives, did you?', 14, 0, 100, 0, 0, 24622, 50706, 'Vanessa van Cleef'),
(49541, 6, 0, 'Vanessa is detonating more charges!  Get to the ropes at the side of the boat!', 41, 0, 100, 0, 0, 0, 49756, 'Vanessa van Cleef'),
(49541, 7, 0, 'ENOUGH!  I will not give you the pleasure!', 14, 0, 100, 274, 0, 24610, 49753, 'Vanessa van Cleef'),
(49541, 8, 0, 'If I''m going to die, I''m taking you all with me!', 14, 0, 100, 15, 0, 24611, 49752, 'Vanessa van Cleef'),
(49541, 9, 0, 'Vanessa pulls out a final barrel of mining powder and ignites it!  RUN!', 41, 0, 100, 0, 0, 0, 49757, 'Vanessa van Cleef'),
(49541, 10, 0, 'MY FATE IS MY OWN!', 14, 0, 100, 397, 0, 24612, 49754, 'Vanessa van Cleef');
UPDATE `creature_text` SET `TextRange`= 3 WHERE `CreatureID` IN (45979, 49539, 49536);

-- Vehicle Acessory
DELETE FROM `vehicle_template_accessory` WHERE `entry`= 49520;
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(49520, 49521, 7, 1, 'Vanessa Lightning Platter - Vanessa Lightning Stalker', 5, 0), -- Vanessa Lightning Platter - Vanessa Lightning Stalker
(49520, 49521, 6, 1, 'Vanessa Lightning Platter - Vanessa Lightning Stalker', 5, 0), -- Vanessa Lightning Platter - Vanessa Lightning Stalker
(49520, 49521, 5, 1, 'Vanessa Lightning Platter - Vanessa Lightning Stalker', 5, 0), -- Vanessa Lightning Platter - Vanessa Lightning Stalker
(49520, 49521, 4, 1, 'Vanessa Lightning Platter - Vanessa Lightning Stalker', 5, 0), -- Vanessa Lightning Platter - Vanessa Lightning Stalker
(49520, 49521, 3, 1, 'Vanessa Lightning Platter - Vanessa Lightning Stalker', 5, 0), -- Vanessa Lightning Platter - Vanessa Lightning Stalker
(49520, 49521, 2, 1, 'Vanessa Lightning Platter - Vanessa Lightning Stalker', 5, 0), -- Vanessa Lightning Platter - Vanessa Lightning Stalker
(49520, 49521, 1, 1, 'Vanessa Lightning Platter - Vanessa Lightning Stalker', 5, 0), -- Vanessa Lightning Platter - Vanessa Lightning Stalker
(49520, 49521, 0, 1, 'Vanessa Lightning Platter - Vanessa Lightning Stalker', 5, 0); -- Vanessa Lightning Platter - Vanessa Lightning Stalker

-- Spells
DELETE FROM `spell_script_names` WHERE `ScriptName` IN
('spell_deadmines_ride_magma_vehicle',
'spell_deadmines_magma_trap_throw_to_location',
'spell_vanessa_backslash_targeting',
'spell_vanessa_backslash_targeting',
'spell_deadmines_bloodbath');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(92378, 'spell_deadmines_ride_magma_vehicle'),
(92438, 'spell_deadmines_magma_trap_throw_to_location'),
(92620, 'spell_vanessa_backslash_targeting'),
(90925, 'spell_deadmines_bloodbath');

-- Spellclick spells
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (49457);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
-- Steam Valve
(49457, 92399, 0, 0);

-- Conditions
DELETE FROM `conditions` WHERE `SourceEntry` IN (92379, 90962, 90963) AND `SourceTypeOrReferenceId`= 13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 92379, 0, 0, 31, 0, 3, 49454, 0, 0, 0, '', 'Ride Magma Vehicle - Target Vanessa''s Trap Bunny'),
(13, 1, 90962, 0, 0, 31, 0, 3, 49850, 0, 0, 0, '', 'Whirling Blades - Target Defias Enforcer'),
(13, 1, 90962, 0, 1, 31, 0, 3, 49852, 0, 0, 0, '', 'Whirling Blades - Target Defias Shadowguard'),
(13, 1, 90962, 0, 2, 31, 0, 3, 49854, 0, 0, 0, '', 'Whirling Blades - Target Defias Blood Wizard'),
(13, 1, 90963, 0, 0, 31, 0, 3, 49850, 0, 0, 0, '', 'Whirling Blades - Target Defias Enforcer'),
(13, 1, 90963, 0, 1, 31, 0, 3, 49852, 0, 0, 0, '', 'Whirling Blades - Target Defias Shadowguard'),
(13, 1, 90963, 0, 2, 31, 0, 3, 49854, 0, 0, 0, '', 'Whirling Blades - Target Defias Blood Wizard');

-- Creature Collapsing Icicle 49481 SAI
SET @ENTRY := 49481;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 63, 0, 100, 0, 0, 0, 0, 0, 3, 0, 28470, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "When just created - Self: Morph to model 28470 // "),
(@ENTRY, 0, 1, 2, 60, 0, 100, 1, 3200, 3200, 0, 0, 11, 92201, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Every 0 and 0 ms (for the first time, timer between 3200 and 3200 ms) - Self: Cast spell Icicle (92201) on Self // "),
(@ENTRY, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 92202, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, " Linked - Self: Cast spell Icicle (92202) on Self // ");

-- Creature Emme Harrington 49534 SAI
SET @ENTRY := 49534;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 60, 0, 100, 0, 100, 100, 5000, 5000, 11, 92308, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Every 5000 and 5000 ms (for the first time, timer between 100 and 100 ms) - Self: Cast spell Group Taunt (92308) on Self // ");

-- Creature Erik Harrington 49535 SAI
SET @ENTRY := 49535;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 60, 0, 100, 0, 100, 100, 5000, 5000, 11, 92308, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Every 5000 and 5000 ms (for the first time, timer between 100 and 100 ms) - Self: Cast spell Group Taunt (92308) on Self // ");

-- Creature Calissa Harrington 49536 SAI
SET @ENTRY := 49536;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 60, 0, 100, 1, 15400, 15400, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Every 0 and 0 ms (for the first time, timer between 15400 and 15400 ms) - Self: Talk 0 // "),
(@ENTRY, 0, 1, 0, 60, 0, 100, 1, 25000, 25000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Every 0 and 0 ms (for the first time, timer between 25000 and 25000 ms) - Self: Talk 1 // "),
(@ENTRY, 0, 2, 0, 60, 0, 100, 1, 16700, 16700, 0, 0, 1, 0, 0, 0, 0, 0, 0, 11, 49539, 10, 0, 0, 0, 0, 0, "Every 0 and 0 ms (for the first time, timer between 16700 and 16700 ms) - Creature James Harrington (49539) in 10 yd: Talk 0 // ");

-- Creature Glubtok 49670 SAI
SET @ENTRY := 49670;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 0, 0, 100, 0, 4500, 4500, 3600, 3600, 11, 59304, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 4500 and 4500 ms (and later repeats every 3600 and 3600 ms) - Self: Cast spell Spirit Strike (59304) on Victim // ");

-- Creature Foe Reaper 5000 49681 SAI
SET @ENTRY := 49681;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 0, 0, 100, 0, 2600, 2600, 3600, 3600, 11, 59304, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 2600 and 2600 ms (and later repeats every 3600 and 3600 ms) - Self: Cast spell Spirit Strike (59304) on Victim // ");

-- Creature Defias Enforcer 49850 SAI
SET @ENTRY := 49850;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 11, 90931, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 1000 and 1000 ms (and later repeats every 0 and 0 ms) - Self: Cast spell Charge (90931) on Closest player in 50 yards // "),
(@ENTRY, 0, 1, 0, 0, 0, 100, 0, 6500, 7000, 30000, 30000, 11, 90925, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 6500 and 7000 ms (and later repeats every 30000 and 30000 ms) - Self: Cast spell Bloodbath (90925) on Victim // "),
(@ENTRY, 0, 2, 0, 2, 0, 100, 0, 0, 20, 29000, 30000, 11, 90929, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "When health between 0% and 20% (check every 29000 - 30000 ms) - Self: Cast spell Recklessness (90929) on Self // ");

-- Creature Defias Shadowguard 49852 SAI
SET @ENTRY := 49852;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 11, 90954, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 1000 and 1000 ms (and later repeats every 0 and 0 ms) - Self: Cast spell Camouflage (90954) on Self // "),
(@ENTRY, 0, 1, 0, 0, 0, 100, 0, 5500, 6000, 10000, 11000, 11, 90951, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 5500 and 6000 ms (and later repeats every 10000 and 11000 ms) - Self: Cast spell Sinister Strike (90951) on Victim // "),
(@ENTRY, 0, 2, 0, 0, 0, 100, 0, 10000, 10000, 20000, 20000, 11, 90956, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 10000 and 10000 ms (and later repeats every 20000 and 20000 ms) - Self: Cast spell Shadowstep (90956) on Victim // "),
(@ENTRY, 0, 3, 0, 0, 0, 100, 0, 13000, 13000, 16000, 16000, 11, 90960, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 13000 and 13000 ms (and later repeats every 16000 and 16000 ms) - Self: Cast spell Whirling Blades (90960) on Victim // "),
(@ENTRY, 0, 4, 0, 2, 0, 100, 0, 0, 20, 29000, 30000, 11, 90958, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "When health between 0% and 20% (check every 29000 - 30000 ms) - Self: Cast spell Evasion (90958) on Self // ");

-- Creature Defias Blood Wizard 49854 SAI
SET @ENTRY := 49854;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 0, 0, 100, 0, 0, 0, 3000, 3000, 11, 90938, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 0 and 0 ms (and later repeats every 3000 and 3000 ms) - Self: Cast spell Bloodbolt (90938) on Victim // "),
(@ENTRY, 0, 1, 0, 0, 0, 100, 0, 7000, 7000, 60000, 60000, 11, 90932, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 7000 and 7000 ms (and later repeats every 60000 and 60000 ms) - Self: Cast spell Ragezone (90932) on Random hostile // ");

-- Loot
DELETE FROM `creature_loot_template` WHERE `Entry`= 49541;
DELETE FROM `reference_loot_template` WHERE `Entry` IN (495410, 495411);

INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `Reference`, `MaxCount`) VALUES
(49541, 495410, 100, 1, 497120, 2),
(49541, 495411, 100, 1, 497121, 1); -- Chaos Orb

INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(497120, 63487, 0, 1, 1, 1, 1), -- Book of the Well Sung Song
(497120, 63480, 0, 1, 1, 1, 1), -- Record of the Broderhood's End
(497120, 63479, 0, 1, 1, 1, 1), -- Bracers of Some Consequence
(497120, 63478, 0, 1, 1, 1, 1), -- Stonemanons's Helm
(497120, 65178, 0, 1, 1, 1, 1), -- VanCleef's Boots
(497120, 63485, 0, 1, 1, 1, 1), -- Cowl of Rebellion
(497120, 63482, 0, 1, 1, 1, 1), -- Daughter's Hand
(497120, 63483, 0, 1, 1, 1, 1), -- Guildmaster's Greaves
(497120, 63486, 0, 1, 1, 1, 1), -- Shackles of the Betrayed
(497120, 63484, 0, 1, 1, 1, 1), -- Armbands of Exiled Architects
(495411, 52078, 100, 1, 1, 1, 1);

DELETE FROM `creature_onkill_reward` WHERE `creature_id` IN (49429, 49541);
INSERT INTO `creature_onkill_reward` (`creature_id`, `CurrencyId1`, `CurrencyCount1`) VALUES
-- 70 Justice Points
(49541, 395, 7000);

UPDATE `creature_template` SET `DamageModifier`= 90 WHERE `entry`= 48936;
UPDATE `creature_template` SET `DamageModifier`= 8 WHERE `entry` IN (48957, 48958);
UPDATE `creature_template` SET `DamageModifier`= 120 WHERE `entry`= 48939;
UPDATE `creature_template` SET `DamageModifier`= 18 WHERE `entry` IN (48940, 49674);
UPDATE `creature_template` SET `BaseAttackTime`= 1000, `flags_extra`= 2048 WHERE `entry` IN (47296, 48940, 49674);
UPDATE `creature_template` SET `DamageModifier`= 30 WHERE `entry`= 48943;
UPDATE `creature_template` SET `DamageModifier`= 90 WHERE `entry`= 49541;

-- Deadmines
UPDATE `creature_template` SET `DamageModifier`= 60, `BaseVariance`= 0.5, `mingold`= 10000, `maxgold`= 15000 WHERE `entry` IN (48829, 48830);
UPDATE `creature_template` SET `DamageModifier`= 60, `BaseVariance`= 0.5 WHERE `entry`= 48804;
UPDATE `creature_template` SET `mingold`= 20000, `maxgold`= 25000 WHERE `entry` IN (48940, 48943, 48944);
UPDATE `creature_template` SET `DamageModifier`= 10, `BaseVariance`= 0.5, `mingold`= 10000, `maxgold`= 15000 WHERE `entry` IN (48834, 48823, 48824, 48826, 48811);
UPDATE `creature_template` SET `DamageModifier`= 10, `BaseVariance`= 0.5 WHERE `entry`= 48447;
UPDATE `creature_template` SET `InhabitType`= 4  WHERE `entry` IN (48505, 48447);
UPDATE `creature_template` SET `DamageModifier`= 60, `BaseVariance`= 0.5,  `mingold`= 20000, `maxgold`= 25000 WHERE `entry` IN (48936, 48941);
UPDATE `creature_template` SET `DamageModifier`= 30, `BaseVariance`= 0.5, `mingold`= 10000, `maxgold`= 15000 WHERE `entry` IN (48819, 48821, 48814, 48812, 48914, 48787, 48792, 48791, 48777, 48778);
DELETE FROM `creature_onkill_reward` WHERE `creature_id` IN (48834, 48829,48830, 48823, 48824, 48826, 48827, 48819, 48814, 48811, 48812, 48914, 48810, 48787, 48792, 48791, 48781, 48777, 48778, 48936, 48940, 48941, 48943, 48944, 49541, 49851);

-- Heroic Mode
-- Deadmines
INSERT INTO `creature_onkill_reward` (`creature_id`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(48834, 1162, 7, 0, 15, 0),
(48829, 1162, 7, 0, 15, 0),
(48830, 1162, 7, 0, 15, 0),
(48823, 1162, 7, 0, 15, 0),
(48824, 1162, 7, 0, 15, 0),
(48826, 1162, 7, 0, 15, 0),
(48827, 1162, 7, 0, 15, 0),
(48819, 1162, 7, 0, 15, 0),
(48814, 1162, 7, 0, 15, 0),
(48811, 1162, 7, 0, 15, 0),
(48812, 1162, 7, 0, 15, 0),
(48914, 1162, 7, 0, 15, 0),
(48787, 1162, 7, 0, 15, 0),
(49851, 1162, 7, 0, 15, 0),
(48792, 1162, 7, 0, 15, 0),
(48791, 1162, 7, 0, 15, 0),
(48781, 1162, 7, 0, 15, 0),
(48777, 1162, 7, 0, 15, 0),
(48778, 1162, 7, 0, 15, 0),
(48936, 1162, 7, 0, 250, 0),
(48940, 1162, 7, 0, 250, 0),
(48941, 1162, 7, 0, 250, 0),
(48943, 1162, 7, 0, 250, 0),
(48944, 1162, 7, 0, 250, 0),
(49541, 1162, 7, 0, 250, 0);

UPDATE `creature_onkill_reward` SET `CurrencyId1`= 395, `CurrencyCount1`= 7000 WHERE `creature_id` IN (48936, 48940, 48941, 48944 , 48943, 49541);


