UPDATE `creature_template` SET `lootid` = 95226 WHERE `entry` = 95226;
DELETE FROM `creature_loot_template` WHERE `entry` = 95226;
INSERT INTO `creature_loot_template` (`entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(95226, 128227, 0, 20, 1, 1, 0, 1, 1, 'Set Them Free'),
(95226, 129196, 0, 1, 0, 1, 0, 1, 1, '');

