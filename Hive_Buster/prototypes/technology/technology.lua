data:extend({
	{
		type = "technology",
		name = "Hive_Buster",
		icon_size = 128,
		icon = "__Hive_Buster__/graphics/technology/Hive_Buster.png",
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "Hive_Buster"
			},
			{
				type = "unlock-recipe",
				recipe = "Hive_Buster_Basic_Ammo"
			},
			{
				type = "unlock-recipe",
				recipe = "Hive_Buster_Poison_Ammo"
			},

		},
		prerequisites = {"military-3", "alien-technology"},
		unit = 
		{
			count = 100,
			ingredients =
			{
				{"science-pack-1", 2},
				{"science-pack-2", 2},
				{"science-pack-3", 1},
				{"alien-science-pack", 3}
			},
			time = 30,
		}
	},
	
})
