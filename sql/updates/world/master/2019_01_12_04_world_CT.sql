UPDATE `quest_template_addon` SET `NextQuestID` = 14291 WHERE `ID` = 14280;
DELETE FROM `quest_template_addon` WHERE `ID` = 14283;

UPDATE `quest_template_addon` SET `NextQuestID` = 14289 WHERE `ID` = 14278;
DELETE FROM `quest_template_addon` WHERE `ID` = 14279;

UPDATE `quest_template_addon` SET `NextQuestID` = 14288 WHERE `ID` = 14277;
DELETE FROM `quest_template_addon` WHERE `ID` = 14281;

UPDATE `quest_template_addon` SET `NextQuestID` = 14285 WHERE `ID` = 14269;
DELETE FROM `quest_template_addon` WHERE `ID` = 14272;

UPDATE `quest_template_addon` SET `NextQuestID` = 14290 WHERE `ID` = 14275;
DELETE FROM `quest_template_addon` WHERE `ID` = 14276;

UPDATE `quest_template_addon` SET `NextQuestID` = 14287 WHERE `ID` = 14273;
DELETE FROM `quest_template_addon` WHERE `ID` = 14274;

UPDATE `quest_template_addon` SET `NextQuestID` = 14286 WHERE `ID` = 14265;
DELETE FROM `quest_template_addon` WHERE `ID` = 14266;


DELETE FROM `disables` WHERE `entry` IN (14283, 14279, 14281, 14272, 14276, 14274, 14266);
INSERT INTO `disables` VALUES 
(1, 14283, 0, 0, 0, 'Old quest'),
(1, 14279, 0, 0, 0, 'Old quest'),
(1, 14281, 0, 0, 0, 'Old quest'),
(1, 14272, 0, 0, 0, 'Old quest'),
(1, 14276, 0, 0, 0, 'Old quest'),
(1, 14274, 0, 0, 0, 'Old quest'),
(1, 14266, 0, 0, 0, 'Old quest');


DELETE FROM `creature_queststarter` WHERE 
(`id` = 35873 AND `quest` = 14283) OR 
(`id` = 35870 AND `quest` = 14279) OR 
(`id` = 35872 AND `quest` = 14281) OR 
(`id` = 35871 AND `quest` = 14272) OR 
(`id` = 35874 AND `quest` = 14276) OR 
(`id` = 35869 AND `quest` = 14274) OR 
(`id` = 35839 AND `quest` = 14266);

DELETE FROM `creature_questender` WHERE 
(`id` = 35873 AND `quest` = 14283) OR 
(`id` = 35870 AND `quest` = 14279) OR 
(`id` = 35872 AND `quest` = 14281) OR 
(`id` = 35871 AND `quest` = 14272) OR 
(`id` = 35874 AND `quest` = 14276) OR 
(`id` = 35869 AND `quest` = 14274) OR 
(`id` = 35839 AND `quest` = 14266);


