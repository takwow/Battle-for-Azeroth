UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`= 46363;
UPDATE `creature_template` SET `ScriptName`='npc_sanitron_5000', `InhabitType` = 4, `HoverHeight` = 0 WHERE `entry`= 46185;
DELETE FROM `creature_text` WHERE `CreatureID` IN (46185, 46230);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`, `BroadcastTextID`) VALUES
(46185, 0, 0, 'Commencing decontamination sequence...', 12, 0, 100, 0, 0, 0, NULL, 46323),
(46185, 1, 0, 'Decontamination complete. Standby for delivery.', 12, 0, 100, 0, 0, 0, NULL, 46324),
(46185, 2, 0, 'Warning, system overload. Malfunction imminent!', 12, 0, 100, 0, 0, 0, NULL, 46325),
(46230, 0, 0, 'Ugh! Not this again! I''m asking for a new station next expedition...', 12, 0, 100, 0, 0, 0, NULL, 46342);

-- http://www.wowhead.com/quest=27674/to-the-surface
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_gnomeregan_torben' WHERE `entry` = 46293;
UPDATE `gossip_menu_option` SET `OptionBroadcastTextId`= 46360 WHERE `MenuID`= 12104; 

UPDATE `creature_template` SET `ScriptName` = 'npc_nevin_twistwrench' WHERE `entry` = 45966;
UPDATE `creature_template` SET `ScriptName` = 'npc_carvo_blastbolt' WHERE `entry` = 47250;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 46363;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 46447;
UPDATE `creature_template` SET `InhabitType` = 4, `HoverHeight` = 0 WHERE `entry` = 46165;
UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 46012;

DELETE FROM `creature_text` WHERE `CreatureID` = 47836;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`, `BroadcastTextId`) VALUES
(47836, 0, 0, 'You can follow me to the Loading Room, $N', 12, 0, 100, 0, 0, 0, '', 48091);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (46363, 46447);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(46363, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 11, 80653, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Irradiation Aura'),
(46447, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 11, 80653, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Irradiation Aura');

DELETE FROM `waypoint_data` WHERE `id` = 4783600;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(4783600, 1, -4981.25, 780.992, 288.485, 0, 2000, 1, 0, 100, 0),
(4783600, 2, -4989.39, 779.806, 288.485, 0, 0, 1, 0, 100, 0),
(4783600, 3, -5002.69, 769.878, 288.485, 0, 0, 1, 0, 100, 0),
(4783600, 4, -5004.79, 770.036, 287.237, 0, 0, 1, 0, 100, 0),
(4783600, 5, -5031.01, 772.175, 283.101, 0, 0, 1, 0, 100, 0),
(4783600, 6, -5105.9, 775.347, 283.315, 0, 0, 1, 0, 100, 0),
(4783600, 7, -5111.33, 773.41, 287.398, 0, 0, 1, 0, 100, 0),
(4783600, 8, -5133.34, 763.884, 287.373, 0, 0, 1, 0, 100, 0),
(4783600, 9, -5157.74, 765.17, 287.395, 0, 0, 1, 0, 100, 0),
(4783600, 10, -5161.05, 765.459, 285.474, 0, 0, 1, 0, 100, 0),
(4783600, 11, -5174, 767.117, 285.474, 0, 3000, 1, 154599041, 100, 0),
(4783600, 12, -5174, 767.117, 285.474, 0, 0, 1, 154599042, 100, 0);


DELETE FROM `waypoint_scripts` WHERE `guid` IN (154599041, 154599042);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(154599041, 0, 1, 66, 0, 0, 0, 0, 0, 0, 154599041),
(154599042, 0, 18, 0, 0, 0, 0, 0, 0, 0, 154599042);

-- Captured Demolitionist SAI
SET @ENTRY := 42645;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,1,0,1,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Demolitionist - On Data Set 0 1 - Run Script (No Repeat)"),
(@ENTRY,0,1,0,38,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Demolitionist - On Data Set 0 0 - Set Data 0 0");

-- Actionlist SAI
SET @ENTRY := 4264500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,85,79606,2,18,35,0,0,7,0,0,0,0,0,0,0,"Captured Demolitionist - On Script - Invoker Cast '<Spell not found!>'"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Demolitionist - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,114,10,0,0,0,0,0,1,0,0,0,0,5,0,0,"Captured Demolitionist - On Script"),
(@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Demolitionist - On Script - Despawn Instant");

DELETE FROM `creature_text` WHERE `CreatureID` IN (42491);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (42491, 0, 0, 'It\'s been hard for our scouts to get information on what Crushcog is planning.', 12, 0, 100, 1, 0, 0, 43105, 0, 'Hinkles Fastblast to Captain Tread Sparknozzle');

-- Makeshift Cage SAI
SET @ENTRY := 204019;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,1,70,0,100,0,2,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Makeshift Cage - On Gameobject State Changed - Store Targetlist"),
(@ENTRY,1,1,2,61,0,100,0,2,0,0,0,100,1,0,0,0,0,0,19,42645,5,0,0,0,0,0,"Makeshift Cage - On Gameobject State Changed - Send Target 1"),
(@ENTRY,1,2,0,61,0,100,0,2,0,0,0,45,0,1,0,0,0,0,19,42645,5,0,0,0,0,0,"Makeshift Cage - On Gameobject State Changed - Set Data 0 1"),
(@ENTRY,1,3,1,70,0,100,0,2,0,0,0,33,42645,0,0,0,0,0,7,0,0,0,0,0,0,0,"Makeshift Cage - On Gameobject State Changed - Quest Credit ''");

-- Crushcog Sentry-Bot SAI
SET @ENTRY := 42291;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,8,15000,25000,11,84152,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crushcog Sentry-Bot - Within 0-8 Range - Cast '<Spell not found!>'"),
(@ENTRY,0,1,2,8,0,100,0,79781,0,0,0,33,42796,0,0,0,0,0,7,0,0,0,0,0,0,0,"Crushcog Sentry-Bot - On Spellhit '<Spell not found!>' - Quest Credit ''"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crushcog Sentry-Bot - On Spellhit - Say Line 0"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Crushcog Sentry-Bot - On Spellhit - Despawn Instant");

