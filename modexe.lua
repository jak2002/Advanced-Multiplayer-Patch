-- Changelog of MOD:

-- First Release 0.1a
-- Fully Client Damage System [CSD System] [ClientStuffLib, GameRulesLib, BasicWeapon]
-- Now you can walk in the sight [BasicWeapon]
-- You can't pick up weapons if you already have them or all the slots are full. [BasePickup]

-- Version 0.2
-- Cosmetics:
-- Changable FOV [HudCommon, ClientStuff]
-- Added Hit and Headshot Sounds [HudCommon, GameRulesLib, ClientStuffLib]
-- Headshot kills are shown in Kill Feed [GameRulesLib, ClientStuffLib, HudCommon]
-- New sprite crosshair [BasicWeapon]

-- Fixes and etc:
-- Rebalanced weapons: SniperRifle, RL, OICW, AG36, Shotgun [WeaponParams]
-- Fall damage reduced [BasicPlayer]
-- Team Based Binoculars [MoTrackLayer, ClientStuffLib, GameRulesLib, ClientStuffTeamLib]
-- OICW, AG36 and RL now work the same as in SP. [OICW, AG36, RL]
-- Now you can't run in scopes [XPlayer, BasicWeapon]
-- CD Authorisation Check Disabled [ScriptObjectGame]
-- Enhanced CSD System [ClientStuffLib, GameRulesLib, BasicWeapon]
-- Following variables have been updated: gr_HeadshotMultiplier = 4; gr_max_average_ping = 0; gr_RespawnTime = 10; gr_headshot_message_private = 0; [CreateVariable] 

-- TEMP move these to C++
Game:CreateVariable("hud_crosshair_smooth",1)
Game:CreateVariable("hud_crosshair_color_r",1)
Game:CreateVariable("hud_crosshair_color_g",1)
Game:CreateVariable("hud_crosshair_color_b",0)
Game:CreateVariable("hud_crosshair_tlike",0)
Game:CreateVariable("hud_crosshair_thickness",1)