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