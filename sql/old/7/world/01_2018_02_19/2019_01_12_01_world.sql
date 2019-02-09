DELETE FROM `creature_sparring_template` WHERE `AttackerEntry` IN (50471, 50474, 35505, 35504, 35509);
INSERT INTO `creature_sparring_template` (`AttackerEntry`, `VictimEntry`, `HealthLimitPct`) VALUES
(50471, 50474, 90.0),
(50474, 50471, 90.0),
(35505, 35504, 90.0),
(35509, 35505, 90.0),
(35505, 35509, 90.0);

