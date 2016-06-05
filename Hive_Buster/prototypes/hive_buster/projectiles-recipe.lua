data:extend({

  -- Hive Buster Ammo
 {
    type= "recipe",
    name= "Hive_Buster_Basic_Ammo",
    enabled = "false",
	energy_required = 4,
	ingredients = {{"iron-plate", 10}, {"rocket", 10}},
    result = "Hive_Buster_Basic_Ammo",
	result_count = 2,
 },
 {
    type= "recipe",
    name= "Hive_Buster_Poison_Ammo",
    enabled = "false",
	energy_required = 8,
	ingredients = {{"Hive_Buster_Basic_Ammo", 1},{"poison-capsule", 5}, {"explosive-rocket", 5}},
    result = "Hive_Buster_Poison_Ammo",
	result_count = 2,
 },

 })