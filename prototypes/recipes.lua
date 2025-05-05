data:extend({
  --PLACEHOLDER
  {
    type = "recipe",
    name = "concrete-from-molten-iron-and-sand",
    category = "metallurgy",
    icon = "__arrakis_my_dune__/graphics/icons/concrete-from-molten-iron-and-sand.png",
    subgroup = "arrakis-processes",
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
  --PLACEHOLDER
  {
    type = "recipe",
    name = "petroleum-from-sand-sulfur-steam-carbon",
    category = "oil-processing",
    icon = "__arrakis_my_dune__/graphics/icons/petroleum-from-sand-sulfur-steam-carbon.png",
    subgroup = "arrakis-processes",
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
    results = {{type = "fluid", name = "water", amount = 10}},
    main_product = "water",
    allow_productivity = false,
    allow_quality = false,
  },
  --SAND EXTRACTION RECIPE
  {
    type = "recipe",
    name = "sand-extraction",
    category = "water-condensing",
    energy_required = 10,
    ingredients = nil,
    results = {{type = "item", name = "sand", amount = 100}},
    main_product = "sand",
    allow_productivity = false,
    allow_quality = false,
  },
  
  --SAND RECIPES HERE---------------------------------------------------------------------------------
  --SAND_WASHING [CHEMISTRY] (WATER & SAND) -> (chemical-mud & treated-sand)
  {
    type = "recipe",
    name = "sand-washing",
    category = "chemistry",
    energy_required = 10,
    enabled = true,
    auto_recycle = false,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 100},
      {type = "item", name = "sand", amount = 100}
    },
    results =
    {
      {type = "fluid", name = "chemical-mud", amount = 80},
      {type = "item", name = "treated-sand", amount = 20}
    },
    main_product = "treated-sand",
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.886, b = 0.678, a = 1.000}, -- #ffe2adff
      secondary = {r = 0.992, g = 0.733, b = 0.408, a = 1.000}, -- #fdbb68ff
      tertiary = {r = 0.945, g = 0.804, b = 0.580, a = 1.000}, -- #f1cda3ff
      quaternary = {r = 1.000, g = 0.945, b = 0.753, a = 1.000}, -- #fff1c0ff
    }
  },


  --SAND_TREATMENT [CHEMISTRY] (TREATED_SAND) -> (metallic-sand & mineral-sand)
  {
    type = "recipe",
    name = "sandTreatment",
    category = "chemistry",
    energy_required = 0.5,
    enabled = true,
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "treated-sand", amount = 1}
    },
    results =
    {
      {type = "item", name = "metallic-sand", amount = 1, probability = 0.6},
      {type = "item", name = "mineral-sand", amount = 1, probability = 0.4}
    },
    main_product = "mineral-sand",
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.886, b = 0.678, a = 1.000}, -- #ffe2adff
      secondary = {r = 0.992, g = 0.733, b = 0.408, a = 1.000}, -- #fdbb68ff
      tertiary = {r = 0.945, g = 0.804, b = 0.580, a = 1.000}, -- #f1cda3ff
      quaternary = {r = 1.000, g = 0.945, b = 0.753, a = 1.000}, -- #fff1c0ff
    }
  },


  --METALLIC_SAND_TREATMENT [CHEMISTRY] (METALLIC_SAND) -> (iron-ore & copper-ore)
  {
    type = "recipe",
    name = "metallic-sandTreatment1",
    category = "chemistry",
    icon = "__arrakis_my_dune__/graphics/icons/metallic-sandTreatment1.png",
    energy_required = 1,
    enabled = true,
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "metallic-sand", amount = 1}
    },
    results =
    {
      {type = "item", name = "iron-ore", amount = 1, probability = 0.5},
      {type = "item", name = "copper-ore", amount = 1, probability = 0.5}
    },
    main_product = "iron-ore",
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.886, b = 0.678, a = 1.000}, -- #ffe2adff
      secondary = {r = 0.992, g = 0.733, b = 0.408, a = 1.000}, -- #fdbb68ff
      tertiary = {r = 0.945, g = 0.804, b = 0.580, a = 1.000}, -- #f1cda3ff
      quaternary = {r = 1.000, g = 0.945, b = 0.753, a = 1.000}, -- #fff1c0ff
    }
  },


  --ADVANCED_METALLIC_SAND_TREATMENT [CHEMISTRY] (METALLIC_SAND) -> (iron-ore & copper-ore & tungsten-ore)
  {
    type = "recipe",
    name = "metallic-sandTreatment2",
    category = "chemistry",
    icon = "__arrakis_my_dune__/graphics/icons/metallic-sandTreatment2.png",
    energy_required = 20,
    enabled = true,
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "metallic-sand", amount = 20}
    },
    results =
    {
      {type = "item", name = "iron-ore", amount = 8},
      {type = "item", name = "copper-ore", amount = 8},
      {type = "item", name = "tungsten-ore", amount = 4}
    },
    main_product = "iron-ore",
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.886, b = 0.678, a = 1.000}, -- #ffe2adff
      secondary = {r = 0.992, g = 0.733, b = 0.408, a = 1.000}, -- #fdbb68ff
      tertiary = {r = 0.945, g = 0.804, b = 0.580, a = 1.000}, -- #f1cda3ff
      quaternary = {r = 1.000, g = 0.945, b = 0.753, a = 1.000}, -- #fff1c0ff
    }
  },


  --MINERAL_SAND_TREATMENT [CHEMISTRY] (MINERAL_SAND) -> (stone & silica & calcite)  
  {
    type = "recipe",
    name = "mineral-sandTreatment1",
    category = "chemistry",
    energy_required = 1,
    enabled = true,
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "mineral-sand", amount = 1}
    },
    results =
    {
      {type = "item", name = "stone", amount = 1, probability = 0.7},
      {type = "item", name = "silica", amount = 1, probability = 0.25},
      {type = "item", name = "calcite", amount = 1, probability = 0.05}
    },
    main_product = "silica",
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.886, b = 0.678, a = 1.000}, -- #ffe2adff
      secondary = {r = 0.992, g = 0.733, b = 0.408, a = 1.000}, -- #fdbb68ff
      tertiary = {r = 0.945, g = 0.804, b = 0.580, a = 1.000}, -- #f1cda3ff
      quaternary = {r = 1.000, g = 0.945, b = 0.753, a = 1.000}, -- #fff1c0ff
    }
  },


  --ADVANCED_MINERAL_SAND_TREATMENT [CHEMISTRY] (MINERAL_SAND) -> (stone & silica & calcite & holmium-ore)  
  {
    type = "recipe",
    name = "mineral-sandTreatment2",
    category = "chemistry",
    energy_required = 20,
    enabled = true,
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "mineral-sand", amount = 20}
    },
    results =
    {
      {type = "item", name = "stone", amount = 13},
      {type = "item", name = "silica", amount = 4},
      {type = "item", name = "holmium-ore", amount = 2},
      {type = "item", name = "calcite", amount = 1}
    },
    main_product = "silica",
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.886, b = 0.678, a = 1.000}, -- #ffe2adff
      secondary = {r = 0.992, g = 0.733, b = 0.408, a = 1.000}, -- #fdbb68ff
      tertiary = {r = 0.945, g = 0.804, b = 0.580, a = 1.000}, -- #f1cda3ff
      quaternary = {r = 1.000, g = 0.945, b = 0.753, a = 1.000}, -- #fff1c0ff
    }
  },




  --------------FLUID TREATMENT------------------------------------------------------------------------------------------------
  --CHEMICAL_MUD_TREATMENT [CHEMISTRY] (CHEMICAL_MUD) -> (coal & polluted-water)  
  {
    type = "recipe",
    name = "chemical-mudTreatment1",
    category = "chemistry",
    icon = "__arrakis_my_dune__/graphics/icons/chemical-mudTreatment1.png",
    energy_required = 10,
    enabled = true,
    auto_recycle = false,
    ingredients =
    {
      {type = "fluid", name = "chemical-mud", amount = 100}
    },
    results =
    {
      {type = "item", name = "coal", amount = 10},
      {type = "fluid", name = "polluted-water", amount = 90}
      
    },
    main_product = "polluted-water",
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.886, b = 0.678, a = 1.000}, -- #ffe2adff
      secondary = {r = 0.992, g = 0.733, b = 0.408, a = 1.000}, -- #fdbb68ff
      tertiary = {r = 0.945, g = 0.804, b = 0.580, a = 1.000}, -- #f1cda3ff
      quaternary = {r = 1.000, g = 0.945, b = 0.753, a = 1.000}, -- #fff1c0ff
    }
  },


  --ADVANCED_CHEMICAL_MUD_TREATMENT [CHEMISTRY] (CHEMICAL_MUD) -> (spoilage & sulfuric-acid & polluted-water)  
  {
    type = "recipe",
    name = "chemical-mudTreatment2",
    category = "chemistry",
    icon = "__arrakis_my_dune__/graphics/icons/chemical-mudTreatment2.png",
    energy_required = 10,
    enabled = true,
    auto_recycle = false,
    ingredients =
    {
      {type = "fluid", name = "chemical-mud", amount = 100}
    },
    results =
    {
      {type = "item", name = "spoilage", amount = 10},
      {type = "fluid", name = "sulfuric-acid", amount = 40},
      {type = "fluid", name = "polluted-water", amount = 50}
    },
    main_product = "polluted-water",
    allow_productivity = true,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.886, b = 0.678, a = 1.000}, -- #ffe2adff
      secondary = {r = 0.992, g = 0.733, b = 0.408, a = 1.000}, -- #fdbb68ff
      tertiary = {r = 0.945, g = 0.804, b = 0.580, a = 1.000}, -- #f1cda3ff
      quaternary = {r = 1.000, g = 0.945, b = 0.753, a = 1.000}, -- #fff1c0ff
    }
  },


  --WATER_TREATMENT [OIL_PROCESSING] (SILICON_FILTER & POLLUTED_WATER) -> (water)  
  {
    type = "recipe",
    name = "polluted-waterTreatment",
    category = "oil-processing",
    enabled = true,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "silicon-filter", amount = 1},
      {type = "fluid", name = "polluted-water", amount = 100, ignored_by_stats = 25}
    },
    results =
    {
      {type = "fluid", name = "water", amount = 100, ignored_by_stats = 25, ignored_by_productivity = 25}
    },
    allow_productivity = true,
    main_product = "water",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-c[coal-liquefaction]",
    allow_decomposition = false
  },



  --------------SILICON FILTERS-----------------------------------------------------------------------------------------------------
  --SILICON_PASTE [SMELTING] (SILICA & CARBON) -> (silicon-paste) 
  {
    type = "recipe",
    name = "silicon-paste",
    enabled = true,
    energy_required = 5,
    ingredients = 
    {
      {type = "item", name = "silica", amount = 1},
      {type = "item", name = "carbon", amount = 1}
    },
    results = 
    {
      {type="item", name="silicon-paste", amount=1}
    },
    main_product = "silicon-paste",
    allow_productivity = true
  },


  --SILICON [SMELTING] (SILICON_PASTE) -> (silicon) 
  {
    type = "recipe",
    name = "silicon",
    category = "smelting",
    enabled = true,
    energy_required = 5,
    ingredients = 
    {
      {type = "item", name = "silicon-paste", amount = 1}
      
    },
    results = 
    {
      {type="item", name="silicon", amount=1}
    },
    main_product = "silicon",
    allow_productivity = true
  },


  --SILICON_FILTERS [CRAFTING] (SILICON & PLASTIC_BAR) -> (silicon-filter)   
  {
    type = "recipe",
    name = "silicon-filter",
    category = "crafting",
    energy_required = 1,
    enabled = true,
    auto_recycle = false,
    ingredients =
    {
      {type = "item", name = "silicon", amount = 1},
      {type = "item", name = "plastic-bar", amount = 1}
    },
    results =
    {
      {type = "item", name = "silicon-filter", amount = 1}
    },
    main_product = "silicon-filter",
    allow_productivity = true,
  },




  --MACHINE CRAFTING RECIPES---------------------------------------------------------------------------------------------
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
