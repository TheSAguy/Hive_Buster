


------- Adds a Biological Hive Buster Ammo
if HB_Config.mod.NEEnemies then

-- Add Bio Projectile
	require("prototypes.hive_buster.bio-projectile")
	bobmods.lib.add_technology_recipe ("Hive_Buster", "Hive_Buster_Bio_Ammo")

	
end

------- Changes Hive Buster Recipe
if HB_Config.mod.NEEnemies then

	bobmods.lib.remove_recipe_item ("Hive_Buster", "advanced-circuit")
	bobmods.lib.remove_recipe_item ("Hive_Buster", "steel-plate")
	bobmods.lib.add_new_recipe_item ("Hive_Buster", {type="item", name="Building_Materials", amount=30})

	data.raw.recipe["Hive_Buster_Bio_Ammo"].category = "crafting-with-fluid"
	bobmods.lib.remove_recipe_item ("Hive_Buster_Bio_Ammo", "alien-artifact")
	bobmods.lib.add_new_recipe_item ("Hive_Buster_Bio_Ammo", {type="fluid", name="NE_alien_toxin", amount=50})
end
