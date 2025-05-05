local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
<<<<<<< Updated upstream

=======
  -- Item Subgroup for defining Sorting Group in the Player Inventory
  {
    type = "item-subgroup",
    name = "water-production",
    group = "production",
    order = "ea"
  },

  -- Tier 1 Water Condenser Machine Item Definition
  {
    type = "item",
    name = "water-condenser",
    icon = "__arrakis_my_dune__/graphics/icons/sand-1.png",
    subgroup = "smelting-machine",
    order = "ffj",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "water-condenser",
    stack_size = 20,
  },
>>>>>>> Stashed changes

--- subgroups
  {
    type = "item-subgroup",
    name = "arrakis2-processes",
    group = "intermediate-products",
    order = "pc"
  },

--- items
--Same as moshine
  {
    type = "item",
    name = "sand",
    icon = "__arrakis_my_dune__/graphics/icons/sand-3.png",
    subgroup = "arrakis2-processes",
    order = "aaa",
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
    default_import_location = "arrakis2",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },
  {
    type = "item",
    name = "silica",
    icon = "__arrakis_my_dune__/graphics/icons/silica.png",
    subgroup = "arrakis2-processes",
    order = "aab",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/silica.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis2",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },
  {
    type = "item",
    name = "silicon",
    icon = "__arrakis_my_dune__/graphics/icons/silicon.png",
    subgroup = "arrakis2-processes",
    order = "aab",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/silicon.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis2",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },
  {
    type = "item",
    name = "silicon-paste",
    icon = "__arrakis_my_dune__/graphics/icons/silicon-paste.png",
    subgroup = "arrakis2-processes",
    order = "aab",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/silicon-paste.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis2",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },
  {
    type = "item",
    name = "treated-sand",
    icon = "__arrakis_my_dune__/graphics/icons/treated-sand.png",
    subgroup = "arrakis2-processes",
    order = "aac",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/treated-sand.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis2",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },
  {
    type = "item",
    name = "metallic-sand",
    icon = "__arrakis_my_dune__/graphics/icons/metallic-sand.png",
    subgroup = "arrakis2-processes",
    order = "aac",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/metallic-sand.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis2",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },
  {
    type = "item",
    name = "mineral-sand",
    icon = "__arrakis_my_dune__/graphics/icons/mineral-sand.png",
    subgroup = "arrakis2-processes",
    order = "aac",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/mineral-sand.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis2",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
  },
  {
    type = "item",
    name = "wafers",
    icon = "__arrakis_my_dune__/graphics/icons/wafers.png",
    subgroup = "arrakis2-processes",
    order = "aac",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/wafers.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis2",
    random_tint_color = item_tints.iron_rust,
    weight = 0.1*kg,
  },
  {
    type = "item",
    name = "silicon-filter",
    icon = "__arrakis_my_dune__/graphics/icons/silicon-filter.png",
    subgroup = "arrakis2-processes",
    order = "aac",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__arrakis_my_dune__/graphics/icons/silicon-filter.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "arrakis2",
    random_tint_color = item_tints.iron_rust,
    weight = 0.1*kg,
  },
  {
    type = "fluid",
    name = "chemical-mud",
    subgroup = "arrakis2-processes",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "2kJ",
    base_color = {0.35, 0.15, 0.05},
    flow_color = {0.6, 0.3, 0.1},
    icon = "__arrakis_my_dune__/graphics/icons/fluid/chemical-mud.png",
    order = "a[fluid]-a[water]-a[water]"
  },
  {
    type = "fluid",
    name = "polluted-water",
    subgroup = "arrakis2-processes",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "2kJ",
    base_color = {0.25, 0.3, 0.1},
    flow_color = {0.5, 0.55, 0.2},
    icon = "__arrakis_my_dune__/graphics/icons/fluid/polluted-water.png",
    order = "a[fluid]-a[water]-a[water]"
  },
})