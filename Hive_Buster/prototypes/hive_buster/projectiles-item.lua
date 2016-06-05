data:extend({

	-- Hive Buster Basic Ammo
	{
		type = "ammo",
		name = "Hive_Buster_Basic_Ammo",
		icon = "__Hive_Buster__/graphics/projectiles/Hive_Buster_Basic_Ammo_Icon.png",
		flags = { "goes-to-main-inventory" },
		ammo_type =
		{
			category = "Hive_Buster_Ammo",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "Hive_Buster_Basic_Ammo",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 75
					}
				}
			}
		},
		subgroup = "ammo",
		order = "a[Hive_Buster_Ammo]-a[Basic]",
		stack_size = 50,
	},

		-- Poison Ammo
	{
		type = "ammo",
		name = "Hive_Buster_Poison_Ammo",
		icon = "__Hive_Buster__/graphics/projectiles/Hive_Buster_Poison_Ammo_Icon.png",
		flags = { "goes-to-main-inventory" },
		ammo_type =
		{
			category = "Hive_Buster_Ammo",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "Hive_Buster_Poison_Ammo",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 75
					}
				}
			}
		},
		subgroup = "ammo",
		order = "a[Hive_Buster_Ammo]-b[Poison]",
		stack_size = 50,
	},

	
})