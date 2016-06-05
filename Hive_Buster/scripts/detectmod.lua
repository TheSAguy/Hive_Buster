-----------------------
--Cross Mod Detection--
-----------------------

if not HB_Config then HB_Config = {} end
if not HB_Config.mod then HB_Config.mod = {} end

-----------------------

--Detect DyTechWar
if data.raw["unit"]["young-berserk-biter"] ~= nil and data.raw["unit"]["young-berserk-spitter"] ~= nil then
	HB_Config.mod.DyTechWar=true
else 
	HB_Config.mod.DyTechWar=false
end

--Detect DyTech Core
if data.raw["item"]["stone-gear-wheel"] ~= nil then
	HB_Config.mod.DyTechCore=true
else 
	HB_Config.mod.DyTechCore=false
end

--Detect Bob's Enemies
if data.raw["unit"]["bob-big-piercing-biter"] ~= nil and data.raw["unit"]["bob-big-electric-spitter"] ~= nil then
	HB_Config.mod.BobEnemies=true
else 
	HB_Config.mod.BobEnemies=false
end

--Detect Supreme Warfare
if data.raw["technology"]["artillery"] ~= nil and data.raw["technology"]["advanced-artillery"] ~= nil then
	HB_Config.mod.SupremeWarfare=true
else 
	HB_Config.mod.SupremeWarfare=false
end


--Detect N.E. Enemies
if data.raw["unit"]["small-biter-Mk2"] ~= nil or data.raw["unit"]["small-spitter-Mk2"] ~= nil or data.raw["logistic-container"]["Artifact-collector-area"] ~= nil then
	HB_Config.mod.NEEnemies=true
else 
	HB_Config.mod.NEEnemies=false
end


--Detect N.E. Buildings
if data.raw["radar"]["AlienControlStation"] ~= nil and data.raw["assembling-machine"]["Alien_Hatchery"] ~= nil then
	HB_Config.mod.NEBuildings=true
else 
	HB_Config.mod.NEBuildings=false
end