local techicons = "__arrakis_my_dune__/graphics/technology/"


data:extend({

  -- Main Arrakis / Dune Planet discovery, unlocks the Planet and Water Condensator + Water Recipe
  {
    type = "technology",
    name = "planet-discovery-arrakis2",
    icons = util.technology_icon_constant_planet(techicons .. "arrakis2-tech-arrakis2.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "arrakis2",
        use_icon_overlay_constant = true
      },
      {
        type = "unlock-recipe",
        recipe = "atmospheric-water"
      },
      {
        type = "unlock-recipe",
        recipe = "water-condenser"
      },
    },
    prerequisites = {"space-platform-thruster"},
    unit =
    {
      count = 600,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60
    }
  },
  -----------------------------------------------------------------------------------------------






})