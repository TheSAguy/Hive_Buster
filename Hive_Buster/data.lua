
---------------------------------------------------------------
----------------------- Load Prototypes -----------------------
---------------------------------------------------------------

if not bobmods then bobmods = {} end
if not bobmods.lib then bobmods.lib = {} end

if not HB_Config then HB_Config = {} end
if not HB_Config.mod then HB_Config.mod = {} end
if not NE_Functions then NE_Functions = {} end

require ("scripts.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
require ("scripts.item-functions") -- From Bob's Libary 
require ("scripts.recipe-functions") -- From Bob's Libary 
require ("scripts.technology-functions") -- From Bob's Libary 
require ("scripts.NE_Functions") -- NE Functions

-- Items Groups
require("prototypes.hive_buster.item-group")

-- Hive Buster
require("prototypes.hive_buster.item")
require("prototypes.hive_buster.recipe")
require("prototypes.hive_buster.entity")
require("prototypes.technology.technology")

-- Projectiles
require("prototypes.hive_buster.projectiles-item")
require("prototypes.hive_buster.projectiles-recipe")
require("prototypes.hive_buster.projectiles-entity")



