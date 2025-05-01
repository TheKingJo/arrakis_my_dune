


local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout



data:extend({
  {
    type = "noise-expression",
    name = "arrakis2_spot_size",
    expression = 8
  },
  {
    type = "noise-expression",
    name = "arrakis2_starting_mask",
    -- exclude random spots from the inner 300 tiles, 80 tile blur
    expression = "clamp((distance - 30) / 10, -1, 1)"
  },
  {
    type = "noise-expression",
    name = "arrakis2_molten_copper_geyser_spots",
    expression = "aquilo_spot_noise{seed = 567,\z
                                    count = 80,\z
                                    skip_offset = 0,\z
                                    region_size = 600 + 400 / control:molten_copper_geyser:frequency,\z
                                    density = 1,\z
                                    radius = arrakis2_spot_size * sqrt(control:molten_copper_geyser:size),\z
                                    favorability = 1}"
  },
  {
    type = "noise-expression",
    name = "arrakis2_starting_molten_copper_geyser",
    expression = "starting_spot_at_angle{angle = aquilo_angle, distance = 40, radius = arrakis2_spot_size * 0.8, x_distortion = 0, y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "arrakis2_molten_copper_geyser_probability",
    expression = "(control:molten_copper_geyser:size > 0)\z
                  * (max(arrakis2_starting_molten_copper_geyser * 0.08,\z
                         min(arrakis2_starting_mask, arrakis2_molten_copper_geyser_spots) * 0.015))"
  },
  {
    type = "noise-expression",
    name = "arrakis2_molten_copper_geyser_richness",
    expression = "max(arrakis2_starting_molten_copper_geyser * 1800000,\z
                      arrakis2_molten_copper_geyser_spots * 1440000) * control:molten_copper_geyser:richness"
  },

  {
    type = "noise-expression",
    name = "arrakis2_steam_geyser_spots",
    expression = "aquilo_spot_noise{seed = 567,\z
                                    count = 60,\z
                                    skip_offset = 1,\z
                                    region_size = 600 + 400 / control:steam_geyser:frequency,\z
                                    density = 1,\z
                                    radius = arrakis2_spot_size * 1.2 * sqrt(control:steam_geyser:size),\z
                                    favorability = 1}"
  },
  {
    type = "noise-expression",
    name = "arrakis2_starting_steam_geyser",
    expression = "starting_spot_at_angle{angle = aquilo_angle + 120, distance = 80, radius = arrakis2_spot_size * 0.6, x_distortion = 0, y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "arrakis2_steam_geyser_probability",
    expression = "(control:steam_geyser:size > 0)\z
                  * (max(arrakis2_starting_steam_geyser * 1.3,\z
                         min(arrakis2_starting_mask, arrakis2_steam_geyser_spots) * 0.22))"
  },
  {
    type = "noise-expression",
    name = "arrakis2_steam_geyser_richness",
    expression = "max(arrakis2_starting_steam_geyser * 480000,\z
                      arrakis2_steam_geyser_spots * 7200000) * control:steam_geyser:richness"
  },

  {
    type = "autoplace-control",
    name = "arrakis2_islands",
    order = "c-z-d",
    category = "terrain",
    can_be_disabled = false
  },
}) 

planet_map_gen.arrakis2 = function()
  return
  {
    property_expression_names =
    {
      elevation = "fulgora_elevation",
      temperature = "vulcanus_temperature",
      moisture = "fulgora_moisture",
      aux = "fulgora_aux",
      cliffiness = "fulgora_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
      --["entity:steam-geyser:probability"] = "arrakis2_steam_geyser_probability",
      --["entity:steam-geyser:richness"] = "arrakis2_steam_geyser_richness",
    },
    cliff_settings =
    {
      name = "cliff-arrakis2",
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
    autoplace_controls =
    {
      --["molten_copper_geyser"] = {richness = 1500000000},
      --["steam_geyser"] = {richness = 150},
      ["arrakis2_islands"] = {},
      ["fulgora_cliff"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["arrakis2-low-sand2"] = {},
          ["arrakis2-low-dunes2"] = {},

          ["arrakis2-high-rock"] = {},
          ["arrakis2-high-dust"] = {},
          ["arrakis2-high-sand"] = {},
          ["arrakis2-high-dunes"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["arrakis2-medium-fulgora-rock"] = {},
          ["arrakis2-small-fulgora-rock"] = {},
          ["arrakis2-tiny-fulgora-rock"] = {},
          --["arrakis2-barnacles-decal"] = {},
          --["arrakis2-rock-decal-large"] = {},
          --["arrakis2-snow-drift-decal"] = {},
          --["arrakis2-crater-small"] = {},
          --["arrakis2-crater-large"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          --["steam-geyser"] = {},
          --["fulgoran-data-source"] = {},
          ["arrakis2-huge-volcanic-rock"] = {},
          ["arrakis2-big-fulgora-rock"] = {}
        }
      }
    }
  }
end

local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

data:extend({

  {
    type = "surface-property",
    name = "temperature-celcius",
    default_value = 15,
    hidden_in_factoriopedia = true,
    hidden = true,
  },
  {
    type = "surface-property",
    name = "arrakis2-exclusive",
    default_value = 0,
    hidden_in_factoriopedia = true,
    hidden = true,
  },
  {
    type = "planet",
    name = "arrakis2",
    icon = "__arrakis_my_dune__/graphics/icons/arrakis2.png",
    starmap_icon = "__arrakis_my_dune__/graphics/icons/starmap-planet-arrakis2.png",
    starmap_icon_size = 2048,
    gravity_pull = 9,
    distance = 7.5,
    orientation = 0.05,
    magnitude = 0.5,
    order = "e[arrakis2]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.arrakis2(),
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
      ["arrakis2-exclusive"] = 1,
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9),
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
      -- clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        --[[{0.0,  "__arrakis_my_dune__/graphics/terrain/arrakis2-1-day.png"},
        {0.35, "__arrakis_my_dune__/graphics/terrain/arrakis2-4-partialday.png"},
        {0.40, "__arrakis_my_dune__/graphics/terrain/arrakis2-3-dusk.png"},
        {0.45, "__arrakis_my_dune__/graphics/terrain/arrakis2-2-night.png"},
        {0.55, "__arrakis_my_dune__/graphics/terrain/arrakis2-2-night.png"},
        {0.75, "__arrakis_my_dune__/graphics/terrain/arrakis2-4-partialday.png"},
        {0.98, "__arrakis_my_dune__/graphics/terrain/arrakis2-1-day.png"},]]
        {0.0,  "__arrakis_my_dune__/graphics/lut/identity-lut.png"},
      },

      --[[terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__arrakis_my_dune__/graphics/terrain/arrakis2-tint-noise.png",
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
    name = "nauvis-arrakis2",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "arrakis2",
    order = "a",
    length = 17000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },]]
  {
    type = "space-connection",
    name = "vulcanus-arrakis2",
    subgroup = "planet-connections",
    from = "vulcanus",
    to = "arrakis2",
    order = "a",
    length = 3000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
})
