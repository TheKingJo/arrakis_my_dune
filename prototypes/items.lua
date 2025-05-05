local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
  -- Main Item group for defining a new Tab with Arrakis Items in Inventory
  {
    type = "item-group",
    name = "arrakis",
    order = "a",
    icon = "__arrakis_my_dune__/graphics/technology/arrakis-tech-arrakis.png",
    icon_size = 128,
  },

  -- Item Subgroup for defining water production machines in inventory
  {
    type = "item-subgroup",
    name = "arrakis-water-production",
    group = "arrakis",
    order = "aa"
  },

  -- Item declaration for Tier 1 Water Condenser Machine
  {
    type = "item",
    name = "water-condenser",
    icon = "__arrakis_my_dune__/graphics/icons/sand-1.png",
    subgroup = "arrakis-water-production",
    order = "ab",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "water-condenser",
    stack_size = 20,
  },























  -- Item Subgroup for defining general production processes
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
    order = "ba",
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









})