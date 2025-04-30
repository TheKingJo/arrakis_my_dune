local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({


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
})