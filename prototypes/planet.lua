


local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local config = require("__arrakis_my_dune__.prototypes.-config")

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

planet_map_gen.arrakis = function()
  return
  {
    property_expression_names =
    {
      temperature = "vulcanus_temperature",
      moisture = "fulgora_moisture",
      aux = "fulgora_aux",
      cliffiness = "fulgora_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:black_acid_geyser:probability"] = "black_acid_acid_geyser_probability",
      ["entity:black_acid_geyser:richness"] = "arrakis_black_acid_geyser_richness",
      --["entity:steam-geyser:richness"] = "arrakis_steam_geyser_richness",
    },
    cliff_settings =
    {
      name = "cliff-arrakis",
      control = "fulgora_cliff",
      cliff_elevation_0 = 80,
      -- Ideally the first cliff would be at elevation 0 on the coastline, but that doesn't work,
      -- so instead the coastline is moved to elevation 80.
      -- Also there needs to be a large cliff drop at the coast to avoid the janky cliff smoothing
      -- but it also fails if a corner goes below zero, so we need an extra buffer of 40.
      -- So the first cliff is at 80, and terrain near the cliff shouln't go close to 0 (usually above 40).
      cliff_elevation_interval = 40,
      cliff_smoothing = 0, -- This is critical for correct cliff placement on the coast.
      richness = 1
    },
    ------------------------------------------------------------------------------------------------------------------------------
    autoplace_controls =
    {
      ["black_acid_geyser"] = {richness = 1500000000},
      --["steam_geyser"] = {richness = 150},

      --["arrakis_islands"] = {},
      --["fulgora_cliff"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["arrakis-rocky-plateau"] ={},
          ["arrakis-desert"] ={},
          ["arrakis-deep-desert"] ={},
          ["arrakis-deep-desert2"] = {},
          --["arrakis-low-dunes2"] = {},
          --["arrakis-high-rock"] = {},
          --["arrakis-high-dust"] = {},
          --["arrakis-high-sand"] = {},
          --["arrakis-high-dunes"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          --["arrakis-medium-fulgora-rock"] = {},
          --["arrakis-small-fulgora-rock"] = {},
          --["arrakis-tiny-fulgora-rock"] = {},

          --["arrakis-barnacles-decal"] = {},
          --["arrakis-rock-decal-large"] = {},
          --["arrakis-snow-drift-decal"] = {},
          --["arrakis-crater-small"] = {},
          --["arrakis-crater-large"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["black-acid-geyser"] = {},
          --["fulgoran-data-source"] = {},

          ["arrakis-huge-volcanic-rock"] = {},
          --["arrakis-big-fulgora-rock"] = {}
        }
      }
    }
  }
end

local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local arrakis_asteroids = require("__arrakis_my_dune__.prototypes.planet.asteroid_definitions")



data:extend({
  {
    type = "surface-property",
    name = "temperature-celcius",
    default_value = 15,
    hidden_in_factoriopedia = true,
    hidden = true,
  },

  {
    type = "planet",
    name = "arrakis",
    icon = icons .. "arrakis.png",
    starmap_icon = "__arrakis_my_dune__/graphics/starmap/starmap-planet-arrakis.png",
    starmap_icon_size = 2048,
    gravity_pull = 11,
    distance = 13,
    orientation = 0.7,
    magnitude = 1,
    order = "e[arrakis]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.arrakis(),
    pollutant_type = "humidity",
    solar_power_in_space = 700,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_vulcanus,
    surface_properties =
    {
      ["day-night-cycle"] = 15 * minute,
      ["magnetic-field"] = 5,
      ["solar-power"] = 350,
      pressure = 760,
      gravity = 9,
      ["temperature-celcius"] = 77,
    },

    lightning_properties = config.lightning_properties,
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(arrakis_asteroids.vulcanus_arrakis, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-vulcanus.ogg", volume = 0.8},
      wind = {filename = "__space-age__/sound/wind/wind-vulcanus.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 10.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-rumble", 3, 1.6)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-flames", 5, 1.0)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 7.0
        }
      }
    },
    surface_render_parameters =
    {
      --[[
      clouds =
      {
        shape_noise_texture =
        {
          filename = "__core__/graphics/clouds-noise.png",
          size = 2048
        },
        detail_noise_texture =
        {
          filename = "__core__/graphics/clouds-detail-noise.png",
          size = 2048
        },

        warp_sample_1 = { scale = 0.8 / 16 },
        warp_sample_2 = { scale = 3.75 * 0.8 / 32, wind_speed_factor = 0 },
        warped_shape_sample = { scale = 2 * 0.18 / 32 },
        additional_density_sample = { scale = 1.5 * 0.18 / 32, wind_speed_factor = 1.77 },
        detail_sample_1 = { scale = 1.709 / 32, wind_speed_factor = 0.2 / 1.709 },
        detail_sample_2 = { scale = 2.179 / 32, wind_speed_factor = 0.33 / 2.179 },

        scale = 1,
        movement_speed_multiplier = 0.75,
        opacity = 0.15,
        opacity_at_night = 0.25,
        density_at_night = 1,
        detail_factor = 1.5,
        detail_factor_at_night = 2,
        shape_warp_strength = 0.06,
        shape_warp_weight = 0.4,
        detail_sample_morph_duration = 0,
      },
      ]]
      fog = {
        shape_noise_texture =
        {
          filename = "__core__/graphics/clouds-noise.png",
          size = 2048
        },
        detail_noise_texture =
        {
          filename = "__core__/graphics/clouds-detail-noise.png",
          size = 2048
        },
        color1 = {1, 1, 0.8},
        color2 = {1, 1, 1},
        tick_factor = 0.000005,
      },
      --clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        --[[{0.0,  "__arrakis_my_dune__/graphics/terrain/arrakis-1-day.png"},
        {0.35, "__arrakis_my_dune__/graphics/terrain/arrakis-4-partialday.png"},
        {0.40, "__arrakis_my_dune__/graphics/terrain/arrakis-3-dusk.png"},
        {0.45, "__arrakis_my_dune__/graphics/terrain/arrakis-2-night.png"},
        {0.55, "__arrakis_my_dune__/graphics/terrain/arrakis-2-night.png"},
        {0.75, "__arrakis_my_dune__/graphics/terrain/arrakis-4-partialday.png"},
        {0.98, "__arrakis_my_dune__/graphics/terrain/arrakis-1-day.png"},]]
        {0.0,  "__arrakis_my_dune__/graphics/lut/identity-lut.png"},
      },

      --[[terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__arrakis_my_dune__/graphics/terrain/arrakis-tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.6, 0.6, 0.3, 0.3 },
        scale_u = { 3, 1, 1, 1 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.4,
        global_scale = 0.1,
        zoom_factor = 3,
        zoom_intensity = 0.6
      }]]
    }
  },
  --[[{
    type = "space-connection",
    name = "nauvis-arrakis",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "arrakis",
    order = "a",
    length = 17000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },]]
  {
    type = "space-connection",
    name = "nauvis-arrakis",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "arrakis",
    order = "a",
    length = 6000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(arrakis_asteroids.vulcanus_arrakis)
  },
})
