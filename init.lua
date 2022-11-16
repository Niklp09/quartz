local S = minetest.get_translator("quartz")

--
--  Item Registration
--

--  Quartz Crystal
minetest.register_craftitem("quartz:quartz_crystal", {
	description = S("Quartz Crystal"),
	inventory_image = "quartz_crystal_full.png",
})
minetest.register_craftitem("quartz:quartz_crystal_piece", {
	description = S("Quartz Crystal Piece"),
	inventory_image = "quartz_crystal_piece.png",
})

--
-- Node Registration
--

--  Ore
minetest.register_node("quartz:quartz_ore", {
	description = S("Quartz Ore"),
	tiles = {"default_stone.png^quartz_ore.png"},
	groups = {cracky=3},
	drop = 'quartz:quartz_crystal',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type = "scatter",
	ore = "quartz:quartz_ore",
	wherein = "default:stone",
	clust_scarcity = 10*10*10,
	clust_num_ores = 6,
	clust_size = 5,
	y_min = -31000,
	y_max = -5,
})

-- Quartz Block
minetest.register_node("quartz:block", {
	description = S("Quartz Block"),
	tiles = {"quartz_block.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
})

-- Chiseled Quartz
minetest.register_node("quartz:chiseled", {
	description = S("Chiseled Quartz"),
	tiles = {"quartz_chiseled.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
})

-- Quartz Pillar
minetest.register_node("quartz:pillar", {
	description = S("Quartz Pillar"),
	paramtype2 = "facedir",
	tiles = {"quartz_pillar_top.png", "quartz_pillar_top.png",
		"quartz_pillar_side.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
	on_place = minetest.rotate_node
})

--
-- Crafting
--

-- Quartz Crystal Piece
minetest.register_craft({
	output = '"quartz:quartz_crystal_piece" 3',
	recipe = {
		{'quartz:quartz_crystal'}
	}
})

-- Quartz Block
minetest.register_craft({
	output = '"quartz:block" 4',
	recipe = {
		{'quartz:quartz_crystal', 'quartz:quartz_crystal', ''},
		{'quartz:quartz_crystal', 'quartz:quartz_crystal', ''},
		{'', '', ''}
	}
})

-- Chiseled Quartz
minetest.register_craft({
	output = 'quartz:chiseled 4',
	recipe = {
		{'quartz:block', 'quartz:block', ''},
		{'quartz:block', 'quartz:block', ''},
		{'',             '',             ''},
	}
})

-- Quartz Pillar
minetest.register_craft({
	output = 'quartz:pillar 2',
	recipe = {
		{'quartz:block', '', ''},
		{'quartz:block', '', ''},
		{'', '', ''},
	}
})

--
-- Compatibility with stairsplus
--

if minetest.global_exists("stairsplus") then
	stairsplus:register_all("quartz", "block", "quartz:block", {
		description = "Quartz Block",
		tiles  = {"quartz_block.png"},
		groups = {cracky=3, oddly_breakable_by_hand=1},
		sounds = default.node_sound_glass_defaults()
	})

	stairsplus:register_all("quartz", "chiseled", "quartz:chiseled", {
		description = "Chiseled Quartz",
		tiles  = {"quartz_chiseled.png"},
		groups = {cracky=3, oddly_breakable_by_hand=1},
		sounds = default.node_sound_glass_defaults()
	})

	stairsplus:register_all("quartz", "pillar", "quartz:pillar", {
		description = "Quartz Pillar",
		tiles  = {"quartz_pillar_top.png", "quartz_pillar_top.png",
			"quartz_pillar_side.png"},
			groups = {cracky=3, oddly_breakable_by_hand=1},
		sounds = default.node_sound_glass_defaults()
	})
end
