function ornithopter_graphics_set()
return
{
  animation =
  {
    layers =
      {
        {
          filenames = {
            "__arrakis_my_dune__/graphics/entity/ornithopter/ornithopter-airborn-1.png",
            "__arrakis_my_dune__/graphics/entity/ornithopter/ornithopter-airborn-2.png"
          },
          line_length = 8,
          lines_per_file = 8,
          width = 687,
          height = 687,
          frame_count = 2,
          direction_count = 64,
          animation_speed = 0.5,
          scale = 0.5,
          shift = util.by_pixel( 0, -40),
        },
        {
          filenames = {
            "__arrakis_my_dune__/graphics/entity/ornithopter/ornithopter-airborn-wings-1.png",
            "__arrakis_my_dune__/graphics/entity/ornithopter/ornithopter-airborn-wings-2.png"
          },
          line_length = 8,
          lines_per_file = 8,
          width = 816,
          height = 816,
          frame_count = 2,
          direction_count = 64,
          animation_speed = 0.5,
          scale = 0.5,
          shift = util.by_pixel( 0, -40),
        }
      }
    }
  }
end

data:extend({
  {
    type = "spider-vehicle",
    name = "ornithopter_airborn",
    icon = icons .. "ornithopter.png",
    icon_size = 64,
    collision_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    minable = { mining_time = 1, result = "ornithopter" },
    max_health = 400,
    weight = 1,
    braking_force = 0.2,
    friction_force = 0.5,
    inventory_size = 20,
    trash_inventory_size = 0,
    energy_per_hit_point = 1,
    torso_bob_speed = 0.1,
    -- Mouvement & énergie
    height = 1.5,
    torso_rotation_speed = 0.005,
    movement_energy_consumption = "100kJ",
    energy_source = {
      type = "void"
    },
    graphics_set = ornithopter_graphics_set(),
    -- 1 invisible leg
    spider_engine = {
      legs = {
      {
        leg = "dummy-leg",
        mount_position = {0, 0},
        ground_position = {0, 0},
        walking_group = 1,
        leg_hit_the_ground_trigger = nil
      }
    },
      military_target = false,
      height = 1.5
    },

    -- Pas d’armes
    guns = {},

    

    -- Minimap
    minimap_representation = {
      filename = "__arrakis_my_dune__/graphics/entity/ornithopter/ornithopter-map.png",
      width = 128,
      height = 128,
      scale = 0.5
    },
    selected_minimap_representation = {
      filename = "__arrakis_my_dune__/graphics/entity/ornithopter/ornithopter-map-selected.png",
      width = 128,
      height = 128,
      scale = 0.5
    },

    -- Sons
    working_sound = {
      sound = {
        filename = "__base__/sound/spidertron/spidertron-vox.ogg",
        volume = 0.4
      },
      activate_sound = {
        filename = "__base__/sound/spidertron/spidertron-activate.ogg",
        volume = 0.5
      },
      deactivate_sound = {
        filename = "__base__/sound/spidertron/spidertron-deactivate.ogg",
        volume = 0.5
      },
      match_speed_to_activity = true
    },

    -- Autres propriétés
    allow_passengers = true,
    chunk_exploration_radius = 3,
    allow_remote_driving = false,
    automatic_weapon_cycling = false,
    chain_shooting_cooldown_modifier = 0,
  }
})
data:extend({
  {
    type = "spider-leg",
    name = "dummy-leg",
    hidden = true,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}},
    part_length = 0.1,
    initial_movement_speed = 0.1,
    movement_acceleration = 0.1,
    max_health = 1,
    stretch_force_scalar = 1,
    knee_height = 0.5,
    knee_distance_factor = 0.5,
    base_position_selection_distance = 1,
    movement_based_position_selection_distance = 1,
    target_position_randomisation_distance = 0.1,
    minimal_step_size = 0.1,                       
    walking_sound_volume_modifier = 0,
    graphics_set = {},
  }
})



