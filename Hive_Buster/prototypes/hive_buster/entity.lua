require "util"

inv_extension =
{
  filename = "__Hive_Buster__/graphics/entity/icon.png",
  priority = "medium",
  width = 1,
  height = 1,
  direction_count = 1,
  frame_count = 1,
  axially_symmetrical = false,
  shift = {0, 0}
}
data:extend({

	-- Hive Buster Artillery Range Overlay
   {
		type = "container",
		name = "Hive_Buster_Area",
		icon = "__Hive_Buster__/graphics/entity/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = {mining_time = 5, result = "Hive_Buster_Area"},
		max_health = 450,
		corpse = "big-remnants",
		dying_explosion = "massive-explosion",
		resistances = {},
		collision_box = {{-3.8, -3.8}, {3.8, 3.8}},
		selection_box = {{0, 0}, {0, 0}},
		order = "i[items][Hive_Buster]",
		inventory_size = 1,
		picture =
		{
			filename = "__Hive_Buster__/graphics/entity/radius75.png",
			priority = "extra-high",
			scale = 3,
			width = 1600,
			height = 1600,

		}
	},

	-- Hive Buster Artillery
   {
		type = "container",
		name = "Hive_Buster",
		icon = "__Hive_Buster__/graphics/entity/icon.png",
		--flags = {"placeable-neutral", "placeable-player", "player-creation"},
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-repairable"},
		selectable_in_game = false,
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = {mining_time = 10, result = "Hive_Buster_Area"},
		max_health = 450,
		corpse = "big-remnants",
		dying_explosion = "massive-explosion",
		resistances = {},
		collision_box = {{0, 0}, {0, 0}},
		selection_box = {{0, 0}, {0, 0}},
		order = "i[items][Hive_Buster]",
		inventory_size = 1,
		picture =
		{
			filename = "__Hive_Buster__/graphics/entity/picture.png",
			priority = "extra-high",
			scale = 1,
			width = 384,
			height = 384,
			shift = {1.125, -1.625}
		}
	},
	--Inventory

		{
		type = "ammo-turret",
		name = "Hive_Busteri",
		icon = "__Hive_Buster__/graphics/entity/icon.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = {mining_time = 10, result = "Hive_Buster_Area"},
		max_health = 450,
		corpse = "big-remnants",
		dying_explosion = "massive-explosion",
		automated_ammo_count = 10,
		resistances = {},
		collision_box = {{-4.25, -4.25}, {4.25, 4.25}},
		selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
		order = "i[items][Hive_Buster]",
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "Hive_Buster_Ammo",
			cooldown = 2,
			range = 0,
			projectile_creation_distance = 1.8,
			action ={}
		},
		folding_speed = 0.08,
		folded_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),

	},
		---- Radar
  {
    type = "radar",
    name = "Hive_Busterr",
    icon = "__Hive_Buster__/graphics/entity/icon.png",
	flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-repairable"},
	selectable_in_game = false,
    minable = {mining_time = 5, result = "Hive_Buster_Area"},
	max_health = 450,
	corpse = "big-remnants",
	dying_explosion = "massive-explosion",
	resistances = {},
	collision_box = {{-4.0, -4.0}, {4.0, 4.0}},
	selection_box = {{-4.25, -4.25}, {4.25, 4.25}},
	order = "i[items][Hive_Buster]",
    energy_per_sector = "22MJ",
    max_distance_of_nearby_sector_revealed = 5,
    max_distance_of_sector_revealed = 5,
    energy_per_nearby_scan = "400kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "6kW",
    pictures =
	
    {
      filename = "__Hive_Buster__/graphics/entity/icon.png",
      priority = "low",
      width = 1,
      height = 1,
      axially_symmetrical = false,
      apply_projection = false,
      direction_count = 1,
      line_length = 1,
      shift = {0, -0}
    },

  },
  
	
	
	
})