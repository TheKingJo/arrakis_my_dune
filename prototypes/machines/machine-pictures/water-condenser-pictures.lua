local water_condenser_animation_speed = 0.5
local frames = 160

local function water_condenser_main_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/water-condenser/water-condenser-main",
  {
    animation_speed = water_condenser_animation_speed,
    frame_count = frames,
    scale = 0.5
  })
end

local function water_condenser_main_shadow_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/water-condenser/water-condenser-shadow",
  {
    animation_speed = water_condenser_animation_speed,
    frame_count = frames,
    draw_as_shadow = true,
    scale = 0.5
  })
end

local function water_condenser_pipe_north_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/water-condenser/water-condenser-pipe-connections-north",
  {
    animation_speed = water_purification_facility_animation_speed,
    frame_count = frames,
    scale = 0.5
  })
end

local function water_condenser_pipe_east_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/water-condenser/water-condenser-pipe-connections-east",
  {
    repeat_count = frames,
    scale = 0.5
  })
end

local function water_condenser_pipe_south_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/water-condenser/water-condenser-pipe-connections-south",
  {
    repeat_count = frames,
    scale = 0.5
  })
end

local function water_condenser_pipe_west_pictures()
  return util.sprite_load("__arrakis_my_dune__/graphics/entity/water-condenser/water-condenser-pipe-connections-west",
  {
    repeat_count = frames,
    scale = 0.5
  })
end


return {
  graphics_set =
  {
    animation =
    {
      layers =
      {
        water_condenser_main_pictures(),
        water_condenser_main_shadow_pictures()
      }
    },
    idle_animation = 
    {
      layers = 
      {
        water_condenser_main_pictures(),
        water_condenser_main_shadow_pictures()
      }
    },
    working_visualisations =
    {
      {
        always_draw = true,
        name = "output-pipe",
        enabled_by_name = true,
        north_animation = water_condenser_pipe_north_pictures(),
        north_secondary_draw_order = -10, -- behind main animation
        east_animation = water_condenser_pipe_east_pictures(),
        south_animation = water_condenser_pipe_south_pictures(),
        west_animation = water_condenser_pipe_west_pictures()
      },
      {
        always_draw = true,
        name = "input-pipe",
        enabled_by_name = true,
        north_animation = water_condenser_pipe_south_pictures(),
        east_animation = water_condenser_pipe_west_pictures(),
        south_animation = water_condenser_pipe_north_pictures(),
        south_secondary_draw_order = -10, -- behind main animation
        west_animation = water_condenser_pipe_east_pictures()
      },

      --water_purification_facility_working_pictures(),
      --water_purification_facility_lights_pictures(),
      --water_purification_facility_status_lamp_pictures(),
      --water_purification_facility_chimney_smoke()
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
