local basic_sand_refinery_animation_speed = 1
local frames = 128

local function basic_sand_refinery_main_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/sand-refiner/sand-refiner-main",
  {
    animation_speed = basic_sand_refinery_animation_speed,
    frame_count = frames,
    scale = 0.252
  })
end

local function basic_sand_refinery_main_shadow_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/sand-refiner/sand-refiner-shadow",
  {
    animation_speed = basic_sand_refinery_animation_speed,
    frame_count = frames,
    draw_as_shadow = true,
    scale = 0.232
  })
end

local function basic_sand_refinery_pipe_north_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/sand-refiner/sand-refiner-pipe-connections-north",
  {
    repeat_count = frames,
    scale = 0.214
  })
end

local function basic_sand_refinery_pipe_east_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/sand-refiner/sand-refiner-pipe-connections-east",
  {
    repeat_count = frames,
    scale = 0.225
  })
end

local function basic_sand_refinery_pipe_south_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/sand-refiner/sand-refiner-pipe-connections-south",
  {
    repeat_count = frames,
    scale = 0.218
  })
end

local function basic_sand_refinery_pipe_west_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/sand-refiner/sand-refiner-pipe-connections-west",
  {
    repeat_count = frames,
    scale = 0.225
  })
end

local function basic_sand_refinery_working_pictures()
  return
  {
    fadeout = true,
    animation =
    util.sprite_load("__space-age__/graphics/entity/basic_sand_refinery/basic_sand_refinery-working",
      {
        animation_speed = basic_sand_refinery_animation_speed,
        frame_count = frames,
        scale = 0.5
      }
    )
  }
end

local function basic_sand_refinery_lights_pictures()
  return
  {
    effect = "flicker",
    fadeout = true,
    animation =
    util.sprite_load("__arrakis_my_dune__/graphics/entity/sand-refiner/sand-refiner-lights",
      {
        draw_as_light = true,
        draw_as_glow = true,
        animation_speed = basic_sand_refinery_animation_speed,
        frame_count = frames,
        blend_mode = "additive",
        scale = 0.588
      }
    )
  }
end

local function basic_sand_refinery_status_lamp_pictures()
  return
  {
    animation =
    util.sprite_load("__space-age__/graphics/entity/basic_sand_refinery/basic_sand_refinery-status-lamp",
      {
        draw_as_glow = true,
        repeat_count = frames,
        blend_mode = "additive",
        scale = 0.5
      }
    )
  }
end

local function basic_sand_refinery_chimney_smoke()
  return
  {
    fadeout = true,
    constant_speed = true,
    render_layer = "wires",
    animation =
    {
      filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
      frame_count = 47,
      line_length = 16,
      width = 90,
      height = 188,
      animation_speed = 0.5,
      shift = util.by_pixel(-95, -147),
      tint = {0.95, 0.55, 0.2, 1},
      scale = 0.5
    }
  }
end

return {
  graphics_set =
  {
    animation =
    {
      layers =
      {
        basic_sand_refinery_main_pictures(),
        basic_sand_refinery_main_shadow_pictures()
      }
    },
    working_visualisations =
    {
      {
        always_draw = true,
        name = "output-pipe",
        enabled_by_name = true,
        north_animation = basic_sand_refinery_pipe_north_pictures(),
        north_secondary_draw_order = -10, -- behind main animation
        east_animation = basic_sand_refinery_pipe_east_pictures(),
        south_animation = basic_sand_refinery_pipe_south_pictures(),
        west_animation = basic_sand_refinery_pipe_west_pictures()
      },
      {
        always_draw = true,
        name = "input-pipe",
        enabled_by_name = true,
        north_animation = basic_sand_refinery_pipe_south_pictures(),
        east_animation = basic_sand_refinery_pipe_west_pictures(),
        south_animation = basic_sand_refinery_pipe_north_pictures(),
        south_secondary_draw_order = -10, -- behind main animation
        west_animation = basic_sand_refinery_pipe_east_pictures()
      },

      --basic_sand_refinery_working_pictures(),
      --basic_sand_refinery_lights_pictures(),
      --basic_sand_refinery_status_lamp_pictures(),
      --basic_sand_refinery_chimney_smoke()
    },
    frozen_patch = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-frozen", {scale = 0.5}),
    reset_animation_when_frozen = true
  },
  pipe_picture_frozen = {
    north = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-north-frozen", { scale = 0.5, shift = {-1, 3} }),
    east = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-east-frozen", { scale = 0.5, shift = {-3, -1} }),
    south = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-south-frozen", { scale = 0.5, shift = {1, -3} }),
    west = util.sprite_load("__space-age__/graphics/entity/foundry/foundry-pipe-connections-west-frozen", { scale = 0.5, shift = {3, 1} })
  }
}
