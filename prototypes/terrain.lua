local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local config = require("__arrakis_my_dune__.prototypes.-config")






local lava_stone_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = lava_tile_type_names,
    transition_group = lava_transition_group_id,
    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone.png",
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__arrakis_my_dune__/graphics/terrain/lava-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false
  }
}


local function transition_masks()
  return {
    mask_spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
    mask_layout =
    {
      scale = 0.5,
      inner_corner =
      {
        count = 8,
      },
      outer_corner =
      {
        count = 8,
        x = 64*9
      },
      side =
      {
        count = 8,
        x = 64*9*2
      },
      u_transition =
      {
        count = 1,
        x = 64*9*3
      },
      o_transition =
      {
        count = 1,
        x = 64*9*4
      }
    }
  }
end







data:extend({
  {
    type = "item-subgroup",
    name = "arrakis-tiles",
    group = "tiles",
    order = "c"
  },

-- HIGH ROCKS
  {
    name = "arrakis-high-dust",
    type = "tile",
    order = "b[natural]-a[dust]",
    subgroup = "arrakis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {
      probability_expression = "fulgora_scrap_medium + max(0, fulgora_natural, 2 * fulgora_mesa * fulgora_pyramids) * 2 - 0.9 + fulgora_rock + fulgora_road_dust * fulgora_sprawl"
    },
    layer = 6,
    map_color = {155, 127, 98},
    vehicle_friction_modifier = 4,
    absorptions_per_second = config.ABSORPTION_ARRAKIS_HIGH_DUST,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__arrakis_my_dune__/graphics/terrain/arrakis-dust.png",
        line_length = 8,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 8,
      material_texture_height_in_tiles = 8
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__space-age__/sound/walking/soft-sand", 9, 0.6, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    ambient_sounds = sand_ambient_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  {
    name = "arrakis-high-dunes",
    type = "tile",
    order = "b[natural]-b[dunes]",
    subgroup = "arrakis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "50 * fulgora_oil_mask * water_base(fulgora_coastline, 1000)"},
    --autoplace = {probability_expression = "1 + fulgora_dunes"},
    layer = 7,
    map_color={141, 125, 91},
    vehicle_friction_modifier = 4,
    absorptions_per_second = config.ABSORPTION_ARRAKIS_HIGH_DUNES,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__arrakis_my_dune__/graphics/terrain/arrakis-dunes.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/sand", 9, 0.8, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    ambient_sounds = sand_ambient_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  {
    name = "arrakis-high-sand",
    type = "tile",
    order = "b[natural]-c[sand]",
    subgroup = "arrakis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {
      probability_expression = "1 - fulgora_dunes"
    },
    layer = 8,
    map_color={169, 131, 86},
    vehicle_friction_modifier = 4,
    absorptions_per_second = config.ABSORPTION_ARRAKIS_HIGH_SAND,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__arrakis_my_dune__/graphics/terrain/arrakis-sand.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/sand", 9, 0.8, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    ambient_sounds = sand_ambient_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  {
    name = "arrakis-high-rock",
    type = "tile",
    order = "b[natural]-d[rock]",
    subgroup = "arrakis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {
      probability_expression = "0.8 + fulgora_rock * 2 - max(0, fulgora_mix_oil) * 6"
    },
    layer = 9,
    map_color={171, 121, 69},
    vehicle_friction_modifier = 4,
    absorptions_per_second = config.ABSORPTION_ARRAKIS_HIGH_ROCK,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__arrakis_my_dune__/graphics/terrain/arrakis-rock.png",
        line_length = 8,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 8,
      material_texture_height_in_tiles = 8
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__space-age__/sound/walking/rocky-stone", 10, 0.8, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = tile_sounds.landing.rock,
    driving_sound = stone_driving_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },

-- DESERT - LOW
  {
    name = "arrakis-low-dunes2",
    type = "tile",
    order = "b[natural]-b[dunes]",
    subgroup = "arrakis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {
      probability_expression = "1 + fulgora_dunes"
    },
    layer = 7,
    map_color={141, 125, 91},
    vehicle_friction_modifier = 4,
    absorptions_per_second = config.ABSORPTION_ARRAKIS_LOW_DUNES2,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__arrakis_my_dune__/graphics/terrain/arrakis-dunes2.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/sand", 9, 0.8, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    ambient_sounds = sand_ambient_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  {
    name = "arrakis-low-sand2",
    type = "tile",
    order = "b[natural]-c[sand]",
    subgroup = "arrakis-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "100 * fulgora_oil_mask * water_base(fulgora_coastline - 90 - fulgora_coastline_drop / 2, 2000)"},
    --autoplace = {probability_expression = "1 - fulgora_dunes"},
    layer = 8,
    map_color={169, 131, 86},
    vehicle_friction_modifier = 4,
    absorptions_per_second = config.ABSORPTION_ARRAKIS_LOW_SAND2,
    sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__arrakis_my_dune__/graphics/terrain/arrakis-sand2.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = fulgora_rock_sand_transitions,
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/sand", 9, 0.8, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    ambient_sounds = sand_ambient_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },

})






--table.insert(lava_tile_type_names, "arrakis-lava")
--table.insert(water_tile_type_names, "arrakis-lava")
--table.insert(water_tile_type_names, "arrakis-hot-swamp")
