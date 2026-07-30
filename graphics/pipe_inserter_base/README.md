### Preview:

![pipe inserter presentation](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/pipe_inserter_base/steam_inserter_presentation.png)
![pipe inserter presentation remnants](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/pipe_inserter_base/steam_inserter_presentation_remnants.png)

| Name | Previed |
| :--- | :---: |
| **pipe inserter base 2 directions horizontal** | ![pipe inserter base 2 directions horizontal](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/pipe_inserter_base/pipe-inserter-base-2-directions-horizontal.png) |
| **pipe inserter base 2 directions horizontal remnants** | ![pipe inserter base 2 directions horizontal remnants](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/pipe_inserter_base/pipe-inserter-base-2-directions-horizontal-remnants.png) |
| **pipe inserter base 2 directions vertical** | ![pipe inserter base 2 directions vertical](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/pipe_inserter_base/pipe-inserter-base-2-directions-vertical.png) |
| **pipe inserter base 2 directions vertical remnants** | ![pipe inserter base 2 directions vertical remnants](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/pipe_inserter_base/pipe-inserter-base-2-directions-vertical-remnants.png) |
| **pipe inserter base 4 directions** | ![pipe inserter base 4 directions](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/pipe_inserter_base/pipe-inserter-base-4-directions.png) |
| **pipe inserter base 4 directions remnants** | ![pipe inserter base 4 directions remnants](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/pipe_inserter_base/pipe-inserter-base-4-directions-remnants.png) |


### how to use graphic?
```lua
-- define function with "pipe connectors first"
local function steam_inserter_pipe_straight()
	return {
		north = {
			filename = "__steam_inserter__/graphics/pipe-inserter-base-2-directions-vertical.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, 32),
			scale = 0.5,
		},
		west = {
			filename = "__steam_inserter__/graphics/pipe-inserter-base-2-directions-horizontal.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(32, 0),
			scale = 0.5,
		},
		south = util.empty_sprite(),
		east = util.empty_sprite(),
	}
end

local function steam_inserter_pipe_cross()
	return {
		north = {
			filename = "__steam_inserter__/graphics/pipe-inserter-base-4-directions.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, 32),
			scale = 0.5,
		},
		west = {
			filename = "__steam_inserter__/graphics/pipe-inserter-base-4-directions.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(32, 0),
			scale = 0.5,
		},
		south = util.empty_sprite(),
		east = util.empty_sprite(),
	}
end
```
...
```lua
-- then you can use it later in code like this
fluid_box = {
	filter = "steam",
	pipe_picture = steam_inserter_pipe_straight(),
	pipe_covers = pipecoverspictures(),
	always_draw_covers = false,
	volume = 100,
	pipe_connections = {
		{ direction = defines.direction.east, position = { 0, 0 } },
		{ direction = defines.direction.west, position = { 0, 0 } },
	},
	production_type = "input-output",
},
```
...
```lua
-- or like this
fluid_box = {
	filter = "steam",
	pipe_picture = steam_inserter_pipe_cross(),
	pipe_covers = pipecoverspictures(),
	always_draw_covers = false,
	volume = 100,
	pipe_connections = {
		{ direction = defines.direction.north, position = { 0, 0 } },
		{ direction = defines.direction.south, position = { 0, 0 } },
		{ direction = defines.direction.east, position = { 0, 0 } },
		{ direction = defines.direction.west, position = { 0, 0 } },
	},
	production_type = "input-output",
},
```
you can also just check example mod here: ![link](https://github.com/Talandar99/talandar_mit_factorio_graphics_and_code/tree/main/code_examples/steam_inserter)
