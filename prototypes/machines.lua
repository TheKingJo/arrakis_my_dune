local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")


data:extend({

{
  --this entire File is the Water Condenser since it is right now just a 1:1 copy of a normal chemical plant
  type = "assembling-machine",
  name = "water-condenser",
  icon = icons .. "water-condenser.png",
  flags = {"placeable-neutral","placeable-player", "player-creation"},
  minable = {mining_time = 0.1, result = "water-condenser"},
  fast_replaceable_group = "water-condenser",
  max_health = 300,
  corpse = "chemical-plant-remnants",
  dying_explosion = "chemical-plant-explosion",
  icon_draw_specification = {shift = {0, -0.3}},
  collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  damaged_trigger_effect = hit_effects.entity(),
  drawing_box_vertical_extension = 0.4,
  module_slots = 3,
  allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},

  graphics_set =
  {
    animation = make_4way_animation_from_spritesheet({ layers =
    {
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
        width = 220,
        height = 292,
        frame_count = 24,
        line_length = 12,
        shift = util.by_pixel(0.5, -9),
        scale = 0.5
      },
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
        width = 312,
        height = 222,
        repeat_count = 24,
        shift = util.by_pixel(27, 6),
        draw_as_shadow = true,
        scale = 0.5
      }
    }}),
    working_visualisations =
    {
      {
        apply_recipe_tint = "primary",
        north_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-north.png",
          frame_count = 24,
          line_length = 6,
          width = 66,
          height = 44,
          shift = util.by_pixel(23, 15),
          scale = 0.5
        },
        east_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-east.png",
          frame_count = 24,
          line_length = 6,
          width = 70,
          height = 36,
          shift = util.by_pixel(0, 22),
          scale = 0.5
        },
        south_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-south.png",
          frame_count = 24,
          line_length = 6,
          width = 66,
          height = 42,
          shift = util.by_pixel(0, 17),
          scale = 0.5
        },
        west_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-west.png",
          frame_count = 24,
          line_length = 6,
          width = 74,
          height = 36,
          shift = util.by_pixel(-10, 13),
          scale = 0.5
        }
      },
      {
        apply_recipe_tint = "secondary",
        north_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-north.png",
          frame_count = 24,
          line_length = 6,
          width = 62,
          height = 42,
          shift = util.by_pixel(24, 15),
          scale = 0.5
        },
        east_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-east.png",
          frame_count = 24,
          line_length = 6,
          width = 68,
          height = 36,
          shift = util.by_pixel(0, 22),
          scale = 0.5
        },
        south_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-south.png",
          frame_count = 24,
          line_length = 6,
          width = 60,
          height = 40,
          shift = util.by_pixel(1, 17),
          scale = 0.5
        },
        west_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-west.png",
          frame_count = 24,
          line_length = 6,
          width = 68,
          height = 28,
          shift = util.by_pixel(-9, 15),
          scale = 0.5
        }
      },
      {
        apply_recipe_tint = "tertiary",
        fadeout = true,
        constant_speed = true,
        north_position = util.by_pixel_hr(-30, -161),
        east_position = util.by_pixel_hr(29, -150),
        south_position = util.by_pixel_hr(12, -134),
        west_position = util.by_pixel_hr(-32, -130),
        render_layer = "wires",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
          frame_count = 47,
          line_length = 16,
          width = 90,
          height = 188,
          animation_speed = 0.5,
          shift = util.by_pixel(-2, -40),
          scale = 0.5
        }
      },
      {
        apply_recipe_tint = "quaternary",
        fadeout = true,
        constant_speed = true,
        north_position = util.by_pixel_hr(-30, -161),
        east_position = util.by_pixel_hr(29, -150),
        south_position = util.by_pixel_hr(12, -134),
        west_position = util.by_pixel_hr(-32, -130),
        render_layer = "wires",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
          frame_count = 47,
          line_length = 16,
          width = 40,
          height = 84,
          animation_speed = 0.5,
          shift = util.by_pixel(0, -14),
          scale = 0.5
        }
      }
    }
  },
  impact_category = "metal-large",
  open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
  close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
  working_sound =
  {
    sound = sound_variations("__base__/sound/chemical-plant", 3, 0.5),
    fade_in_ticks = 4,
    fade_out_ticks = 20
  },
  crafting_speed = 1,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = - 5 }
  },
  energy_usage = "210kW",
  crafting_categories = {"water-condensing"},
  fluid_boxes =
  {
    {
      production_type = "input",
      pipe_covers = pipecoverspictures(),
      volume = 1000,
      pipe_connections =
      {
        {
          flow_direction="input",
          direction = defines.direction.north,
          position = {-1, -1}
        }
      }
    },
    {
      production_type = "input",
      pipe_covers = pipecoverspictures(),
      volume = 1000,
      pipe_connections =
      {
        {
          flow_direction="input",
          direction = defines.direction.north,
          position = {1, -1}
        }
      }
    },
    {
      production_type = "output",
      pipe_covers = pipecoverspictures(),
      volume = 100,
      pipe_connections =
      {
        {
          flow_direction = "output",
          direction = defines.direction.south,
          position = {-1, 1}
        }
      }
    },
    {
      production_type = "output",
      pipe_covers = pipecoverspictures(),
      volume = 100,
      pipe_connections =
      {
        {
          flow_direction = "output",
          direction = defines.direction.south,
          position = {1, 1}
        }
      }
    }
  },
  water_reflection =
  {
    pictures =
    {
      filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
      priority = "extra-high",
      width = 28,
      height = 36,
      shift = util.by_pixel(5, 60),
      variation_count = 4,
      scale = 5
    },
    rotate = false,
    orientation_to_variation = true
  }
},

{
    type = "assembling-machine",
    name = "sand-refinery",
    icon = icons .. "sand-refinery.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.2, result = "sand-refinery"},
    max_health = 350,
    corpse = "foundry-remnants",
    dying_explosion = "foundry-explosion",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["foundry"],
    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    heating_energy = "300kW",
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1.3,
    module_slots = 4,
    icon_draw_specification = {scale = 2, shift = {0, -0.3}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.assembling_machine_modules, shift = {0, 1.25}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"sand-treatment","chemistry"},
    crafting_speed = 2.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 6 }
    },
    energy_usage = "2500kW",
    perceived_performance = {minimum = 0.25, maximum = 20},
    graphics_set = require("__arrakis_my_dune__.prototypes.entities.sand-refinery-pictures").graphics_set,
    open_sound = sounds.steam_open,
    close_sound = sounds.steam_close,
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/foundry/foundry.ogg",
        volume = 0.5,
        audible_distance_modifier = 0.6
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      sound_accents =
      {
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-pipe-out.ogg", volume = 0.9, audible_distance_modifier = 0.4}, frame = 2},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-slide-close.ogg", volume = 0.65, audible_distance_modifier = 0.3}, frame = 18},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-clamp.ogg", volume = 0.45, audible_distance_modifier = 0.3}, frame = 39},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-slide-stop.ogg", volume = 0.7, audible_distance_modifier = 0.4}, frame = 43},
        {sound = {variations = sound_variations("__space-age__/sound/entity/foundry/foundry-fire-whoosh", 3, 0.8), audible_distance_modifier = 0.3}, frame = 64},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-metal-clunk.ogg", volume = 0.65, audible_distance_modifier = 0.4}, frame = 64},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-slide-open.ogg", volume = 0.65, audible_distance_modifier = 0.3}, frame = 74},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-pipe-in.ogg", volume = 0.75, audible_distance_modifier = 0.4}, frame = 106},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-smoke-puff.ogg", volume = 0.8, audible_distance_modifier = 0.3}, frame = 106},
        {sound = {variations = sound_variations("__space-age__/sound/entity/foundry/foundry-pour", 2, 0.7)}, frame = 110},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-rocks.ogg", volume = 0.65, audible_distance_modifier = 0.3}, frame = 120},
        {sound = {filename = "__space-age__/sound/entity/foundry/foundry-blade.ogg", volume = 0.7}, frame = 126},
      },
      max_sounds_per_prototype = 2
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction = "input", direction = defines.direction.south, position = {-3, 3} }}
      },
      {
        production_type = "input",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        pipe_connections = {{ flow_direction = "input", direction = defines.direction.south, position = {3, 3} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "output-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction = "output", direction = defines.direction.north, position = {-3, -3} }}
      },
      {
        production_type = "output",
        pipe_picture = util.empty_sprite(),
        pipe_picture_frozen = require("__space-age__.prototypes.entity.foundry-pictures").pipe_picture_frozen,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        enable_working_visualisations = { "output-pipe" },
        volume = 100,
        pipe_connections = {{ flow_direction = "output", direction = defines.direction.north, position = {3, -3} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    water_reflection =
    {
      pictures = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-reflection",
      {
          scale = 7,
          shift = {0,2}
      }),
      rotate = false
    }
  }
})