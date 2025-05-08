data:extend({
  -- Prototype for the humidity feature (reskinned polution :) 
  {
    type = "airborne-pollutant",
    name = "humidity",
    chart_color = {r = 70, g = 180, b = 255, a = 140},
    icon =
    {
      filename = "__core__/graphics/icons/mip/side-map-menu-buttons.png",
      priority = "high",
      size = 64,
      mipmap_count = 2,
      y = 3 * 64,
      flags = {"gui-icon"}
    },
    affects_evolution = false,
    affects_water_tint = false,
    damages_trees = false,
  },
})



data:extend({
  -- Prototype for the humidity generation through lightning (lightning renamed to condensation)

  {
    type = "lightning",
    name = "condensation",
    icon = "__space-age__/graphics/icons/lightning.png",
    subgroup = "obstacles",
    damage = 0,
    energy = "0W",
    time_to_damage = 8,
    effect_duration = 36,
    source_offset = {0, -25},
    source_variance = {30, 6},
    
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "camera-effect",
          duration = 20,
          ease_in_duration = 10,
          ease_out_duration = 7,
          delay = 0,
          strength = 0.75,
          full_strength_max_distance = 10,
          max_distance = 70
        }
      }
    },
    strike_effect =
    {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects =
        {{
          type = "script",
          effect_id = "pollution_trigger"
        }}
      }
    }
  }



})