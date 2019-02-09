-- Assign scriptname to instance
UPDATE `instance_template` SET `script`= 'instance_grim_batol' WHERE `map`= 670;

-- Template Updates
UPDATE `creature_template` SET `scriptname`= 'boss_general_umbriss', `flags_extra`= `flags_extra`| 0x40000000 WHERE `entry`= 39625;
UPDATE `creature_template` SET `minlevel`= 87, `maxlevel`= 87, `BaseAttackTime`= 1500, `unit_flags`= 67141696, `lootid`= 48337, `mechanic_immune_mask`= 617299839, `flags_extra`= `flags_extra`| 0x40000000 WHERE `entry`= 48337;
-- Blitz / Ground Siege
UPDATE `creature_template` SET `faction`= 35, `unit_flags`= 33554688, `flags_extra`= 131 WHERE `entry` IN (40040, 40030);

-- Remove db side spawned Malignant Trogg
DELETE FROM `creature` WHERE `guid`= 340015;
DELETE FROM `creature_addon` WHERE `guid`= 340015;

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID`= 39625;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `Comment`) VALUES
(39625, 0, 0, 'Cover the rear! Alexstrasza''s brood decimate our ranks!', 14, 0, 100, 0, 0, 18537, 40642, 'General Umbriss'),
(39625, 0, 1, 'Reinforce the front! We are being invaded!', 14, 0, 100, 0, 0, 18536, 40640, 'General Umbriss'),
(39625, 1, 0, 'A million more await my orders. What chance do you have?', 14, 0, 100, 0, 0, 18530, 47784, 'General Umbriss to Player'),
(39625, 2, 0, 'Attack you cowardly vermin!', 14, 0, 100, 0, 0, 18535, 47799, 'General Umbriss'),
(39625, 2, 1, 'Vermin, your dinner awaits!', 14, 0, 100, 0, 0, 18531, 47785, 'General Umbriss'),

(39625, 3, 0, 'Messy...', 14, 0, 100, 0, 0, 18532, 47786, 'General Umbriss'),
(39625, 4, 0, '|TInterface\\Icons\\ability_warrior_charge.blp:20|tGeneral Umbriss sets his eyes on |cFFFF0000$n|r and begins to cast |cFFFF0000|Hspell:74670|h[Blitz]|h|r!', 41, 0, 100, 0, 0, 0, 39994, 'General Umbriss to Player'),
(39625, 5, 0, '|TInterface\\Icons\\spell_nature_earthquake.blp:20|tGeneral Umbriss begins to cast |cFFFF0000|Hspell:74634|h[Ground Siege]|h|r!', 41, 0, 100, 0, 0, 0, 50666, 'General Umbriss to Ground Siege'),
(39625, 6, 0, '%s goes into a frenzy!', 41, 0, 100, 0, 0, 0, 10645, 'General Umbriss');

-- Spell scriptnames
DELETE FROM `spell_script_names` WHERE `ScriptName` IN
('spell_umbriss_summon_blitz_trigger',
'spell_umbriss_summon_ground_siege_trigger',
'spell_umbriss_bleeding_wound',
'spell_umbriss_modguds_malice');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(74668, 'spell_umbriss_summon_blitz_trigger'),
(74640, 'spell_umbriss_summon_ground_siege_trigger'),
(74846, 'spell_umbriss_bleeding_wound'),
(91937, 'spell_umbriss_bleeding_wound'),
(74699, 'spell_umbriss_modguds_malice'),
(90169, 'spell_umbriss_modguds_malice');

DELETE FROM `conditions` WHERE `SourceEntry` IN (74670, 90250, 74634, 90249, 90170) AND `SourceTypeOrReferenceId`= 13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 74670, 0, 0, 31, 0, 3, 40040, 0, 0, 0, '', 'Blitz - Target Blitz Stalker'),
(13, 1, 90250, 0, 0, 31, 0, 3, 40040, 0, 0, 0, '', 'Blitz - Target Blitz Stalker'),
(13, 1, 74634, 0, 0, 31, 0, 3, 40030, 0, 0, 0, '', 'Ground Siege - Target Ground Siege Stalker'),
(13, 1, 90249, 0, 0, 31, 0, 3, 40030, 0, 0, 0, '', 'Ground Siege - Target Ground Siege Stalker'),
(13, 1, 90170, 0, 0, 31, 0, 3, 39625, 0, 0, 0, '', 'Modgud''s Malice - Target General Umbriss'),
(13, 2, 90170, 0, 0, 31, 0, 3, 39625, 0, 0, 0, '', 'Modgud''s Malice - Target General Umbriss'),
(13, 4, 90170, 0, 0, 31, 0, 3, 45467, 0, 0, 0, '', 'Modgud''s Malice - Target Trogg Dweller');

-- Creature Malignant Trogg 39984 SAI
SET @ENTRY := 39984;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 1, 3000, 3000, 0, 0, 49, 0, 0, 0, 0, 0, 0, 18, 100, 0, 0, 0, 0, 0, 0, "When out of combat and timer at the begining between 3000 and 3000 ms (and later repeats every 0 and 0 ms) - Self: Attack Players in 100 yards // "),
(@ENTRY, 0, 1, 0, 0, 0, 100, 0, 6000, 7000, 6000, 7000, 11, 76507, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 6000 and 7000 ms (and later repeats every 6000 and 7000 ms) - Self: Cast spell 76507 on Victim // ");

DELETE FROM `creature_template_addon` WHERE `entry`= 48350;
INSERT INTO `creature_template_addon` (`entry`, `bytes2`, `auras`) VALUES
(48350, 1, 74699);

-- Creature Trogg Dweller 45467 SAI
SET @ENTRY := 45467;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 1, 3000, 3000, 0, 0, 49, 0, 0, 0, 0, 0, 0, 18, 100, 0, 0, 0, 0, 0, 0, "When out of combat and timer at the begining between 3000 and 3000 ms (and later repeats every 0 and 0 ms) - Self: Attack Players in 100 yards // "),
(@ENTRY, 0, 1, 0, 0, 0, 100, 0, 6000, 7000, 6000, 7000, 11, 76507, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 6000 and 7000 ms (and later repeats every 6000 and 7000 ms) - Self: Cast spell 76507 on Victim // ");

-- Remove pathfinding from troggs since they have to pass ugly terrain
UPDATE `creature_template` SET `flags_extra`= `flags_extra` | 0x20000000 WHERE `entry` IN (45467, 39984, 48350, 48348);

-- Drop SAI and assign scriptname
UPDATE `creature_template` SET `AIName`="", `Scriptname`= 'npc_umbriss_skardyn' WHERE `entry` IN (39984, 45467);
DELETE FROM `smart_scripts` WHERE `entryorguid`=39984 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=45467 AND `source_type`=0;

-- Spell scriptnames
DELETE FROM `spell_script_names` WHERE `ScriptName`= 'spell_umbriss_modguds_malice';

-- Loot
-- General Umbriss
UPDATE `creature_template` SET `lootid` = 39625 WHERE `entry` = 39625;
UPDATE `creature_template` SET `lootid` = 48337 WHERE `entry` = 48337;
DELETE FROM `creature_loot_template` WHERE `entry` IN (39625, 48337);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(39625, 56113, 0, 1, 1, 1, 1),
(39625, 56112, 0, 1, 1, 1, 1),
(39625, 56114, 0, 1, 1, 1, 1),
(39625, 56115, 0, 1, 1, 1, 1),
(39625, 56116, 0, 1, 1, 1, 1);

INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(48337, 56442, 0, 1, 1, 1, 1),
(48337, 56443, 0, 1, 1, 1, 1),
(48337, 56444, 0, 1, 1, 1, 1),
(48337, 56440, 0, 1, 1, 1, 1),
(48337, 56441, 0, 1, 1, 1, 1);

-- Template Updates
UPDATE `creature_template` SET `Scriptname`= 'boss_forgemaster_throngus', `flags_extra`= `flags_extra`| 0x40000000,  `mechanic_immune_mask`= 617299839 WHERE `entry`= 40177;
UPDATE `creature_template` SET `flags_extra`= `flags_extra`| 0x40000000 | 1,  `mechanic_immune_mask`= 617299839, `minlevel`= 87, `maxlevel`= 87 WHERE `entry`= 48702;
-- Cave In Stalker
UPDATE `creature_template` SET `minlevel`= 85, `maxlevel`= 85, `faction`= 7, `unit_flags`= 34078720, `flags_extra`= 131, `ScriptName`= 'npc_throngus_cave_in' WHERE `entry`= 40228;
-- Fixate Stalker
UPDATE `creature_template` SET `minlevel`= 80, `maxlevel`= 80, `faction`= 35, `unit_flags`= 33554432, `flags_extra`= 128 WHERE `entry`= 40255;
-- Fire Patch
UPDATE `creature_template` SET `minlevel`= 80, `maxlevel`= 80, `faction`= 7, `unit_flags`= 33554432, `flags_extra`= 128 WHERE `entry`= 48711;

-- Template Addons
DELETE FROM `creature_template_addon` WHERE `entry` IN (40228, 48711);
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(40228, '74990'),
(48711, '90752');

-- Spells
DELETE FROM `spell_script_names` WHERE `ScriptName` IN
('spell_throngus_mighty_stomp',
'spell_throngus_pick_weapon',
'spell_throngus_flame_arrow_barrage',
'spell_throngus_flaming_arrow',
'spell_throngus_personal_phalanx',
'spell_throngus_personal_phalanx_aoe',
'spell_throngus_fixate_effect',
'spell_throngus_burning_dual_blades',
'spell_throngus_disorienting_roar',
'spell_throngus_encumbered',
'spell_throngus_impaling_slam');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(74984, 'spell_throngus_mighty_stomp'),
(75000, 'spell_throngus_pick_weapon'),
(74945, 'spell_throngus_flame_arrow_barrage'),
(74944, 'spell_throngus_flaming_arrow'),
(90810, 'spell_throngus_flaming_arrow'),
(74908, 'spell_throngus_personal_phalanx'),
(74914, 'spell_throngus_personal_phalanx_aoe'),
(75071, 'spell_throngus_fixate_effect'),
(74981, 'spell_throngus_burning_dual_blades'),
(90738, 'spell_throngus_burning_dual_blades'),
(74976, 'spell_throngus_disorienting_roar'),
(90737, 'spell_throngus_disorienting_roar'),
(75007, 'spell_throngus_encumbered'),
(90729, 'spell_throngus_encumbered'),
(75056, 'spell_throngus_impaling_slam'),
(90756, 'spell_throngus_impaling_slam');

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID`= 40177;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `Comment`) VALUES
(40177, 0, 0, 'NEIN! Throngus wieder ausgepeitscht, wenn er nicht fertig wird!', 14, 0, 100, 0, 0, 18943, 47777, 'Forgemaster Throngus - Say Aggro'),
(40177, 1, 0, 'You not get through defenses!', 14, 0, 100, 0, 0, 18947, 47781, 'Forgemaster Throngus - Say Personal Phalanx'),
(40177, 2, 0, 'Oh, this gonna HURT!', 14, 0, 100, 53, 0, 18949, 47782, 'Forgemaster Throngus - Say Mace'),
(40177, 3, 0, 'Throngus SLICE you up!', 14, 0, 100, 0, 0, 18948, 47783, 'Forgemaster Throngus - Say Swords'),
(40177, 4, 0, '|TInterface\\Icons\\inv_shield_76.blp:20|t%s equips his |cFFFF0000Shield|r and gains |cFFFF0000|Hspell:74908|h[Personal Phalanx]|h|r!', 41, 0, 100, 0, 0, 0, 40747, 'Forgemaster Throngus - Announce Personal Phalanx'),
(40177, 5, 0, '|TInterface\\Icons\\inv_mace_15.blp:20|t%s equips his |cFFFF0000Mace|r and is |cFFFF0000|Hspell:75007|h[Encumbered]|h|r!', 41, 0, 100, 53, 0, 0, 40239, 'Forgemaster Throngus - Announce Mace'),
(40177, 6, 0, '|TInterface\\Icons\\ability_dualwield.blp:20|t%s equips his |cFFFF0000Swords|r and gains |cFFFF0000|Hspell:74981|h[Dual Blades]|h|r!', 41, 0, 100, 0, 0, 0, 40746, 'Forgemaster Throngus - Announce Swords'),
(40177, 7, 0, '$n is impaled!', 41, 0, 100, 0, 0, 0, 30718, 'Forgemaster Throngus - Announce Impaled'),
(40177, 8, 0, 'Throngus use your corpse on body. Somewhere...', 14, 0, 100, 0, 0, 18944, 47778, 'Forgemaster Throngus - Slay 1'),
(40177, 8, 1, 'You break easy!', 14, 0, 100, 0, 0, 18945, 47779, 'Forgemaster Throngus - Slay 2'),
(40177, 9, 0, 'Death... Good choice. Not best choice maybe, but better than fail and live.', 14, 0, 100, 0, 0, 18946, 47780, 'Forgemaster Throngus to Player');


-- Conditions
DELETE FROM `conditions` WHERE `SourceEntry` IN (74945, 75071) AND `SourceTypeOrReferenceId`= 13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 74945, 0, 0, 31, 0, 3, 40197, 0, 0, 0, '', 'Flame Arrow Barrage - Target Twilight Archer'),
(13, 1, 75071, 0, 0, 31, 0, 3, 40255, 0, 0, 0, '', 'Fixate Effect - Target Fixate Stalker');

-- Proc Entries
DELETE FROM `spell_proc` WHERE `SpellId` IN (74981, 90738, 74976, 90737, 90759);
INSERT INTO `spell_proc` (`SpellId`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `Cooldown`) VALUES
(74981, 0x00000004, 1, 0, 8400),
(90738, 0x00000004, 1, 0, 8400),
(90759, 0x00000004, 1, 0, 2000);

INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `ProcFlags`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`) VALUES
(74976, 1|2|4|8|16|32|64, 0x00015510, 7, 1, 0),
(90737, 1|2|4|8|16|32|64, 0x00015510, 7, 1, 0);

UPDATE `creature_template` SET  `lootid`= 40177 WHERE `entry`= 40177;
UPDATE `creature_template` SET `lootid`= 48702 WHERE `entry`= 48702;
DELETE FROM creature_loot_template WHERE entry IN (40177, 48702);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(40177, 56119, 0, 1, 1, 1, 1),
(40177, 56118, 0, 1, 1, 1, 1),
(40177, 56120, 0, 1, 1, 1, 1),
(40177, 56121, 0, 1, 1, 1, 1),
(40177, 56122, 0, 1, 1, 1, 1);

INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(48702, 56448, 0, 1, 1, 1, 1),
(48702, 56447, 0, 1, 1, 1, 1),
(48702, 56445, 0, 1, 1, 1, 1),
(48702, 56449, 0, 1, 1, 1, 1),
(48702, 56446, 0, 1, 1, 1, 1);

-- Template Updates
-- Drahga Shadowburner
UPDATE `creature_template` SET `mechanic_immune_mask`= 667893759, `ScriptName`= 'boss_drahga_shadowburner' WHERE `entry`= 40319;
UPDATE `creature_template` SET `mechanic_immune_mask`= 667893759, `minlevel`= 87, `maxlevel`= 87, `flags_extra`= 1 WHERE `entry`= 48784;
-- Invocation of Flame Stalker
UPDATE `creature_template` SET `minlevel`= 85, `maxlevel`= 85, `unit_flags`= 33554432, `flags_extra`= 131 WHERE `entry`= 40355;
-- Valiona
UPDATE `creature_template` SET `InhabitType`= 5, `mechanic_immune_mask`= 667893759, `VehicleId`= 737, `flags_extra`= `flags_extra`|0x00000200, `scriptname`= 'npc_drahga_valiona' WHERE `entry`= 40320;
UPDATE `creature_template` SET `minlevel`= 87, `maxlevel`= 87, `InhabitType`= 7, `mechanic_immune_mask`= 667893759, `VehicleId`= 737, `flags_extra`= `flags_extra`|0x00000200 WHERE `entry`= 48801;
-- Seeping Twilight
UPDATE `creature_template` SET `unit_flags`= 33554432, `flags_extra`= 131 WHERE `entry`= 40365;
-- Devouring Flames
UPDATE `creature_template` SET `unit_flags`= 33554432, `flags_extra`= 131 WHERE `entry`= 48798;
-- Invoked Flaming Spirit
UPDATE `creature_template` SET `scriptname`= 'npc_drahga_invoked_flaming_spirit', `flags_extra`= `flags_extra`|0x00000100|0x00000040|0x40000000, `mechanic_immune_mask`= 1|2|4|16|32|64|128|256|512|1024|2048|4096|8192|65536|8388608, `DamageModifier`= 1  WHERE `entry`= 40357;
UPDATE `creature_template` SET  `minlevel`= 85, `maxlevel`= 85, `flags_extra`= `flags_extra`|0x00000100|0x00000040|0x40000000, `mechanic_immune_mask`= 1|2|4|16|32|64|128|256|512|1024|2048|4096|8192|65536|8388608, `DamageModifier`= 1   WHERE `entry`= 48785;

-- Correct Drahga's position from own sniff
UPDATE `creature` SET `position_x`= -436.9, `position_y`= -699.6, `position_z`= 268.767, `orientation`= 3.401 WHERE `guid`= 340123;

-- Cleanup
DELETE FROM `creature` WHERE `guid`= 340307;
DELETE FROM `creature_addon` WHERE `guid`= 340307;

-- Template Addons
DELETE FROM `creature_template_addon` WHERE `entry` IN (40355, 40365, 40357, 48785);
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(40355, '75222 75232'),
(40365, '75318 75274'),
(40357, '75235'),
(48785, '75235');

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID` IN (40320, 40319);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `Comment`) VALUES
-- Valiona
(40320, 0, 0, 'If they do not kill you, I will do it myself!', 14, 0, 100, 0, 0, 18523, 47769, 'Valiona - Summoned'),
(40320, 1, 0, '|TInterface\\Icons\\spell_fire_twilightflamebreath.blp:20|t%s begins to cast |cFFFF0000|Hspell:90949|h[Devouring Flames]|h|r!', 41, 0, 100, 0, 0, 0, 48982, 'Valiona - Announce Devouring Flames'),
(40320, 2, 0, 'I will not die for you, Drahga.', 14, 0, 100, 0, 0, 18524, 47768, 'Valiona - Flee'),
-- Drahga
(40319, 1, 0, 'I will burn you from the inside out!', 14, 0, 100, 0, 0, 18610, 47760, 'Drahga Shadowburner - Aggro'),
(40319, 2, 0, '|TInterface\\Icons\\spell_fire_elemental_totem.blp:20|t%s Summons an |cFFFF6F00|Hspell:75218|h[Invocation of Flame]|h|r!', 41, 0, 100, 0, 0, 0, 40465, 'Drahga Shadowburner - Announce Invocation'),
(40319, 3, 0, 'BY FIRE BE... BURNED!', 14, 0, 100, 0, 0, 18619, 47766, 'Drahga Shadowburner - Invocation 1'),
(40319, 3, 1, 'INCINERATE THEM, MINIONS!', 14, 0, 100, 0, 0, 18616, 47765, 'Drahga Shadowburner - Invocation 2'),
(40319, 4, 0, 'Dragon, you will do as I command! Catch me!', 14, 0, 100, 22, 0, 18621, 47767, 'Drahga Shadowburner - Valiona Intro'),
(40319, 5, 0, 'You should have come better prepared!', 14, 0, 100, 0, 0, 18612, 47762, 'Drahga Shadowburner - Slay 1'),
(40319, 5, 1, 'An easy kill!', 14, 0, 100, 0, 0, 18611, 47761, 'Drahga Shadowburner - Slay 2'),
(40319, 6, 0, 'Valiona, finish them! Avenge me!', 14, 0, 100, 0, 0, 18614, 47764, 'Drahga Shadowburner - Death');

-- Conditions
DELETE FROM `conditions` WHERE `SourceEntry`= 90950;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ScriptName, Comment) VALUES
(13, 1, 90950, 0, 0, 31, 0, 3, 48798, 0, 0, 0, '', 'Devouring Flames - Target Devouring Flames Stalker');

-- Spell Scripts
DELETE FROM `spell_script_names` WHERE `ScriptName` IN
('spell_drahga_burning_shadowbolt',
'spell_drahga_devouring_flames_aoe');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(75245, 'spell_drahga_burning_shadowbolt'),
(90915, 'spell_drahga_burning_shadowbolt'),
(90945, 'spell_drahga_devouring_flames_aoe');

UPDATE `creature_template` SET `lootid`= 40319 WHERE `entry`= 40319;
UPDATE `creature_template` SET `lootid`= 48784 WHERE `entry`= 48784;
DELETE FROM `creature_loot_template` WHERE `Entry` IN (40319, 48784);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(40319, 56126, 0, 1, 1, 1, 1),
(40319, 56125, 0, 1, 1, 1, 1),
(40319, 56123, 0, 1, 1, 1, 1),
(40319, 56124, 0, 1, 1, 1, 1),
(40319, 56127, 0, 1, 1, 1, 1);

INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(48784, 56450, 0, 1, 1, 1, 1),
(48784, 56453, 0, 1, 1, 1, 1),
(48784, 56451, 0, 1, 1, 1, 1),
(48784, 56452, 0, 1, 1, 1, 1),
(48784, 56454, 0, 1, 1, 1, 1);

-- Template Updates
-- Erudax
UPDATE `creature_template` SET `mechanic_immune_mask`= 667893759, `scriptname`= 'boss_erudax', `flags_extra`= `flags_extra`|1073741824  WHERE `entry`= 40484;
UPDATE `creature_template` SET `minlevel`= 87, `maxlevel`= 87, `mechanic_immune_mask`= 667893759, `flags_extra`= `flags_extra`|1073741824 WHERE `entry`= 48822;
-- Faceless Portal Stalker
UPDATE `creature_template` SET `unit_flags`= 33554432, `flags_extra`= 131 WHERE `entry`= 44314;
UPDATE `creature_template_addon` SET `auras`= '' WHERE `entry`= 44314;
-- Shadow Gale Stalker
UPDATE `creature_template` SET `unit_flags`= 33554432, `flags_extra`= 128 WHERE `entry`= 40567;
-- Faceless Corruptor
UPDATE `creature_template` SET `scriptname`= 'npc_erudax_faceless_corruptor', `mechanic_immune_mask`= 634339327, `flags_extra`= 1073741824 WHERE `entry` IN (40600, 48844);
UPDATE `creature_template` SET `minlevel`= 85, `maxlevel`= 85, `flags_extra`= 1073741824 WHERE `entry` IN (48828, 48845);
-- Alexstrasza's Egg
UPDATE `creature_template` SET `RegenHealth`= 0 WHERE `entry`= 40486;
-- Twilight Hatchling
UPDATE `creature_template` SET `InhabitType`= 4 WHERE `entry` IN (39388, 48832);

-- Conditions
DELETE FROM `conditions` WHERE `SourceEntry` IN (75656, 75664, 91086, 75520, 91049, 75763, 91040, 75809) AND `SourceTypeOrReferenceId` = 13;
INSERT INTO `conditions` (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ScriptName, Comment) VALUES
(13, 1, 75656, 0, 0, 31, 0, 3, 40566, 0, 0, 0, '', 'Shadow Gale Trigger - Target Shadow Gale Controller'),
(13, 1, 75664, 0, 0, 31, 0, 3, 40567, 0, 0, 0, '', 'Shadow Gale - Target Shadow Gale Stalker'),
(13, 1, 91086, 0, 0, 31, 0, 3, 40567, 0, 0, 0, '', 'Shadow Gale - Target Shadow Gale Stalker'),
(13, 1, 75520, 0, 0, 31, 0, 3, 40486, 0, 0, 0, '', 'Twilight Corruption - Target Alexstrasza''s Egg'),
(13, 1, 91049, 0, 0, 31, 0, 3, 40486, 0, 0, 0, '', 'Twilight Corruption - Target Alexstrasza''s Egg'),
(13, 1, 75763, 0, 0, 31, 0, 3, 40484, 0, 0, 0, '', 'Umbral Mending - Target Erduax'),
(13, 1, 91040, 0, 0, 31, 0, 3, 40484, 0, 0, 0, '', 'Umbral Mending - Target Erduax'),
(13, 1, 75809, 0, 0, 31, 0, 3, 40600, 0, 0, 0, '', 'Shield of Nightmares - Target Faceless Corruptor'),
(13, 1, 75809, 0, 0, 31, 0, 3, 48844, 0, 0, 0, '', 'Shield of Nightmares - Target Faceless Corruptor');

DELETE FROM `creature_template_addon` WHERE `entry` IN (39388, 48832);
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(39388, 76192),
(48832, 91044);

-- Spells
DELETE FROM `spell_script_names` WHERE `ScriptName` IN
('spell_erudax_shadow_gale_trigger',
'spell_erudax_shadow_gale',
'spell_erudax_shadow_gale_aura',
'spell_erudax_twilight_corruption');

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(75656, 'spell_erudax_shadow_gale_trigger'),
(75692, 'spell_erudax_shadow_gale'),
(91087, 'spell_erudax_shadow_gale'),
(75694, 'spell_erudax_shadow_gale_aura'),
(75520, 'spell_erudax_twilight_corruption'),
(91049, 'spell_erudax_twilight_corruption');

-- Spell Target Positions
DELETE FROM `spell_target_position` WHERE `ID` IN (75704, 91072);
INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `VerifiedBuild`) VALUES
(75704, 0, 670, -620.443, -827.19, 241.8573, 15595),
(91072, 0, 670, -620.443, -827.19, 241.8573, 15595),
(91072, 1, 670, -620.443, -827.19, 241.8573, 15595);

-- Texts
DELETE FROM `creature_text` WHERE `CreatureID`= 40484;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `Comment`) VALUES
(40484, 0, 0, 'The darkest days are still ahead!', 14, 0, 100, 0, 0, 18638, 47770, 'Erudax - Aggro'),
(40484, 1, 0, '|TInterface\\Icons\\spell_shadow_shadowfury.blp:20|t%s begins to cast |cFFA043E7|Hspell:75694|h[Shadow Gale]|h|r!', 41, 0, 100, 0, 0, 0, 40609, 'Erudax - Announce Shadow Gale'),
(40484, 2, 0, 'F\'lakh ghet! The shadow\'s hunger cannot be sated!', 14, 0, 100, 0, 0, 18644, 47774, 'Erudax - Shadow Gale'),
(40484, 3, 0, 'Come, suffering... Enter, chaos!', 14, 0, 100, 0, 0, 18646, 40612, 'Erudax to Erudax'),
(40484, 4, 0, '%s summons a |cFFFF0000Faceless Guardian|r!', 41, 0, 100, 0, 0, 0, 0, 'Erudax to Erudax'),
(40484, 5, 0, '|TInterface\\Icons\\spell_shadow_sacrificialshield.blp:20|t%s begins to cast |cFF006EFD|Hspell:75809|h[Shield of Nightmares]|h|r on the |cFF006EFDFaceless Corruptor|r!', 41, 0, 100, 0, 0, 0, 40610, 'Erudax - Shield of Nightmares'),
(40484, 6, 0, 'Flesh for the offering!', 14, 0, 100, 0, 0, 18640, 47772, 'Erudax - Slay 1'),
(40484, 6, 1, 'Ahahaha!', 16, 0, 100, 0, 0, 18639, 47771, 'Erudax - Slay 2'),
(40484, 7, 0, 'Ywaq maq oou; ywaq maq ssaggh. Yawq ma shg\'fhn.', 14, 0, 100, 0, 0, 18641, 47773, 'Erudax - Death');

-- Loot
UPDATE `creature_template` SET `lootid`= 40484 WHERE `entry`= 40484;
UPDATE `creature_template` SET `lootid`= 48822 WHERE `entry`= 48822;
DELETE FROM `creature_loot_template` WHERE `entry` IN (40484, 48822);
INSERT INTO `creature_loot_template` (`Entry`, `Reference`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(40484, 404840, 100, 1, 0, 2, 2),
(48822, 488220, 100, 1, 0, 2, 2);

DELETE FROM `reference_loot_template` WHERE `entry` IN (404840, 488220);
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Chance`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
-- Normal
(404840, 56133, 0, 1, 1, 1, 1),
(404840, 56128, 0, 1, 1, 1, 1),
(404840, 56135, 0, 1, 1, 1, 1),
(404840, 56129, 0, 1, 1, 1, 1),
(404840, 56136, 0, 1, 1, 1, 1),
(404840, 56138, 0, 1, 1, 1, 1),
(404840, 56132, 0, 1, 1, 1, 1),
(404840, 56130, 0, 1, 1, 1, 1),
(404840, 56131, 0, 1, 1, 1, 1),
(404840, 56137, 0, 1, 1, 1, 1),
-- Heroic
(488220, 56460, 0, 1, 1, 1, 1),
(488220, 56455, 0, 1, 1, 1, 1),
(488220, 56464, 0, 1, 1, 1, 1),
(488220, 56457, 0, 1, 1, 1, 1),
(488220, 56463, 0, 1, 1, 1, 1),
(488220, 56462, 0, 1, 1, 1, 1),
(488220, 56458, 0, 1, 1, 1, 1),
(488220, 56459, 0, 1, 1, 1, 1),
(488220, 56456, 0, 1, 1, 1, 1),
(488220, 56461, 0, 1, 1, 1, 1),
(488220, 52078, 100, 1, 2, 1, 1); -- Chaos Orb

DELETE FROM `spell_script_names` WHERE `ScriptName`= 'spell_umbris_blitz';

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(74670, 'spell_umbriss_blitz'),
(90250, 'spell_umbriss_blitz');

-- Creature Enslaved Gronn Brute 40166 SAI
SET @ENTRY := 40166;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 0, 0, 20000, 30000, 30000, 11, 76138, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "When out of combat and timer at the begining between 0 and 20000 ms (and later repeats every 30000 and 30000 ms) - Self: Cast spell 76138 on Self // "),
(@ENTRY, 0, 1, 0, 0, 0, 100, 0, 4000, 5000, 11000, 12000, 11, 76703, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "When in combat and timer at the begining between 4000 and 5000 ms (and later repeats every 11000 and 12000 ms) - Self: Cast spell 76703 on Victim // ");

-- Twilight Beguiler
UPDATE `creature_template` SET `ScriptName`= 'npc_grim_batol_twilight_beguiler' WHERE `entry`= 40167;

DELETE FROM `conditions` WHERE `SourceEntry` IN (76138, 74867, 74884, 76151, 90719) AND `SourceTypeOrReferenceId`= 13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 3, 76138, 0, 0, 31, 0, 3, 40167, 0, 0, 0, '', 'Gronn Knockback Cosmetic - Target Twilight Beguiler'),
(13, 1, 74867, 0, 0, 31, 0, 3, 40166, 0, 0, 0, '', 'Enslave Gronn Cosmetic - Target Enslaved Gronn Brute'),
(13, 1, 74884, 0, 0, 31, 0, 3, 40166, 0, 0, 0, '', 'Enslave Gronn Cosmetic - Target Enslaved Gronn Brute'),
(13, 3, 76151, 0, 0, 31, 0, 3, 40166, 0, 0, 0, '', 'Beguile - Target Enslaved Gronn Brute'),
(13, 3, 90719, 0, 0, 31, 0, 3, 40166, 0, 0, 0, '', 'Beguile - Target Enslaved Gronn Brute');

