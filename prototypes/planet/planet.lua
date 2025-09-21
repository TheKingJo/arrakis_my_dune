local config = require("__arrakis_my_dune__.prototypes.-config")
local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local arrakis_asteroids = require("__arrakis_my_dune__.prototypes.planet.asteroid_definitions")

require("prototypes/planet/planet-arrakis-map-gen")
--local planet_map_gen = require("prototypes/planet/planet-map-gen2")
local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")



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
  {
    type = "space-connection",
    name = "nauvis-arrakis",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "arrakis",
    order = "a",
    length = 10000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(arrakis_asteroids.vulcanus_arrakis)
  },
})
