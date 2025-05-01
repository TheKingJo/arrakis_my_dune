data:extend({
  {
    type = "recipe",
    name = "concrete-from-molten-iron-and-sand",
    category = "metallurgy",
    icon = "__arrakis_my_dune__/graphics/icons/concrete-from-molten-iron-and-sand.png",
    subgroup = "arrakis2-processes",
    order = "aab",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-iron", amount = 20},
      {type = "fluid", name = "water", amount = 100},
      {type = "item", name = "sand", amount = 80},
    },
    energy_required = 10,
    results = {{type = "item", name = "concrete", amount = 10}},
    allow_decomposition = false,
    auto_recycle = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "petroleum-from-sand-sulfur-steam-carbon",
    category = "oil-processing",
    icon = "__arrakis_my_dune__/graphics/icons/petroleum-from-sand-sulfur-steam-carbon.png",
    subgroup = "arrakis2-processes",
    order = "aac",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "steam", amount = 50},
      {type = "item", name = "sand", amount = 40},
      {type = "item", name = "sulfur", amount = 10},
      {type = "item", name = "coal", amount = 5},
    },
    energy_required = 3,
    results = {
      {type = "fluid", name = "petroleum-gas", amount = 100, show_details_in_recipe_tooltip = true},
      {type = "item", name = "carbon", amount = 2, show_details_in_recipe_tooltip = false},
    },
    main_product = "petroleum-gas",
    allow_decomposition = false,
    auto_recycle = false,
    allow_productivity = true
  },




  --WATER CONDENSING RECIPES CATEGORY
  {
    type = "recipe-category",
    name = "water-condensing"
  },

  --WATER CONDENSING RECIPE
  {
    type = "recipe",
    name = "atmospheric-water",
    category = "water-condensing",
    energy_required = 10,
    ingredients = nil,
    results = {{type = "fluid", name = "water", amount = 50}},
    main_product = "water",
    allow_productivity = false,
    allow_quality = false,
  },

  --WATER CONDENSER MACHINE RECIPE
  {
  type = "recipe",
        name = "water-condenser",
        category = "basic-crafting",
        energy_required = 2,   
        ingredients = {
            { type = "item", name = "iron-gear-wheel", amount = 5 },
            { type = "item", name = "electronic-circuit", amount = 3 },
            { type = "item", name = "steel-plate", amount = 2 },
        },
        results = {
          { type = "item", name = "water-condenser", amount = 1 },
        },
        allow_productivity = false,
        allow_quality = false,
    },





})
