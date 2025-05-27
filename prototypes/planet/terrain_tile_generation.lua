local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local config = require("__arrakis_my_dune__.prototypes.-config")


--TRANSITION MASK
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




--TILE DEFINITIONS
data:extend({
  --SORTING GROUP FOR ARRAKIS TILES
  {
    type = "item-subgroup",
    name = "arrakis-tiles",
    group = "tiles",
    order = "c"
  },
  --DEBUG TILES
  {
    type = "tile",
    name = "debugtiles",
    subgroup = "arrakis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = 100,
    map_color = {r=10, g=10, b=10},
    autoplace = {
      probability_expression = "arrakis_black_acid_geyser_spots"
    },
    variants = {
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
    }
  },
  -- ROCKY-PLATEAU TILES
  {
    type = "tile",
    name = "arrakis-rocky-plateau",
    subgroup = "arrakis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = 100,
    map_color = {r=80, g=80, b=80},
    autoplace = {
      probability_expression = "arrakis_rocky_mask2"
    },
    variants = {
      transition = transition_masks(),
      material_background =
      {
        picture = "__arrakis_my_dune__/graphics/terrain/arrakis-rock3.png",
        line_length = 8,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 8,
      material_texture_height_in_tiles = 8
    }
  },
  -- DESERT TILES
  {
    type = "tile",
    name = "arrakis-desert",
    subgroup = "arrakis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = 10,
    map_color = {r=153, g=131, b=93},
    autoplace = {
      probability_expression = "arrakis_desert_mask"
    },
    variants = {
      transition = transition_masks(),
      material_background =
      {
        picture = "__arrakis_my_dune__/graphics/terrain/arrakis-desert1.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    }
  },
  -- DEEP DESERT TILES 1
  {
    type = "tile",
    name = "arrakis-deep-desert",
    subgroup = "arrakis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = 1,
    map_color = {r=172, g=153, b=119},
    autoplace = {
      probability_expression = "arrakis_deep_desert_mask2"
    },
    variants = {
      transition = transition_masks(),
      material_background =
      {
        picture = "__arrakis_my_dune__/graphics/terrain/arrakis-deep-desert1.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    }
  },
  -- DEEP DESERT TILES 2
  {
    type = "tile",
    name = "arrakis-deep-desert2",
    subgroup = "arrakis-tiles",
    collision_mask = tile_collision_masks.ground(),
    layer = 2,
    map_color = {r=171, g=153, b=125},
    autoplace = {
      probability_expression = "arrakis_decorative_striped_desert"
    },
    variants = {
      transition = transition_masks(),
      material_background =
      {
        picture = "__arrakis_my_dune__/graphics/terrain/arrakis-deep-desert2.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    }
  },

})
