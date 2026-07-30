
| Name | Previed |
| :--- | :---: |
| **fluid inserter base 2 directions horizontal** | ![fluid inserter base 2 directions horizontal](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/steam_inserter/fluid-inserter-base-2-directions-horizontal.png) |
| **fluid inserter base 2 directions horizontal remnants** | ![fluid inserter base 2 directions horizontal remnants](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/steam_inserter/fluid-inserter-base-2-directions-horizontal-remnants.png) |
| **fluid inserter base 2 directions vertical** | ![fluid inserter base 2 directions vertical](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/steam_inserter/fluid-inserter-base-2-directions-vertical.png) |
| **fluid inserter base 2 directions vertical remnants** | ![fluid inserter base 2 directions vertical remnants](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/steam_inserter/fluid-inserter-base-2-directions-vertical-remnants.png) |
| **fluid inserter base 4 directions** | ![fluid inserter base 4 directions](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/steam_inserter/fluid-inserter-base-4-directions.png) |
| **fluid inserter base 4 directions remnants** | ![fluid inserter base 4 directions remnants](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/steam_inserter/fluid-inserter-base-4-directions-remnants.png) |

### Preview:

![fluid inserter presentation](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/steam_inserter/steam_inserter_presentation.png)
![fluid inserter presentation remnants](https://raw.githubusercontent.com/Talandar99/talandar_mit_factorio_graphics_and_code/refs/heads/main/graphics/steam_inserter/steam_inserter_presentation_remnants.png)

how to use graphic?
```lua
-- define function with "pipe connectors first"
local function steam_inserter_pipe_straight()
	return {
		north = {
			filename = "__steam_inserter__/graphics/fluid-inserter-base-2-directions-vertical.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, 32),
			scale = 0.5,
		},
		west = {
			filename = "__steam_inserter__/graphics/fluid-inserter-base-2-directions-horizontal.png",
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
			filename = "__steam_inserter__/graphics/fluid-inserter-base-4-directions.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, 32),
			scale = 0.5,
		},
		west = {
			filename = "__steam_inserter__/graphics/fluid-inserter-base-4-directions.png",
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
