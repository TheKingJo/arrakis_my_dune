-- NOISE EXPRESSIONS FOR USE IN terrain_tile_definitions.lua, THIS DEFINES TILE SPAWN PROBABILITY
data:extend({
  --[[{
  type = "noise-function",
  name = "geyser_spot_noise",
  parameters = {"seed", "count", "skip_offset", "region_size", "density", "radius", "favorability"},
  expression = "spot_noise{\z
    x = x,\z
    y = y,\z
    seed0 = map_seed,\z
    seed1 = seed,\z
    candidate_spot_count = count,\z
    suggested_minimum_candidate_point_spacing = 128,\z
    skip_span = 3,\z
    skip_offset = skip_offset,\z
    region_size = region_size,\z
    density_expression = density,\z
    spot_quantity_expression = radius * radius,\z
    spot_radius_expression = radius,\z
    hard_region_target_quantity = 0,\z
    spot_favorability_expression = favorability,\z
    basement_value = -1,\z
    maximum_spot_basement_radius = radius * 2}"
  },
  {
  type = "noise-expression",
  name = "custom_sulfuric_acid_geyser_spots",
  expression = "geyser_spot_noise{\z
    seed = 8787,\z
    count = 5,\z
    skip_offset = 0,\z
    region_size = 800,\z
    density = 1,\z
    radius = 30 * sqrt(control:sulfuric_acid_geyser:frequency),\z
    favorability = 1}"
  },
  ]]
  {
    type = "noise-expression",
    name = "arrakis_spot_size",
    expression = 8
  },
  {
    type = "noise-expression",
    name = "arrakis_black_acid_geyser_spots",
    expression = "aquilo_spot_noise{seed = 567,\z
                                    count = 80,\z
                                    skip_offset = 0,\z
                                    region_size = 600 + 400 / control:black_acid_geyser:frequency,\z
                                    density = 1,\z
                                    radius = arrakis_spot_size * sqrt(control:black_acid_geyser:size),\z
                                    favorability = 1}"
  },
  {
    type = "noise-expression",
    name = "arrakis_starting_black_acid_geyser",
    expression = "starting_spot_at_angle{angle = aquilo_angle, distance = 40, radius = arrakis_spot_size * 0.8, x_distortion = 0, y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "arrakis_black_acid_geyser_probability",
    expression = "(control:molten_copper_geyser:size > 0)\z
                  * (max(arrakis_starting_black_acid_geyser * 0.08,\z
                         min(arrakis_starting_mask, arrakis_black_acid_geyser_spots) * 0.015))"
  },
  {
    type = "noise-expression",
    name = "arrakis_black_acid_geyser_richness",
    expression = "max(arrakis_starting_black_acid_geyser * 1800000,\z
                      arrakis_black_acid_geyser_spots * 1440000) * control:black_acid_geyser:richness"
  },

  {
  type = "noise-expression",
  name = "arrakis_rocky_mask", --Precalcul
  expression =
    "(arrakis_desert_mask > arrakis_deep_desert_mask + 0.1) * 3 * arrakis_voronoi2"
  },
  {
  type = "noise-expression",
  name = "arrakis_rocky_mask2", --Rocky Tiles
  expression =
    "(arrakis_desert_mask > arrakis_deep_desert_mask + 0.1) * (arrakis_rocky_mask > arrakis_desert_mask) *\
    (1 + 0.1 * multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 902, octaves = 2, persistence = 0.6, input_scale = 1/20}) "
  },
  {
  type = "noise-expression",
  name = "arrakis_desert_mask", --Desert Tiles
  expression =
    "(arrakis_voronoi * (0.92 + 0.08 * multioctave_noise{\
                x = x, y = y,\
                seed0 = map_seed,\
                seed1 = 902,\
                octaves = 2,\
                persistence = 0.6,\
                input_scale = 1/25\
             }))"
  },
  {
  type = "noise-expression", 
  name = "arrakis_deep_desert_mask", --Precalculs
  expression = "1 - arrakis_desert_mask"
  },
  {
  type = "noise-expression", 
  name = "arrakis_deep_desert_mask2", --DeepDesertTiles just a bit above the deepdesert
  expression = "arrakis_deep_desert_mask - 0.1"
  },
  {
  type = "noise-expression",
  name = "arrakis_decorative_striped_desert",
  expression = "(arrakis_deep_desert_mask2 > arrakis_desert_mask + 0.1) * arrakis_deep_desert_mask2 * (0.80 + 0.2 * abs(sin(x * 0.008 + y * 0.014 + 0.3 * multioctave_noise{\
      x = x, y = y,\
      seed0 = map_seed, seed1 = 7722,\
      octaves = 3,\
      persistence = 0.5,\
      input_scale = 1/120\
  }))) * (1.1 + 0.1 * multioctave_noise{\
                x = x, y = y,\
                seed0 = map_seed,\
                seed1 = 902,\
                octaves = 2,\
                persistence = 0.6,\
                input_scale = 1/18\
             })" 
  },
  {
  type = "noise-expression", -- Grid def to align with the spawn
  name = "arrakis_voronoi_grid",
  expression = "600"
  },
  {
  type = "noise-expression",
  name = "arrakis_voronoi_ox",
  expression = "x + arrakis_voronoi_grid / 2"
  },
  {
  type = "noise-expression",
  name = "arrakis_voronoi_oy",
  expression = "y + arrakis_voronoi_grid / 2"
  },

  {
  type = "noise-expression",
  name = "arrakis_voronoi", -- Big island of desert noise
  expression = "abs(voronoi_facet_noise{\z
      x = arrakis_voronoi_ox,\z
      y = arrakis_voronoi_oy,\z
      seed0 = map_seed,\z
      seed1 = 'arrakis-archipel',\z
      grid_size = arrakis_voronoi_grid,\z
      distance_type = 'euclidean',\z
      jitter = 1\z
    })"
  },
  {
  type = "noise-expression",
  name = "arrakis_voronoi2", -- smaller Island of rock
  expression = "abs(voronoi_facet_noise{\
      x = x,\
      y = y,\
      seed0 = map_seed,\
      seed1 = 'arrakis-archipel',\
      grid_size = 200,\
      distance_type = 'euclidean',\
      jitter = 1\
    })"
  },
  {
    type = "noise-expression",
    name = "arrakis_rock_huge",
    expression = "(arrakis_rocky_mask2 > arrakis_desert_mask + 0.1) * min(0.2 * (1 - 0.75 * arrakis_rocky_mask2), - 1.2 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + vulcanus_rock_noise + 0.5 * vulcanus_decorative_knockout)"
  },

})