local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
  -- Main Item group for defining a new Tab with Arrakis Items in Inventory
  {
    type = "item-group",
    name = "arrakis",
    order = "z",
    icon = "__arrakis_my_dune__/graphics/technology/arrakis-tech-arrakis.png",
    icon_size = 128,
  },

  -- Item Subgroup for defining water production machines in inventory
  {
    type = "item-subgroup",
    name = "arrakis-water-production",
    group = "arrakis",
    order = "a"
  },

  -- Item declaration for Tier 1 Water Condenser Machine
  {
    type = "item",
    name = "water-condenser",
    icon = "__arrakis_my_dune__/graphics/icons/sand-1.png",
    subgroup = "arrakis-water-production",
    order = "a",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "water-condenser",
    stack_size = 20,
  },
-- Item declaration for Tier 1 Sand Rafinery Machine
  {
    type = "item",
    name = "sand-rafinery",
    icon = "__arrakis_my_dune__/graphics/icons/sand-refinery.png",
    subgroup = "arrakis-water-production",
    order = "b",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "sand-rafinery",
    stack_size = 20,
  },




  -- Item Subgroup for defining general production process Items
  {
    type = "item-subgroup",
    name = "arrakis-processes",
    group = "arrakis",
    order = "b"
  },

--- Item declaration for Sand Item
  {
    type = "item",
    name = "sand",
    icon = "__arrakis_my_dune__/graphics/icons/sand-3.png",
    subgroup = "arrakis-processes",
    order = "a",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/sand-1.png", scale = 0.5 },
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/sand-2.png", scale = 0.5 },
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/sand-3.png", scale = 0.5 },
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/sand-4.png", scale = 0.5 },
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/sand-5.png", scale = 0.5 },
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/sand-6.png", scale = 0.5 },
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/sand-7.png", scale = 0.5 },
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/sand-8.png", scale = 0.5 },
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/sand-9.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },

  --- Item declaration for Silica Item
  {
    type = "item",
    name = "silica",
    icon = "__arrakis_my_dune__/graphics/icons/silica.png",
    subgroup = "arrakis-processes",
    order = "aab",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/silica.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },

  --- Item declaration for Silicon Item
  {
    type = "item",
    name = "silicon",
    icon = "__arrakis_my_dune__/graphics/icons/silicon.png",
    subgroup = "arrakis-processes",
    order = "aab",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/silicon.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },

  --- Item declaration for Silicon Paste Item
  {
    type = "item",
    name = "silicon-paste",
    icon = "__arrakis_my_dune__/graphics/icons/silicon-paste.png",
    subgroup = "arrakis-processes",
    order = "aab",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/silicon-paste.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },

  --- Item declaration for Treated Sand Item
  {
    type = "item",
    name = "treated-sand",
    icon = "__arrakis_my_dune__/graphics/icons/treated-sand.png",
    subgroup = "arrakis-processes",
    order = "aac",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/treated-sand.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },

  --- Item declaration for Metallic Sand Item
  {
    type = "item",
    name = "metallic-sand",
    icon = "__arrakis_my_dune__/graphics/icons/metallic-sand.png",
    subgroup = "arrakis-processes",
    order = "aac",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/metallic-sand.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },

  --- Item declaration for Mineral Sand Item
  {
    type = "item",
    name = "mineral-sand",
    icon = "__arrakis_my_dune__/graphics/icons/mineral-sand.png",
    subgroup = "arrakis-processes",
    order = "aac",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/mineral-sand.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },

  --- Item declaration for Wafers Item
  {
    type = "item",
    name = "wafers",
    icon = "__arrakis_my_dune__/graphics/icons/wafers.png",
    subgroup = "arrakis-processes",
    order = "aac",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/wafers.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis",
    random_tint_color = item_tints.iron_rust,
    weight = 0.1*kg,
  },

  --- Item declaration for Silicon Filters Item
  {
    type = "item",
    name = "silicon-filter",
    icon = "__arrakis_my_dune__/graphics/icons/silicon-filter.png",
    subgroup = "arrakis-processes",
    order = "aac",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/silicon-filter.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis",
    random_tint_color = item_tints.iron_rust,
    weight = 0.1*kg,
  },

  --- Fluid declaration for Chemical Mud Fluid
  {
    type = "fluid",
    name = "chemical-mud",
    subgroup = "arrakis-processes",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "2kJ",
    base_color = {0.35, 0.15, 0.05},
    flow_color = {0.6, 0.3, 0.1},
    icon = "__arrakis_my_dune__/graphics/icons/fluid/chemical-mud.png",
    order = "a[fluid]-a[water]-a[water]"
  },

  --- Fluid declaration for Polluted Water Fluid
  {
    type = "fluid",
    name = "polluted-water",
    subgroup = "arrakis-processes",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "2kJ",
    base_color = {0.25, 0.3, 0.1},
    flow_color = {0.5, 0.55, 0.2},
    icon = "__arrakis_my_dune__/graphics/icons/fluid/polluted-water.png",
    order = "a[fluid]-a[water]-a[water]"
  },





})