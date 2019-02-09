-- Currency Loot
DELETE FROM `creature_onkill_reward` WHERE `creature_id`= 48337;
INSERT INTO `creature_onkill_reward` (`creature_id`, `CurrencyId1`, `CurrencyCount1`) VALUES
(48337, 395, 7000);

DELETE FROM `creature_onkill_reward` WHERE `creature_id` IN (40177, 48702);
INSERT INTO `creature_onkill_reward` (`creature_id`, `CurrencyId1`, `CurrencyCount1`) VALUES
(40177, 395, 7000),
(48702, 395, 7000);

-- Currency Loot
DELETE FROM `creature_onkill_reward` WHERE `creature_id` IN (40319, 48784);
INSERT INTO `creature_onkill_reward` (`creature_id`, `CurrencyId1`, `CurrencyCount1`) VALUES
(40319, 395, 3500),
(48784, 395, 7000);

DELETE FROM `creature_template_addon` WHERE `entry` IN (39388, 48832);
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(39388, 76192),
(48832, 91044);


