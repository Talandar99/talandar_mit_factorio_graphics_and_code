local megastructure_stages = {
	{
		name = "megastructure-scaffolding",
		upgrade_recipe = {
			energy_required = 10,
			ingredients = {
				{ type = "item", name = "steel-plate", amount = 200 },
				{ type = "item", name = "concrete", amount = 100 },
			},
		},
	},
	{
		name = "megastructure-construction-stage-1",
		upgrade_recipe = {
			energy_required = 20,
			ingredients = {
				{ type = "item", name = "low-density-structure", amount = 50 },
				{ type = "item", name = "steel-plate", amount = 200 },
			},
		},
	},
	{
		name = "megastructure-construction-stage-2",
		upgrade_recipe = {
			energy_required = 30,
			ingredients = {
				{ type = "item", name = "electric-engine-unit", amount = 40 },
				{ type = "item", name = "steel-plate", amount = 200 },
			},
		},
	},
	{
		name = "megastructure-construction-stage-3",
		upgrade_recipe = {
			energy_required = 40,
			ingredients = {
				{ type = "item", name = "processing-unit", amount = 50 },
				{ type = "item", name = "electric-engine-unit", amount = 40 },
				{ type = "item", name = "radar", amount = 5 },
			},
		},
	},
}

data:extend({
	{
		type = "recipe-category",
		name = "megastructure-building",
	},
	{
		type = "item",
		name = "megastructure-scaffolding",
		icon = "__space_megastructure__/graphics/megastructure-scaffolding-icon.png",
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = "space-platform",
		order = "a[megastructure]",
		place_result = "megastructure-scaffolding",
		stack_size = 10,
	},
})

for i, stage in ipairs(megastructure_stages) do
	local entity_name = stage.name

	local entity = {
		type = "assembling-machine",
		name = entity_name,
		icon = "__space_megastructure__/graphics/" .. entity_name .. "-icon.png",
		icon_size = 64,
		icon_mipmaps = 4,
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 1, result = "megastructure-scaffolding" },
		max_health = 1000 + (i * 1000),
		collision_box = { { -5.4, -5.4 }, { 5.4, 5.4 } },
		selection_box = { { -5.5, -5.5 }, { 5.5, 5.5 } },
		crafting_categories = { "megastructure-building" },
		crafting_speed = 1,
		energy_source = { type = "electric", usage_priority = "secondary-input" },
		energy_usage = "5MW",
		surface_conditions = {
			{ property = "pressure", min = 0, max = 0 },
		},
		show_recipe_icon = false,
		created_effect = {
			type = "direct",
			action_delivery = {
				type = "instant",
				source_effects = {
					type = "script",
					effect_id = "megastructure-built",
				},
			},
		},
		graphics_set = {
			animation = {
				layers = {
					{
						filename = "__space_megastructure__/graphics/" .. entity_name .. ".png",
						priority = "high",
						width = 704,
						height = 704,
						frame_count = 1,
						line_length = 1,
						shift = util.by_pixel(0, 0),
						scale = 0.5,
					},
				},
			},
		},
	}

	if stage.upgrade_recipe then
		entity.fixed_recipe = "megastructure-construct-" .. i
	end

	data:extend({ entity })

	if stage.upgrade_recipe then
		data:extend({
			{
				type = "recipe",
				name = "megastructure-construct-" .. i,
				icon = "__space_megastructure__/graphics/" .. entity_name .. "-icon.png",
				icon_size = 64,
				icon_mipmaps = 4,
				categories = { "megastructure-building" },
				energy_required = stage.upgrade_recipe.energy_required,
				enabled = true,
				ingredients = stage.upgrade_recipe.ingredients,
				results = {},
				raise_on_crafted = true,
				hidden = true,
				hidden_in_factoriopedia = true,
				hide_from_player_crafting = true,
			},
		})
	end
end

data:extend({
	{
		type = "assembling-machine",
		name = "megastructure",
		icon = "__space_megastructure__/graphics/megastructure-icon.png",
		icon_size = 64,
		icon_mipmaps = 4,
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 5, result = "megastructure-scaffolding" },
		max_health = 10000,
		collision_box = { { -5.4, -5.4 }, { 5.4, 5.4 } },
		selection_box = { { -5.5, -5.5 }, { 5.5, 5.5 } },
		crafting_categories = { "advanced-crafting" },
		crafting_speed = 5,
		energy_source = { type = "electric", usage_priority = "secondary-input" },
		energy_usage = "50MW",
		surface_conditions = {
			{ property = "pressure", min = 0, max = 0 },
		},
		show_recipe_icon = false,
		created_effect = {
			type = "direct",
			action_delivery = {
				type = "instant",
				source_effects = {
					type = "script",
					effect_id = "megastructure-built",
				},
			},
		},
		graphics_set = {
			animation = {
				layers = {
					{
						filename = "__space_megastructure__/graphics/megastructure.png",
						priority = "high",
						width = 704,
						height = 704,
						frame_count = 1,
						line_length = 1,
						shift = util.by_pixel(0, 0),
						scale = 0.5,
					},
				},
			},
		},
	},
})
