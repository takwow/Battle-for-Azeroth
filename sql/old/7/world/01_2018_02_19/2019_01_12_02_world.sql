UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 195327;
DELETE FROM `smart_scripts` WHERE (source_type = 1 AND entryorguid = 195327);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(195327, 1, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(195327, 1, 1, 2, 61, 0, 50, 0, 0, 0, 0, 0, 12, 34981, 2, 5000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '50% of summon creature 34981'),
(195327, 1, 2, 3, 61, 0, 50, 0, 0, 0, 0, 0, 12, 35660, 2, 15000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '50% of summor creature 35560'),
(195327, 1, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 35830, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Kill Credit 35830');

UPDATE `gameobject_template` SET `Data10` = 67869 WHERE `entry` = 195327;
UPDATE `gameobject_template` SET `Data0` = 0 WHERE `entry` = 195327;

